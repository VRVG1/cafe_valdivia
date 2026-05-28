import 'package:test/test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/repositorys/orden_produccion_repository.dart';
import 'package:cafe_valdivia/repositorys/receta_repository.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/core/models/orden_produccion.dart';
import 'package:cafe_valdivia/core/models/orden_produccion_consumo.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/models/receta.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('OrdenProduccionRepository CRUD', () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository unidadRepo;
    late ArticuloRepository articuloRepo;
    late RecetaRepository recetaRepo;
    late OrdenProduccionRepository repo;
    late Database database;
    late String path;

    final unidad = UnidadMedida(nombre: 'Kilogramos');
    final insumo = Articulo(
      nombre: 'Café en Grano',
      tipo: ArticuloTipo.insumo,
      idUnidad: 1,
      costoUnitario: 30.0,
      precioVenta: 0.0,
      stock: 100.0,
    );
    final producto = Articulo(
      nombre: 'Café Molido',
      tipo: ArticuloTipo.producto,
      idUnidad: 1,
      costoUnitario: 50.0,
      precioVenta: 120.0,
      stock: 0.0,
    );
    final receta = Receta(
      idArticuloProducto: 2,
      nombre: 'Procesar Café',
      cantidad_base: 1.0,
    );

    Future<int> crearUnidad({String? nombre}) async {
      return await database.insert('Unidad_Medida', {
        'nombre': nombre ?? 'Unidad',
      });
    }

    Future<int> crearArticulo({
      required int unidadId,
      String? nombre,
      String? tipo,
    }) async {
      return await database.insert('Articulo', {
        'nombre': nombre ?? 'Articulo',
        'id_unidad': unidadId,
        'tipo': tipo ?? 'INSUMO',
        'stock': '100.0',
        'costo_unitario': '10.0',
      });
    }

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_orden_produccion_crud.db');
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
      recetaRepo = RecetaRepository(databaseHelper);
      repo = OrdenProduccionRepository(databaseHelper);

      await unidadRepo.create(unidad);
      await articuloRepo.create(insumo);
      await articuloRepo.create(producto);
      await recetaRepo.create(receta);
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    test('registrarOrdenProduccion inserts orden and consumos', () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 10.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 300.0,
      );
      final consumos = [
        OrdenProduccionConsumo(
          idOrdenProduccion: 0,
          idArticulo: 1,
          cantidadUsada: 5.0,
          costoArticuloMomento: 30.0,
        ),
      ];

      final ordenId = await repo.registrarOrdenProduccion(
        orden: orden,
        consumos: consumos,
      );
      expect(ordenId, greaterThan(0));

      final ordenes = await database.query('Orden_Produccion');
      expect(ordenes.length, 1);

      final consumosDb = await database.query('Orden_Produccion_Consumo');
      expect(consumosDb.length, 1);
      expect(consumosDb.first['cantidad_usada'], 5.0);
    });

    test('getFullOrdenProduccion loads view data with consumos', () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 5.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 150.0,
      );
      final consumos = [
        OrdenProduccionConsumo(
          idOrdenProduccion: 0,
          idArticulo: 1,
          cantidadUsada: 2.5,
          costoArticuloMomento: 30.0,
        ),
      ];

      final ordenId = await repo.registrarOrdenProduccion(
        orden: orden,
        consumos: consumos,
      );
      final completa = await repo.getFullOrdenProduccion(ordenId);

      expect(completa['id_orden_produccion'], ordenId);
      expect(completa['cantidad_producida'], 5.0);
      expect(completa['consumos'], hasLength(1));
    });

    test('getAllFullOrdenes returns all orders', () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 10.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 300.0,
      );
      await repo.registrarOrdenProduccion(orden: orden, consumos: []);

      final orden2 = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 20.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 600.0,
      );
      await repo.registrarOrdenProduccion(orden: orden2, consumos: []);

      final todas = await repo.getAllFullOrdenes();
      expect(todas.length, 2);
    });

    test('getConsumosByOrdenId returns consumos for an order', () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 10.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 300.0,
      );
      final consumos = [
        OrdenProduccionConsumo(
          idOrdenProduccion: 0,
          idArticulo: 1,
          cantidadUsada: 5.0,
          costoArticuloMomento: 30.0,
        ),
        OrdenProduccionConsumo(
          idOrdenProduccion: 0,
          idArticulo: 1,
          cantidadUsada: 3.0,
          costoArticuloMomento: 30.0,
        ),
      ];

      final ordenId = await repo.registrarOrdenProduccion(
        orden: orden,
        consumos: consumos,
      );

      final consumosObtenidos = await repo.getConsumosByOrdenId(ordenId);
      expect(consumosObtenidos.length, 2);
      expect(consumosObtenidos.first.idArticulo, 1);
    });

    test('registrarOrdenProduccion with empty consumos does not fail',
        () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 10.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 300.0,
      );

      final ordenId = await repo.registrarOrdenProduccion(
        orden: orden,
        consumos: [],
      );
      expect(ordenId, greaterThan(0));

      final consumos = await database.query('Orden_Produccion_Consumo');
      expect(consumos, isEmpty);
    });

    test('addConsumo inserts a consumo', () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 10.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 300.0,
      );
      final ordenId = await repo.registrarOrdenProduccion(
        orden: orden,
        consumos: [],
      );

      final consumoId = await repo.addConsumo(
        OrdenProduccionConsumo(
          idOrdenProduccion: ordenId,
          idArticulo: 1,
          cantidadUsada: 2.0,
          costoArticuloMomento: 30.0,
        ),
      );
      expect(consumoId, greaterThan(0));

      final consumos = await repo.getConsumosByOrdenId(ordenId);
      expect(consumos.length, 1);
    });

    test('updateConsumo modifies a consumo', () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 10.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 300.0,
      );
      await repo.registrarOrdenProduccion(orden: orden, consumos: []);
      final ordenes = await repo.getAll();
      final ordenId = ordenes.first.idOrdenProduccion!;

      await repo.addConsumo(
        OrdenProduccionConsumo(
          idOrdenProduccion: ordenId,
          idArticulo: 1,
          cantidadUsada: 2.0,
          costoArticuloMomento: 30.0,
        ),
      );

      final consumos = await repo.getConsumosByOrdenId(ordenId);
      final modificado = consumos.first.copyWith(cantidadUsada: 5.0);
      final filas = await repo.updateConsumo(modificado);
      expect(filas, 1);

      final actualizados = await repo.getConsumosByOrdenId(ordenId);
      expect(actualizados.first.cantidadUsada, 5.0);
    });

    test('deleteConsumo removes a consumo', () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 10.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 300.0,
      );
      await repo.registrarOrdenProduccion(orden: orden, consumos: []);
      final ordenes = await repo.getAll();
      final ordenId = ordenes.first.idOrdenProduccion!;

      await repo.addConsumo(
        OrdenProduccionConsumo(
          idOrdenProduccion: ordenId,
          idArticulo: 1,
          cantidadUsada: 2.0,
          costoArticuloMomento: 30.0,
        ),
      );

      final consumos = await repo.getConsumosByOrdenId(ordenId);
      await repo.deleteConsumo(consumos.first.idConsumo!);

      final restantes = await repo.getConsumosByOrdenId(ordenId);
      expect(restantes, isEmpty);
    });

    test('getFullOrdenProduccion throws for non-existent id', () async {
      expect(
        () => repo.getFullOrdenProduccion(9999),
        throwsA(isA<Exception>()),
      );
    });

    test('delete non-existent orden returns 0', () async {
      final filas = await repo.delete(9999);
      expect(filas, 0);
    });

    test('updateConsumo with null id throws', () async {
      expect(
        () => repo.updateConsumo(
          OrdenProduccionConsumo(
            idOrdenProduccion: 1,
            idArticulo: 1,
            cantidadUsada: 1.0,
            costoArticuloMomento: 10.0,
          ),
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('searchByNotas finds matching orders', () async {
      await repo.registrarOrdenProduccion(
        orden: OrdenProduccion(
          idReceta: 1,
          cantidadProducida: 10.0,
          fecha: DateTime.now(),
          costoTotalProduccion: 300.0,
          notas: 'Producción de prueba',
        ),
        consumos: [],
      );
      await repo.registrarOrdenProduccion(
        orden: OrdenProduccion(
          idReceta: 1,
          cantidadProducida: 20.0,
          fecha: DateTime.now(),
          costoTotalProduccion: 600.0,
          notas: 'Otra orden',
        ),
        consumos: [],
      );

      final resultados = await repo.searchByNotas('prueba');
      expect(resultados.length, 1);
      expect(resultados.first.cantidadProducida, 10.0);

      final sinResultados = await repo.searchByNotas('xyz');
      expect(sinResultados, isEmpty);
    });

    test('getByDateRange filters correctly', () async {
      final hoy = DateTime.now();
      final ayer = hoy.subtract(const Duration(days: 1));
      final manana = hoy.add(const Duration(days: 1));

      await repo.registrarOrdenProduccion(
        orden: OrdenProduccion(
          idReceta: 1,
          cantidadProducida: 10.0,
          fecha: hoy,
          costoTotalProduccion: 300.0,
        ),
        consumos: [],
      );

      final rango = await repo.getByDateRange(ayer, manana);
      expect(rango.length, 1);

      final fueraRango = await repo.getByDateRange(
        ayer.subtract(const Duration(days: 10)),
        ayer.subtract(const Duration(days: 5)),
      );
      expect(fueraRango, isEmpty);
    });
  });

  group('OrdenProduccionRepository Stock Consistency', () {
    late DatabaseHelper databaseHelper;
    late OrdenProduccionRepository repo;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_orden_stock.db');
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

      repo = OrdenProduccionRepository(databaseHelper);

      await database.insert('Unidad_Medida', {'nombre': 'Kg'});
      await database.insert('Articulo', {
        'nombre': 'Insumo A',
        'id_unidad': 1,
        'stock': '50.0',
        'costo_unitario': '10.0',
      });
      await database.insert('Articulo', {
        'nombre': 'Producto B',
        'id_unidad': 1,
        'tipo': 'PRODUCTO',
        'stock': '0.0',
        'costo_unitario': '0.0',
      });
      await database.insert('Receta', {
        'id_articulo_producto': 2,
        'nombre': 'Receta B',
        'cantidad_base': 1.0,
      });
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    test('produccion reduce stock de insumos y aumenta stock del producto',
        () async {
      final orden = OrdenProduccion(
        idReceta: 1,
        cantidadProducida: 5.0,
        fecha: DateTime.now(),
        costoTotalProduccion: 50.0,
      );
      final consumos = [
        OrdenProduccionConsumo(
          idOrdenProduccion: 0,
          idArticulo: 1,
          cantidadUsada: 3.0,
          costoArticuloMomento: 10.0,
        ),
      ];

      await repo.registrarOrdenProduccion(
        orden: orden,
        consumos: consumos,
      );

      final insumo = await database.query(
        'Articulo',
        where: 'id_articulo = ?',
        whereArgs: [1],
      );
      expect(double.parse(insumo.first['stock'].toString()), 47.0);

      final producto = await database.query(
        'Articulo',
        where: 'id_articulo = ?',
        whereArgs: [2],
      );
      expect(double.parse(producto.first['stock'].toString()), 5.0);
    });
  });

  group('OrdenProduccionRepository Performance', () {
    late DatabaseHelper databaseHelper;
    late OrdenProduccionRepository repo;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_orden_perf.db');
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

      repo = OrdenProduccionRepository(databaseHelper);

      await database.insert('Unidad_Medida', {'nombre': 'Kg'});
      await database.insert('Articulo', {
        'nombre': 'Insumo',
        'id_unidad': 1,
        'stock': '10000.0',
        'costo_unitario': '5.0',
      });
      await database.insert('Receta', {
        'id_articulo_producto': 1,
        'nombre': 'Receta',
        'cantidad_base': 1.0,
      });
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    test(
      'Bulk insert 100 ordenes completes in reasonable time',
      () async {
        final stopwatch = Stopwatch()..start();

        for (int i = 0; i < 100; i++) {
          await repo.registrarOrdenProduccion(
            orden: OrdenProduccion(
              idReceta: 1,
              cantidadProducida: (i + 1).toDouble(),
              fecha: DateTime.now(),
              costoTotalProduccion: ((i + 1) * 10.0),
            ),
            consumos: [
              OrdenProduccionConsumo(
                idOrdenProduccion: 0,
                idArticulo: 1,
                cantidadUsada: (i + 1).toDouble(),
                costoArticuloMomento: 5.0,
              ),
            ],
          );
        }

        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(60000));

        final ordenes = await database.query('Orden_Produccion');
        expect(ordenes.length, 100);
      },
      timeout: Timeout(const Duration(minutes: 1)),
    );
  });
}
