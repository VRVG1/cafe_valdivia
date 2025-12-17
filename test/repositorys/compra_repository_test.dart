import 'package:test/test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('CompraRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository unidadRepo;
    late InsumosRepository insumoRepo;
    late ProveedorRepository proveedorRepo;
    late CompraRepository compraRepo;
    late Database database;
    late String path;

    // Funciones de utilidad para crear datos de prueba
    Future<int> crearUnidad({String? nombreUnidad}) async {
      return await database.insert('Unidad_Medida', {
        'nombre': nombreUnidad ?? 'Unidad',
      });
    }

    Future<int> crearInsumo({
      required int unidadId,
      String? nombre,
      String? costoUnitario,
    }) async {
      return await database.insert('Insumo', {
        'nombre': nombre ?? 'Insumo Test',
        'id_unidad': unidadId,
        'costo_unitario': costoUnitario ?? "0.0",
      });
    }

    Future<int> crearProveedor() async {
      return await database.insert('Proveedor', {
        'nombre': 'Proveedor Test',
        'telefono': '1234567890',
      });
    }

    Future<Compra> crearCompra(bool paid) async {
      final proveedorId = await crearProveedor();

      return paid
          ? Compra(
              idProveedor: proveedorId,
              fecha: DateTime.now(),
              pagado: true,
            )
          : Compra(idProveedor: proveedorId, fecha: DateTime.now());
    }

    Future<List<DetalleCompra>> crearDetallesCompra({
      int idCompra = 0,
      String? nombreUnidad,
      String? nombreInsumo,
    }) async {
      final unidadId = await crearUnidad(nombreUnidad: nombreUnidad);
      final insumoId = await crearInsumo(
        unidadId: unidadId,
        nombre: nombreInsumo,
      );
      return [
        DetalleCompra(
          idCompra: idCompra,
          idInsumo: insumoId,
          cantidad: 9,
          precioUnitarioCompra: "20.00",
        ),
        DetalleCompra(
          idCompra: idCompra,
          idInsumo: insumoId,
          cantidad: 7,
          precioUnitarioCompra: "19.80",
        ),
        DetalleCompra(
          idCompra: idCompra,
          idInsumo: insumoId,
          cantidad: 2,
          precioUnitarioCompra: "880.20",
        ),
      ];
    }

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_compra_repository.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 3,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db, version);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );

      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      unidadRepo = UnidadMedidaRepository(databaseHelper);
      insumoRepo = InsumosRepository(databaseHelper, unidadRepo);
      proveedorRepo = ProveedorRepository(databaseHelper);
      compraRepo = CompraRepository(databaseHelper, proveedorRepo, insumoRepo);
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    // ---------------------- PRUEBAS CRUD ----------------------
    test('registrarNuevaCompra inserts compra and detalles', () async {
      final compra = await crearCompra(false);
      final detalles = await crearDetallesCompra();
      final compraId = await compraRepo.registrarNuevaCompra(
        compra: compra,
        detallesCompra: detalles,
      );
      expect(compraId, greaterThan(0));

      // Verificar compra principal
      final compras = await database.query('Compra');
      expect(compras.length, 1);

      // Verificar detalles
      final detallesDb = await database.query('Detalle_Compra');
      expect(detallesDb.length, 3);
      expect(detallesDb.first['cantidad'], 9);
    });

    test('getFullCompra loads all relationships', () async {
      final compra = await crearCompra(false);
      final detalles = await crearDetallesCompra();
      final compraId = await compraRepo.registrarNuevaCompra(
        compra: compra,
        detallesCompra: detalles,
      );

      final compraCompleta = await compraRepo.getFullCompra(compraId);

      expect(compraCompleta['compra'], isNotNull);
      expect(compraCompleta['compra']['nombre_proveedor'], 'Proveedor Test');
      expect(compraCompleta['detalles'], hasLength(3));
    });

    test('markAsPaid updates payment status', () async {
      final compra = await crearCompra(false);
      final detalles = await crearDetallesCompra();
      final compraId = await compraRepo.registrarNuevaCompra(
        compra: compra,
        detallesCompra: detalles,
      );

      await compraRepo.markAsPaid(compraId);

      final compraDb = await database.query(
        'Compra',
        where: 'id_compra = ?',
        whereArgs: [compraId],
      );

      expect(compraDb.first['pagado'], 1);
    });

    test('markAsUnpaid updates payment status', () async {
      final compra = await crearCompra(true);
      final detalles = await crearDetallesCompra();
      final compraId = await compraRepo.registrarNuevaCompra(
        compra: compra,
        detallesCompra: detalles,
      );

      await compraRepo.markAsUnpaid(compraId);

      final compraDb = await database.query(
        'Compra',
        where: 'id_compra = ?',
        whereArgs: [compraId],
      );

      expect(compraDb.first['pagado'], 0);
    });

    test('getall returns all compras', () async {
      final compra1 = await crearCompra(true);
      final detalles1 = await crearDetallesCompra(
        nombreUnidad: "Unidad 1",
        nombreInsumo: "Insumo 1",
      );
      await compraRepo.registrarNuevaCompra(
        compra: compra1,
        detallesCompra: detalles1,
      );

      final compra2 = await crearCompra(false);
      final detalles2 = await crearDetallesCompra(
        nombreUnidad: "Unidad 2",
        nombreInsumo: "Insumo 2",
      );
      await compraRepo.registrarNuevaCompra(
        compra: compra2,
        detallesCompra: detalles2,
      );

      final todasLasCompras = await compraRepo.getAll();

      expect(todasLasCompras.length, 2);
    });
    // ---------------------- PRUEBAS DE ROBUSTEZ ----------------------
    test('registrarNuevaCompra with empty detalles does not fail', () async {
      final compra = await crearCompra(false);

      final compraId = await compraRepo.registrarNuevaCompra(
        compra: compra,
        detallesCompra: [],
      );
      expect(compraId, greaterThan(0));

      final detalles = await database.query('Detalle_Compra');
      expect(detalles, isEmpty);
    });

    test('getFullCompra throws for non-existent id', () async {
      expect(() => compraRepo.getFullCompra(9999), throwsA(isA<Exception>()));
    });

    test('markAsPaid handles non-existent compra', () async {
      final result = await compraRepo.markAsPaid(9999);
      expect(result, 0);
    });

    // ---------------------- PRUEBAS DE RENDIMIENTO ----------------------
    test(
      'Performance: Bulk compra creation with batch',
      () async {
        const recordCount = 5000;
        final stopwatch = Stopwatch()..start();

        final proveedorId = await crearProveedor();
        final unidadId = await crearUnidad();
        final insumoId = await crearInsumo(unidadId: unidadId);

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
            'precio_unitario_compra': ((i + 1) * 1.5).toString(),
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
        expect(stopwatch.elapsedMilliseconds, lessThan(3000));
      },
      timeout: Timeout(Duration(seconds: 5)),
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
            'costo_unitario': '1.0',
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
        });

        // 4. Crear detalles con batch
        final detallesBatch = database.batch();
        for (int i = 0; i < 100; i++) {
          detallesBatch.insert('Detalle_Compra', {
            'id_compra': compraId,
            'id_insumo': insumoIds[i],
            'cantidad': 10,
            'precio_unitario_compra': '5.99',
          });
        }
        await detallesBatch.commit(noResult: true);
        print('Creación 100 detalles: ${stopwatch.elapsedMilliseconds}ms');

        final detallesMaps = await database.query(
          'Detalle_Compra',
          where: 'id_compra = ?',
          whereArgs: [compraId],
        );

        print('Obtención compra completa: ${stopwatch.elapsedMilliseconds}ms');
        expect(detallesMaps.length, 100);

        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(3000));
      },
      timeout: Timeout(Duration(seconds: 5)),
    );
  });
}
