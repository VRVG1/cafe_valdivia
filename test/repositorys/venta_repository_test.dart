import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/insumo_producto.dart';
import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/models/venta.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('VentaRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late VentaRepository ventaRepo;
    late ClienteRepository clienteRepo;
    late ProductoRepository productoRepo;
    late InsumoRepository insumoRepo;
    late UnidadMedidaRepository unidadRepo;
    late Database database;
    late String path;
    late int unidadId;

    // Funciones de utilidad para crear datos de prueba
    Future<int> _crearInsumo(int unidadId, {String? nombre}) async {
      return await insumoRepo.create(
        Insumos(nombre: nombre ?? 'Café en Grano', idUnidad: unidadId),
      );
    }

    Future<int> _crearProducto(
      List<InsumoProducto> insumos, {
      String? nombreProducto,
    }) async {
      final productoId = await productoRepo.create(
        Producto(nombre: nombreProducto ?? 'Café Americano', precioVenta: 2.50),
      );
      for (var insumoRelacion in insumos) {
        await database.insert('Insumo_Producto', {
          'id_producto': productoId,
          'id_insumo': insumoRelacion.idInsumo,
          'cantidad_requerida': insumoRelacion.cantidadRequerida,
        });
      }
      return productoId;
    }

    Future<int> _crearCliente() async {
      return await clienteRepo.create(
        Cliente(nombre: 'Juan', apellido: 'Perez', telefono: '123456789'),
      );
    }

    Future<Venta> _crearVentaCompleta({
      String? nombre,
      String? nombreProducto,
    }) async {
      final clienteId = await _crearCliente();
      final insumoId = await _crearInsumo(unidadId, nombre: nombre);
      final productoId = await _crearProducto([
        InsumoProducto(
          idInsumo: insumoId,
          idProducto: 0,
          cantidadRequerida: 20,
        ), // idProducto es dummy
      ], nombreProducto: nombreProducto);

      return Venta(
        idCliente: clienteId,
        fecha: DateTime.now(),
        detallesVenta: [
          DetalleVenta(
            idProducto: productoId,
            cantidad: 2,
            precioUnitarioVenta: 2.50,
          ),
        ],
      );
    }

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_venta_repository.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 2,
        onCreate:
            (db, version) async => await DatabaseHelper().testOnCreate(db),
        onConfigure: (db) async => await DatabaseHelper().testOnConfigure(db),
      );

      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      // Inicialización de repositorios en el orden de dependencia correcto
      unidadRepo = UnidadMedidaRepository(databaseHelper);
      insumoRepo = InsumoRepository(databaseHelper, unidadRepo);
      productoRepo = ProductoRepository(databaseHelper, insumoRepo);
      clienteRepo = ClienteRepository(databaseHelper);
      ventaRepo = VentaRepository(databaseHelper, productoRepo, clienteRepo);

      unidadId = await unidadRepo.create(UnidadMedida(nombre: 'Gramos'));
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    // ====================== PRUEBAS CRUD ======================
    test('createWithDetails inserts venta and its detalles', () async {
      // ARRANGE: Crear una venta completa con sus detalles
      final venta = await _crearVentaCompleta();

      // ACT: Ejecutar el método para crear la venta en la BD
      final ventaId = await ventaRepo.createWithDetails(venta);

      // ASSERT: Verificar que la venta y sus detalles se crearon correctamente
      expect(ventaId, greaterThan(0));
      final ventas = await database.query('Venta');
      expect(ventas.length, 1);
      final detalles = await database.query('Detalle_Venta');
      expect(detalles.length, 1);
      expect(detalles.first['cantidad'], 2);
    });

    test('getFullVenta loads all relationships correctly', () async {
      // ARRANGE: Crear una venta completa y guardarla
      final venta = await _crearVentaCompleta();
      final ventaId = await ventaRepo.createWithDetails(venta);

      // ACT: Obtener la venta completa con sus relaciones
      final ventaCompleta = await ventaRepo.getFullVenta(ventaId);

      // ASSERT: Verificar que todas las relaciones se cargaron
      expect(ventaCompleta.cliente, isNotNull);
      expect(ventaCompleta.cliente!.nombre, 'Juan');
      expect(ventaCompleta.detallesVenta, hasLength(1));
      expect(ventaCompleta.detallesVenta.first.producto, isNotNull);
      expect(
        ventaCompleta.detallesVenta.first.producto!.nombre,
        'Café Americano',
      );
    });

    test(
      'getVentasByCliente returns all ventas for a specific client',
      () async {
        // ARRANGE: Crear dos ventas para el mismo cliente
        final venta1 = await _crearVentaCompleta();
        await ventaRepo.createWithDetails(venta1);
        await ventaRepo.createWithDetails(
          venta1,
        ); // Crear otra venta para el mismo cliente

        // ACT: Obtener las ventas por ID de cliente
        final ventasCliente = await ventaRepo.getVentasByCliente(
          venta1.idCliente,
        );

        // ASSERT: Verificar que se retornen las dos ventas
        expect(ventasCliente, hasLength(2));
        expect(ventasCliente.first.idCliente, venta1.idCliente);
      },
    );

    // ====================== PRUEBAS DE ROBUSTEZ ======================
    test('createWithDetails with empty detalles does not fail', () async {
      // ARRANGE: Crear una venta sin detalles
      final clienteId = await _crearCliente();
      final venta = Venta(
        idCliente: clienteId,
        fecha: DateTime.now(),
        detallesVenta: [],
      );

      // ACT: Intentar crear la venta
      final ventaId = await ventaRepo.createWithDetails(venta);

      // ASSERT: Verificar que la venta se creó y no hay detalles
      expect(ventaId, greaterThan(0));
      final detalles = await database.query('Detalle_Venta');
      expect(detalles, isEmpty);
    });

    test('getFullVenta throws for non-existent id', () async {
      // ASSERT: Esperar que una llamada con un ID inexistente lance una excepción
      expect(() => ventaRepo.getFullVenta(9999), throwsA(isA<Exception>()));
    });

    test(
      'getVentasByCliente returns empty list for client with no ventas',
      () async {
        // ARRANGE: Crear un cliente sin ventas
        final clienteId = await _crearCliente();

        // ACT: Obtener ventas para ese cliente
        final ventas = await ventaRepo.getVentasByCliente(clienteId);

        // ASSERT: Verificar que la lista esté vacía
        expect(ventas, isEmpty);
      },
    );

    test('getAll returns all ventas', () async {
      final venta1 = await _crearVentaCompleta(
        nombre: "Insumo 1",
        nombreProducto: "Producto 1",
      );
      final venta2 = await _crearVentaCompleta(
        nombre: "Insumo 2",
        nombreProducto: "Producto 2",
      );
      await ventaRepo.createWithDetails(venta1);
      await ventaRepo.createWithDetails(venta2);

      final todasLasVentas = await ventaRepo.getAll();

      expect(todasLasVentas.length, 2);
    });

    // ====================== PRUEBAS DE RENDIMIENTO ======================
    test(
      'Performance: Bulk venta creation with batch',
      () async {
        const recordCount = 1000;
        final stopwatch = Stopwatch()..start();

        // ARRANGE: Crear datos base
        final clienteId = await _crearCliente();
        //final unidadId = await _crearUnidad();
        final insumoId = await _crearInsumo(unidadId, nombre: "Cafe el chido");
        final productoId = await _crearProducto([
          InsumoProducto(
            idInsumo: insumoId,
            idProducto: 0,
            cantidadRequerida: 1,
          ),
        ]);

        final batch = database.batch();
        final ventaIds = <int>[];

        // ACT: Crear N ventas y sus detalles en batch
        for (int i = 0; i < recordCount; i++) {
          batch.insert('Venta', {
            'id_cliente': clienteId,
            'fecha': DateTime.now().toIso8601String(),
            'pagado': 0,
          });
        }
        final results = await batch.commit(noResult: false);
        ventaIds.addAll(results.cast<int>());

        final detallesBatch = database.batch();
        for (int i = 0; i < recordCount; i++) {
          detallesBatch.insert('Detalle_Venta', {
            'id_venta': ventaIds[i],
            'id_producto': productoId,
            'cantidad': 1,
            'precio_unitario_venta': 2.50,
          });
        }
        await detallesBatch.commit(noResult: true);

        stopwatch.stop();
        print(
          'Creación de $recordCount ventas en batch: ${stopwatch.elapsedMilliseconds}ms',
        );

        // ASSERT: Verificar que se crearon todos los registros
        final ventas = await database.query('Venta');
        expect(ventas.length, recordCount);
        final detalles = await database.query('Detalle_Venta');
        expect(detalles.length, recordCount);
        expect(stopwatch.elapsedMilliseconds, lessThan(5000));
      },
      timeout: Timeout(Duration(seconds: 10)),
    );
  });
}
