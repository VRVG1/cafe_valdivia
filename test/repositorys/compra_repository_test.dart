import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:test/test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('CompraRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository unidadRepo;
    late InsumoRepository insumoRepo;
    late ProveedorRepository proveedorRepo;
    late CompraRepository compraRepo;
    late Database database;
    late String path;

    // Funciones de utilidad para crear datos de prueba
    Future<int> crearUnidad({String? nombreUnidad}) async {
      return await unidadRepo.create(
        UnidadMedida(nombre: nombreUnidad ?? 'Unidad'),
      );
    }

    Future<int> crearInsumo(int unidadId, {String? nombre}) async {
      return await insumoRepo.create(
        Insumos(nombre: nombre ?? 'Insumo Test', idUnidad: unidadId),
      );
    }

    Future<int> crearProveedor() async {
      return await proveedorRepo.create(Proveedor(nombre: 'Proveedor Test'));
    }

    Future<Compra> crearCompraCompleta(
      bool paid, {
      String? nombreUnidad,
      String? nombreInsumo,
    }) async {
      final proveedorId = await crearProveedor();
      final unidadId = await crearUnidad(nombreUnidad: nombreUnidad);
      final insumoId = await crearInsumo(unidadId, nombre: nombreInsumo);

      return paid
          ? Compra(
              idProveedor: proveedorId,
              fecha: DateTime.now(),
              pagado: true,
              detallesCompra: [
                DetalleCompra(
                  idInsumo: insumoId,
                  cantidad: 10,
                  precioUnitarioCompra: 5.99,
                ),
              ],
            )
          : Compra(
              idProveedor: proveedorId,
              fecha: DateTime.now(),
              detallesCompra: [
                DetalleCompra(
                  idInsumo: insumoId,
                  cantidad: 10,
                  precioUnitarioCompra: 5.99,
                ),
              ],
            );
    }

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_compra_repository.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 2,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );

      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      unidadRepo = UnidadMedidaRepository(databaseHelper);
      insumoRepo = InsumoRepository(databaseHelper, unidadRepo);
      proveedorRepo = ProveedorRepository(databaseHelper);
      compraRepo = CompraRepository(databaseHelper, proveedorRepo, insumoRepo);
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    // ---------------------- PRUEBAS CRUD ----------------------
    test('createWithDetails inserts compra and detalles', () async {
      final compra = await crearCompraCompleta(false);
      final compraId = await compraRepo.createWithDetails(compra);
      expect(compraId, greaterThan(0));

      // Verificar compra principal
      final compras = await database.query('Compra');
      expect(compras.length, 1);

      // Verificar detalles
      final detalles = await database.query('Detalle_Compra');
      expect(detalles.length, 1);
      expect(detalles.first['cantidad'], 10.0);
    });

    test('getFullCompra loads all relationships', () async {
      final compra = await crearCompraCompleta(false);
      final compraId = await compraRepo.createWithDetails(compra);

      final compraCompleta = await compraRepo.getFullCompra(compraId);

      expect(compraCompleta.proveedor, isNotNull);
      expect(compraCompleta.proveedor!.nombre, 'Proveedor Test');
      expect(compraCompleta.detallesCompra, hasLength(1));
      expect(compraCompleta.detallesCompra.first.insumo, isNotNull);
      expect(compraCompleta.detallesCompra.first.insumo!.nombre, 'Insumo Test');
    });

    test('markAsPaid updates payment status', () async {
      final compra = await crearCompraCompleta(false);
      final compraId = await compraRepo.createWithDetails(compra);

      await compraRepo.markAsPaid(compraId);

      final compraDb = await database.query(
        'Compra',
        where: 'id_compra = ?',
        whereArgs: [compraId],
      );

      expect(compraDb.first['pagado'], 1);
    });

    test('markAsUnpaid updates payment status', () async {
      final compra = await crearCompraCompleta(true);
      final compraId = await compraRepo.createWithDetails(compra);

      await compraRepo.markAsUnpaid(compraId);

      final compraDb = await database.query(
        'Compra',
        where: 'id_compra = ?',
        whereArgs: [compraId],
      );

      expect(compraDb.first['pagado'], 0);
    });

    test('getall returns all compras', () async {
      final venta1 = await crearCompraCompleta(
        true,
        nombreUnidad: "Unidad 1",
        nombreInsumo: "Insumo 1",
      );
      final venta2 = await crearCompraCompleta(
        false,
        nombreUnidad: "Unidad 2",
        nombreInsumo: "Insumo 2",
      );
      await compraRepo.createWithDetails(venta1);
      await compraRepo.createWithDetails(venta2);

      final todasLasVentas = await compraRepo.getAll();

      expect(todasLasVentas.length, 2);
    });
    // ---------------------- PRUEBAS DE INVENTARIO ----------------------
    test('processCompraInventory creates inventory movements', () async {
      final compra = await crearCompraCompleta(false);
      final compraId = await compraRepo.createWithDetails(compra);

      await compraRepo.processCompraInventory(compraId);

      final movimientos = await database.query('Movimiento_Inventario');
      expect(movimientos.length, 1);
      expect(movimientos.first['tipo'], 'Entrada');
      expect(movimientos.first['cantidad'], 10.0);
    });

    // ---------------------- PRUEBAS DE ROBUSTEZ ----------------------
    test('createWithDetails with empty detalles does not fail', () async {
      final proveedorId = await crearProveedor();
      final compra = Compra(
        idProveedor: proveedorId,
        fecha: DateTime.now(),
        detallesCompra: [],
      );

      final compraId = await compraRepo.createWithDetails(compra);
      expect(compraId, greaterThan(0));

      final detalles = await database.query('Detalle_Compra');
      expect(detalles, isEmpty);
    });

    test('getFullCompra throws for non-existent id', () async {
      expect(() => compraRepo.getFullCompra(9999), throwsA(isA<Exception>()));
    });

    test('processCompraInventory handles non-existent compra', () async {
      expect(
        () => compraRepo.processCompraInventory(9999),
        throwsA(isA<Exception>()),
      );
    });

    test('markAsPaid handles non-existent compra', () async {
      final result = await compraRepo.markAsPaid(9999);
      expect(result, isA<int>());
    });

    // ---------------------- PRUEBAS DE RENDIMIENTO ----------------------
    test(
      'Performance: Bulk compra creation with batch',
      () async {
        const recordCount = 5000;
        final stopwatch = Stopwatch()..start();

        final proveedorId = await crearProveedor();
        final unidadId = await crearUnidad();
        final insumoId = await crearInsumo(unidadId);

        final batch = database.batch();
        final compraIds = <int>[];

        // 1. Insertar compras principales
        for (int i = 0; i < recordCount; i++) {
          batch.insert('Compra', {
            'id_proveedor': proveedorId,
            'fecha': DateTime.now().toIso8601String(),
            'pagado': 0,
          });
        }

        // 2. Ejecutar batch y obtener IDs generados
        final results = await batch.commit(noResult: false);
        compraIds.addAll(results.cast<int>());

        // 3. Insertar detalles usando los IDs obtenidos
        final detallesBatch = database.batch();
        for (int i = 0; i < recordCount; i++) {
          detallesBatch.insert('Detalle_Compra', {
            'id_compra': compraIds[i],
            'id_insumo': insumoId,
            'cantidad': i + 1,
            'precio_unitario_compra': (i + 1) * 1.5,
          });
        }
        await detallesBatch.commit(noResult: true);

        print(
          'Creación de $recordCount compras: ${stopwatch.elapsedMilliseconds}ms',
        );

        // Verificación
        final compras = await database.query('Compra');
        expect(compras.length, recordCount);

        final detalles = await database.query('Detalle_Compra');
        expect(detalles.length, recordCount);

        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(1200));
      },
      timeout: Timeout(Duration(seconds: 3)),
    );

    test(
      'Performance: Large compra with multiple detalles',
      () async {
        final stopwatch = Stopwatch()..start();

        // 1. Crear proveedor y unidad
        final proveedorId = await crearProveedor();
        final unidadId = await crearUnidad();

        // 2. Crear 100 insumos usando batch
        final insumoBatch = database.batch();
        for (int i = 0; i < 100; i++) {
          insumoBatch.insert('Insumo', {
            'nombre': 'Insumo ${i + 1}',
            'id_unidad': unidadId,
            'descripcion': null,
          });
        }
        final insumoResults = await insumoBatch.commit(noResult: false);
        final insumoIds = insumoResults.cast<int>();
        print('Creación 100 insumos: ${stopwatch.elapsedMilliseconds}ms');

        // 3. Crear compra principal
        final compraId = await database.insert('Compra', {
          'id_proveedor': proveedorId,
          'fecha': DateTime.now().toIso8601String(),
          'pagado': 0,
          'detalles': null,
        });

        // 4. Crear detalles con batch
        final detallesBatch = database.batch();
        for (int i = 0; i < 100; i++) {
          detallesBatch.insert('Detalle_Compra', {
            'id_compra': compraId,
            'id_insumo': insumoIds[i],
            'cantidad': 10,
            'precio_unitario_compra': 5.99,
          });
        }
        await detallesBatch.commit(noResult: true);
        print('Creación 100 detalles: ${stopwatch.elapsedMilliseconds}ms');

        // 5. Procesar inventario (simulamos la función del repositorio)
        final movimientosBatch = database.batch();
        for (int i = 0; i < 100; i++) {
          movimientosBatch.insert('Movimiento_Inventario', {
            'id_insumo': insumoIds[i],
            'tipo': 'Entrada',
            'cantidad': 10,
            'fecha': DateTime.now().toIso8601String(),
            'id_detalle_compra': i + 1,
          });
        }
        await movimientosBatch.commit(noResult: true);
        print('Procesamiento inventario: ${stopwatch.elapsedMilliseconds}ms');

        final detallesMaps = await database.query(
          'Detalle_Compra',
          where: 'id_compra = ?',
          whereArgs: [compraId],
        );

        print('Obtención compra completa: ${stopwatch.elapsedMilliseconds}ms');
        expect(detallesMaps.length, 100);

        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(1500));
      },
      timeout: Timeout(Duration(seconds: 3)),
    );
  });
}
