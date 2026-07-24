import 'package:test/test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:cafe_valdivia/core/utils/exceptions.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/venta.dart';
import 'package:cafe_valdivia/core/models/detalle_venta.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('VentaRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late ClienteRepository clienteRepo;
    late VentaRepository ventaRepo;
    late ArticuloRepository articuloRepo;
    late UnidadMedidaRepository unidadRepo;
    late Database database;
    late String path;

    Future<int> crearCliente({String? nombre}) async {
      return await clienteRepo.create(
        Cliente(
          nombre: nombre ?? 'Cliente Test',
          apellido: 'Apellido',
          telefono: '1234567890',
          email: '${nombre ?? 'cliente'}@test.com',
        ),
      );
    }

    Future<int> crearArticulo({String? nombre}) async {
      final unidadId = await unidadRepo.create(
        UnidadMedida(nombre: 'Unidad'),
      );
      return await articuloRepo.create(
        Articulo(
          nombre: nombre ?? 'Articulo Test',
          tipo: ArticuloTipo.producto,
          idUnidad: unidadId,
          costoUnitario: 50.0,
          precioVenta: 100.0,
          stock: 100.0,
        ),
      );
    }

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_venta_repository.db');
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
      articuloRepo = ArticuloRepository(databaseHelper, unidadRepo);
      clienteRepo = ClienteRepository(databaseHelper);
      ventaRepo = VentaRepository(databaseHelper, clienteRepo);
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    test('registrarNuevaVenta sets activo and updated_at', () async {
      final clienteId = await crearCliente();
      final articuloId = await crearArticulo();

      final ventaId = await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: true,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [
          DetalleVenta(
            idVenta: 0,
            idArticulo: articuloId,
            cantidad: 2.0,
            precioUnitarioVenta: 100.0,
          ),
        ],
      );

      final ventaDb = await database.query(
        'Venta',
        where: 'id_venta = ?',
        whereArgs: [ventaId],
      );

      expect(ventaId, greaterThan(0));
      expect(ventaDb.first['activo'], 1);
      expect(ventaDb.first['updated_at'], isNotNull);
    });

    test('markAsPaid updates payment status and updated_at', () async {
      final clienteId = await crearCliente();
      final articuloId = await crearArticulo();

      final ventaId = await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: false,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [
          DetalleVenta(
            idVenta: 0,
            idArticulo: articuloId,
            cantidad: 1.0,
            precioUnitarioVenta: 100.0,
          ),
        ],
      );

      await ventaRepo.markAsPaid(ventaId);

      final ventaDb = await database.query(
        'Venta',
        where: 'id_venta = ?',
        whereArgs: [ventaId],
      );

      expect(ventaDb.first['pagado'], 1);
      expect(ventaDb.first['updated_at'], isNotNull);
    });

    test('markAsUnpaid updates payment status and updated_at', () async {
      final clienteId = await crearCliente();
      final articuloId = await crearArticulo();

      final ventaId = await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: true,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [
          DetalleVenta(
            idVenta: 0,
            idArticulo: articuloId,
            cantidad: 1.0,
            precioUnitarioVenta: 100.0,
          ),
        ],
      );

      await ventaRepo.markAsUnpaid(ventaId);

      final ventaDb = await database.query(
        'Venta',
        where: 'id_venta = ?',
        whereArgs: [ventaId],
      );

      expect(ventaDb.first['pagado'], 0);
      expect(ventaDb.first['updated_at'], isNotNull);
    });

    test('markAsNulled updates estado and updated_at', () async {
      final clienteId = await crearCliente();
      final articuloId = await crearArticulo();

      final ventaId = await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: true,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [
          DetalleVenta(
            idVenta: 0,
            idArticulo: articuloId,
            cantidad: 1.0,
            precioUnitarioVenta: 100.0,
          ),
        ],
      );

      await ventaRepo.markAsNulled(ventaId);

      final ventaDb = await database.query(
        'Venta',
        where: 'id_venta = ?',
        whereArgs: [ventaId],
      );

      expect(ventaDb.first['estado'], VentaEstado.cancelado.value);
      expect(ventaDb.first['updated_at'], isNotNull);
    });

    test('getAll excludes soft-deleted ventas', () async {
      final clienteId = await crearCliente();
      final articuloId = await crearArticulo();

      final ventaId1 = await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: true,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [
          DetalleVenta(
            idVenta: 0,
            idArticulo: articuloId,
            cantidad: 1.0,
            precioUnitarioVenta: 100.0,
          ),
        ],
      );

      await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: true,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [
          DetalleVenta(
            idVenta: 0,
            idArticulo: articuloId,
            cantidad: 1.0,
            precioUnitarioVenta: 100.0,
          ),
        ],
      );

      var todas = await ventaRepo.getAll();
      expect(todas.length, 2);

      await ventaRepo.delete(ventaId1);

      todas = await ventaRepo.getAll();
      expect(todas.length, 1);
    });

    test('forceDelete on venta with detalles throws RelacionExistenteException',
        () async {
      final clienteId = await crearCliente();
      final articuloId = await crearArticulo();

      final ventaId = await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: true,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [
          DetalleVenta(
            idVenta: 0,
            idArticulo: articuloId,
            cantidad: 1.0,
            precioUnitarioVenta: 100.0,
          ),
        ],
      );

      expect(
        () => ventaRepo.forceDelete(ventaId),
        throwsA(isA<RelacionExistenteException>()),
      );
    });

    test('registrarNuevaVenta with empty detalles does not fail', () async {
      final clienteId = await crearCliente();

      final ventaId = await ventaRepo.registrarNuevaVenta(
        venta: Venta(
          idCliente: clienteId,
          fecha: DateTime.now(),
          pagado: false,
          estado: VentaEstado.completa,
        ),
        detallesVenta: [],
      );

      expect(ventaId, greaterThan(0));

      final detalles = await database.query('Detalle_Venta');
      expect(detalles, isEmpty);
    });
  });
}
