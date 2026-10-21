import 'package:cafe_valdivia/repositorys/movimiento_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('MovimientoRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late MovimientoRepository repo;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_movimiento_repository.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 12,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db, version);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );

      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);
      repo = MovimientoRepository(databaseHelper);
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    Future<int> crearUnidad() => database.insert('Unidad_Medida', {
          'nombre': 'Kilogramo',
        });

    Future<int> crearProveedor() => database.insert('Proveedor', {
          'nombre': 'Proveedor Test',
        });

    Future<int> crearCliente() => database.insert('Cliente', {
          'nombre': 'Cliente',
          'apellido': 'Test',
        });

    Future<int> crearArticulo(int unidadId) => database.insert('Articulo', {
          'nombre': 'Cafe Test ${DateTime.now().microsecondsSinceEpoch}',
          'id_unidad': unidadId,
          'costo_unitario': 10,
          'precio_venta': 100,
          'stock': 100.0,
        });

    test('devuelve un mes por cada periodo solicitado', () async {
      final resultado = await repo.movimientoMensual(meses: 12);

      expect(resultado.length, 12);
      expect(resultado.first['periodo'], isA<String>());
      expect(resultado.last['periodo'], isA<String>());
      // Los periodos vienen ordenados de mas antiguo a mas reciente.
      expect(
        (resultado.first['periodo'] as String).compareTo(
          resultado.last['periodo'] as String,
        ),
        lessThan(0),
      );
    });

    test('los meses sin movimientos vienen en cero', () async {
      final resultado = await repo.movimientoMensual(meses: 12);

      for (final fila in resultado) {
        expect(fila['num_ventas'], 0);
        expect(fila['total_ventas'], 0.0);
        expect(fila['num_compras'], 0);
        expect(fila['total_compras'], 0.0);
      }
    });

    test('suma las ventas y compras del mes actual', () async {
      final unidadId = await crearUnidad();
      final articuloId = await crearArticulo(unidadId);
      final clienteId = await crearCliente();
      final proveedorId = await crearProveedor();

      final ahora = DateTime.now();
      final fecha = ahora.toIso8601String();

      final ventaId = await database.insert('Venta', {
        'id_cliente': clienteId,
        'fecha': fecha,
        'pagado': 1,
      });
      await database.insert('Detalle_Venta', {
        'id_venta': ventaId,
        'id_articulo': articuloId,
        'cantidad': 2.0,
        'precio_unitario_venta': 100.0,
      });

      final compraId = await database.insert('Compra', {
        'id_proveedor': proveedorId,
        'fecha': fecha,
        'pagado': 1,
      });
      await database.insert('Detalle_Compra', {
        'id_compra': compraId,
        'id_articulo': articuloId,
        'cantidad': 3.0,
        'precio_unitario_compra': 50.0,
      });

      final resultado = await repo.movimientoMensual(meses: 12);
      final actual = resultado.last;

      expect(actual['num_ventas'], 1);
      expect(actual['total_ventas'], 200.0);
      expect(actual['num_compras'], 1);
      expect(actual['total_compras'], 150.0);
    });
  });
}
