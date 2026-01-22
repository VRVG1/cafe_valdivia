import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/venta.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/utils/logger.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  // Inicializar FFI para sqflite en el entorno de prueba (no móvil)
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('VentaRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late VentaRepository ventaRepo;
    late ClienteRepository clienteRepo;
    late ProductoRepository productoRepo;
    late Database database;

    // Datos de prueba reutilizables
    late int clienteId;
    late int productoId1;
    late int productoId2;

    setUp(() async {
      // Usar una base de datos en memoria para cada prueba
      final path = p.join(inMemoryDatabasePath, 'test_venta_repo.db');
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

      // Inicializar repositorios
      final unidadRepo = UnidadMedidaRepository(databaseHelper);
      final insumoRepo = InsumosRepository(databaseHelper, unidadRepo);
      productoRepo = ProductoRepository(databaseHelper, insumoRepo);
      clienteRepo = ClienteRepository(databaseHelper);
      ventaRepo = VentaRepository(databaseHelper, productoRepo, clienteRepo);

      // Crear datos de prueba comunes
      clienteId = await clienteRepo.create(
        Cliente(
          nombre: 'Cliente',
          apellido: 'Prueba',
          telefono: '123456789',
          email: 'cliente@test.com',
        ),
      );
      productoId1 = await productoRepo.create(
        Producto(nombre: 'Café Especial', precioVenta: '15.50'),
      );
      productoId2 = await productoRepo.create(
        Producto(nombre: 'Pastel de Chocolate', precioVenta: '8.00'),
      );
    });

    Future<int> crearCliente() async {
      return await clienteRepo.create(
        Cliente(nombre: "Cliente", apellido: "Prueba"),
      );
    }

    Future<int> crearProducto(String nombre, String precio) async {
      final producto = Producto(nombre: nombre, precioVenta: precio);
      return await productoRepo.create(producto);
    }

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    group('CRUD and Core Logic', () {
      test('should register a new sale with details', () async {
        final venta = Venta(idCliente: clienteId, fecha: DateTime.now());
        final List<DetalleVenta> detalles = [
          DetalleVenta(
            idVenta: 0,
            idProducto: productoId1,
            cantidad: 2,
            precioUnitarioVenta: '15.50',
          ), // 31.0
          DetalleVenta(
            idVenta: 0,
            idProducto: productoId2,
            cantidad: 1,
            precioUnitarioVenta: '8.00',
          ), // 8.0
        ];

        final ventaId = await ventaRepo.registrarNuevaVenta(
          venta: venta,
          detallesVenta: detalles,
        );

        expect(ventaId, greaterThan(0));

        final ventaDb = await database.query(
          'Venta',
          where: 'id_venta = ?',
          whereArgs: [ventaId],
        );
        expect(ventaDb.first['id_cliente'], clienteId);

        final detallesDb = await database.query(
          'Detalle_Venta',
          where: 'id_venta = ?',
          whereArgs: [ventaId],
        );
        expect(detallesDb, hasLength(2));
        expect(detallesDb.first['id_producto'], productoId1);
        expect(detallesDb.first['cantidad'], 2);
      });

      test(
        'should get a full sale with all details and correct total',
        () async {
          final venta = Venta(idCliente: clienteId, fecha: DateTime.now());
          final List<DetalleVenta> detalles = [
            DetalleVenta(
              idVenta: 0,
              idProducto: productoId1,
              cantidad: 2,
              precioUnitarioVenta: '15.50',
            ), // 31.0
            DetalleVenta(
              idVenta: 0,
              idProducto: productoId2,
              cantidad: 1,
              precioUnitarioVenta: '8.00',
            ), // 8.0
          ];
          final ventaId = await ventaRepo.registrarNuevaVenta(
            venta: venta,
            detallesVenta: detalles,
          );

          final ventaCompleta = await ventaRepo.getFullVenta(ventaId: ventaId);

          expect(ventaCompleta['venta'], isNotNull);
          expect(ventaCompleta['venta']['nombre_cliente'], 'Cliente');
          expect(ventaCompleta['venta']['apellido_cliente'], 'Prueba');
          expect(ventaCompleta['detalles'], hasLength(2));
          expect(ventaCompleta['total'], '39.00');
        },
      );

      test('should get all sales', () async {
        // Venta 1
        await ventaRepo.registrarNuevaVenta(
          venta: Venta(idCliente: clienteId, fecha: DateTime.now()),
          detallesVenta: [
            DetalleVenta(
              idVenta: 0,
              idProducto: productoId1,
              cantidad: 1,
              precioUnitarioVenta: '15.50',
            ),
          ],
        );
        // Venta 2
        await ventaRepo.registrarNuevaVenta(
          venta: Venta(idCliente: clienteId, fecha: DateTime.now()),
          detallesVenta: [
            DetalleVenta(
              idVenta: 0,
              idProducto: productoId2,
              cantidad: 2,
              precioUnitarioVenta: '8.00',
            ),
          ],
        );

        final todasLasVentas = await ventaRepo.getAll();

        expect(todasLasVentas, hasLength(2));
        expect(todasLasVentas.first['total'], '16.00');
        expect(todasLasVentas.last['total'], '15.50');
      });

      test('should mark a sale as paid', () async {
        final ventaId = await ventaRepo.registrarNuevaVenta(
          venta: Venta(
            idCliente: clienteId,
            fecha: DateTime.now(),
            pagado: false,
          ),
          detallesVenta: [],
        );

        final result = await ventaRepo.markAsPaid(ventaId);
        expect(result, 1);

        final ventaDb = await database.query(
          'Venta',
          where: 'id_venta = ?',
          whereArgs: [ventaId],
        );
        expect(ventaDb.first['pagado'], 1);
      });

      test('should mark a sale as unpaid', () async {
        final ventaId = await ventaRepo.registrarNuevaVenta(
          venta: Venta(
            idCliente: clienteId,
            fecha: DateTime.now(),
            pagado: true,
          ),
          detallesVenta: [],
        );

        final result = await ventaRepo.markAsUnpaid(ventaId);
        expect(result, 1);

        final ventaDb = await database.query(
          'Venta',
          where: 'id_venta = ?',
          whereArgs: [ventaId],
        );
        expect(ventaDb.first['pagado'], 0);
      });

      test('should mark a sale as nulled (cancelled)', () async {
        final ventaId = await ventaRepo.registrarNuevaVenta(
          venta: Venta(idCliente: clienteId, fecha: DateTime.now()),
          detallesVenta: [],
        );

        final result = await ventaRepo.markAsNulled(ventaId);
        expect(result, 1);

        final ventaDb = await database.query(
          'Venta',
          where: 'id_venta = ?',
          whereArgs: [ventaId],
        );
        // VentaEstado.cancelado.value se asume como 2. Verificar en el modelo.
        expect(ventaDb.first['estado'], VentaEstado.cancelado.value);
      });
    });

    group('Robustness and Error Handling', () {
      test(
        'registrarNuevaVenta should rollback transaction if a detail is invalid',
        () async {
          final venta = Venta(idCliente: clienteId, fecha: DateTime.now());
          final List<DetalleVenta> detallesInvalidos = [
            DetalleVenta(
              idVenta: 0,
              idProducto: 9999, // ID de producto no existente
              cantidad: 1,
              precioUnitarioVenta: '10.0',
            ),
          ];

          await expectLater(
            () => ventaRepo.registrarNuevaVenta(
              venta: venta,
              detallesVenta: detallesInvalidos,
            ),
            throwsA(isA<DatabaseException>()),
          );

          final ventas = await database.query('Venta');
          expect(
            ventas,
            isEmpty,
            reason: 'La venta no debería haberse insertado',
          );
        },
      );

      test(
        'registrarNuevaVenta should succeed with an empty details list',
        () async {
          final venta = Venta(idCliente: clienteId, fecha: DateTime.now());
          final ventaId = await ventaRepo.registrarNuevaVenta(
            venta: venta,
            detallesVenta: [],
          );

          expect(ventaId, greaterThan(0));
          final detallesDb = await database.query(
            'Detalle_Venta',
            where: 'id_venta = ?',
            whereArgs: [ventaId],
          );
          expect(detallesDb, isEmpty);
        },
      );

      test(
        'getFullVenta should throw an exception for a non-existent sale ID',
        () async {
          await expectLater(
            () => ventaRepo.getFullVenta(ventaId: 9999),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                'Exception: No se encontro la venta con el ID: 9999',
              ),
            ),
          );
        },
      );

      test('getAll should return an empty list when no sales exist', () async {
        final ventas = await ventaRepo.getAll();
        expect(ventas, isEmpty);
      });

      test(
        'update methods should handle non-existent sale IDs gracefully',
        () async {
          final nonExistentId = 9999;
          final paidResult = await ventaRepo.markAsPaid(nonExistentId);
          final unpaidResult = await ventaRepo.markAsUnpaid(nonExistentId);
          final nulledResult = await ventaRepo.markAsNulled(nonExistentId);

          expect(paidResult, 0);
          expect(unpaidResult, 0);
          expect(nulledResult, 0);
        },
      );
    });

    group('Performance Tests', () {
      final recordCount = 1000;
      test(
        'should handle registering a large number of sales',
        () async {
          final stopwatch = Stopwatch()..start();

          final int clienteId = await crearCliente();
          final int productoId = await crearProducto("Producto", "12");

          final Batch batch = database.batch();

          for (int i = 0; i < recordCount; i++) {
            batch.insert("Venta", {
              'id_cliente': clienteId,
              'fecha': DateTime.now().toIso8601String(),
              'pagado': 0,
            });
          }

          final results = await batch.commit(noResult: false);
          final ventaIds = results.cast<int>();

          final Batch detallesBatch = database.batch();
          for (int i = 0; i < recordCount; i++) {
            detallesBatch.insert('Detalle_Venta', {
              'id_venta': ventaIds[i],
              'id_producto': productoId,
              'cantidad': i + 1,
              'precio_unitario_venta': ((i + 1) * 1.5).toString(),
            });
          }
          await detallesBatch.commit(noResult: true);
          appLogger.i(
            "Creación de $recordCount ventas: ${stopwatch.elapsedMilliseconds}ms",
          );

          final ventas = await database.query("Venta");
          expect(ventas.length, recordCount);

          final detalles = await database.query('Detalle_Venta');
          expect(detalles.length, recordCount);

          stopwatch.stop();

          expect(stopwatch.elapsed.inSeconds, lessThan(5));
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );

      test(
        'should handle registering a sale with many details',
        () async {
          const detailCount = 200;
          final stopwatch = Stopwatch()..start();

          final int clienteId = await crearCliente();

          final Batch productoBatch = database.batch();
          for (int i = 0; i < detailCount; i++) {
            productoBatch.insert("Producto", {'nombre': 'Producto $i'});
          }

          final productoResults = await productoBatch.commit(noResult: false);
          final productoIds = productoResults.cast<int>();
          appLogger.i(
            "Creacuion de $recordCount productos en ${stopwatch.elapsedMilliseconds} ms",
          );

          final int ventaId = await database.insert('Venta', {
            'id_cliente': clienteId,
            'pagado': 0,
            'fecha': DateTime.now().toIso8601String(),
          });

          final Batch detalleBatch = database.batch();
          for (var i = 0; i < detailCount; i++) {
            detalleBatch.insert("Detalle_Venta", {
              'id_venta': ventaId,
              'id_producto': productoIds[i],
              'cantidad': 10,
              'precio_unitario_venta': '8.00',
            });
          }

          await detalleBatch.commit(noResult: true);
          appLogger.i(
            "Creacion $detailCount detalles: ${stopwatch.elapsedMilliseconds} ms",
          );

          final detallesmap = await database.query(
            'Detalle_Venta',
            whereArgs: [ventaId],
            where: "id_venta = ?",
          );

          appLogger.i(
            "Obtención venta completa: ${stopwatch.elapsedMilliseconds} ms",
          );
          expect(detallesmap.length, detailCount);

          stopwatch.stop();
          expect(stopwatch.elapsed.inSeconds, lessThan(5));
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );

      test(
        'getAll should perform reasonably with a large number of sales',
        () async {
          const recordCount = 100;
          for (int i = 0; i < recordCount; i++) {
            await ventaRepo.registrarNuevaVenta(
              venta: Venta(idCliente: clienteId, fecha: DateTime.now()),
              detallesVenta: [
                DetalleVenta(
                  idVenta: 0,
                  idProducto: productoId1,
                  cantidad: 1,
                  precioUnitarioVenta: '10.0',
                ),
              ],
            );
          }

          final stopwatch = Stopwatch()..start();
          final allVentas = await ventaRepo.getAll();
          stopwatch.stop();

          print(
            'Rendimiento: getAll con $recordCount ventas: ${stopwatch.elapsedMilliseconds}ms',
          );

          expect(allVentas, hasLength(recordCount));
          // `getAll` es costoso por diseño (N+1 queries). Este test establece una línea base.
          expect(stopwatch.elapsedMilliseconds, lessThan(4000));
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );
    });
  });
}
