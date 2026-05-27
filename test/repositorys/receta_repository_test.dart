import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/receta_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  final unidad = UnidadMedida(nombre: 'Kilogramos');

  final articulo = Articulo(
    nombre: 'Café Molido',
    tipo: ArticuloTipo.producto,
    idUnidad: 1,
    costoUnitario: 50.0,
    precioVenta: 120.0,
    stock: 100.0,
  );

  final receta = Receta(
    idReceta: 1,
    idArticuloProducto: 1,
    nombre: 'Receta Café Molido',
    cantidad_base: 1.0,
  );
  final receta2 = Receta(
    idArticuloProducto: 1,
    nombre: 'Receta Capuchino',
    cantidad_base: 0.5,
  );
  final receta3 = Receta(
    idArticuloProducto: 1,
    nombre: 'Receta Latte',
    cantidad_base: 1.5,
  );

  group("RecetaRepository CRUD", () {
    late DatabaseHelper databaseHelper;
    late RecetaRepository recetaRepository;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_receta_crud.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 3,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );
      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);
      recetaRepository = RecetaRepository(databaseHelper);

      await unidadRepository.create(unidad);
      await articuloRepository.create(articulo);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create receta and getById', () async {
      final id = await recetaRepository.create(receta);

      expect(id, isNotNull);

      final obtenida = await recetaRepository.getById(id);

      expect(obtenida.nombre, receta.nombre);
      expect(obtenida.idArticuloProducto, receta.idArticuloProducto);
      expect(obtenida.cantidad_base, receta.cantidad_base);
    });

    test('Delete receta and getById throws exception', () async {
      final id = await recetaRepository.create(receta);

      expect(id, isNotNull);

      final filasAfectadas = await recetaRepository.delete(id);

      expect(filasAfectadas, 1);
      expect(recetaRepository.getById(id), throwsA(isA<Exception>()));
    });

    test('Update receta', () async {
      final id = await recetaRepository.create(receta);
      expect(id, isNotNull);

      final modificada = receta.copyWith(
        idReceta: id,
        nombre: 'Receta Actualizada',
        cantidad_base: 2.0,
      );

      final filasAfectadas = await recetaRepository.update(modificada);
      final recuperada = await recetaRepository.getById(id);

      expect(filasAfectadas, 1);
      expect(recuperada.nombre, 'Receta Actualizada');
      expect(recuperada.cantidad_base, 2.0);
      expect(recuperada.idArticuloProducto, receta.idArticuloProducto);
    });

    test('GetAll recetas returns all recetas', () async {
      await recetaRepository.create(receta);
      await recetaRepository.create(receta2);
      await recetaRepository.create(receta3);

      final todas = await recetaRepository.getAll();

      expect(todas.length, 3);
      expect(todas.first.nombre, 'Receta Café Molido');
      expect(todas.last.nombre, 'Receta Latte');
    });

    test('Search receta returns correct results', () async {
      await recetaRepository.create(receta);
      await recetaRepository.create(receta2);
      await recetaRepository.create(receta3);

      var resultados = await recetaRepository.search('Capuchino');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Receta Capuchino');

      resultados = await recetaRepository.search('Nada');
      expect(resultados, isEmpty);
    });

    test('GetAll returns empty list when no recetas', () async {
      final todas = await recetaRepository.getAll();
      expect(todas, isEmpty);
    });
  });

  group("RecetaRepository Edge Cases", () {
    late DatabaseHelper databaseHelper;
    late RecetaRepository recetaRepository;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_receta_edge.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 3,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );
      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);
      recetaRepository = RecetaRepository(databaseHelper);

      await unidadRepository.create(unidad);
      await articuloRepository.create(articulo);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Update with null ID throws', () async {
      final sinId = Receta(
        idArticuloProducto: 1,
        nombre: 'Sin ID',
        cantidad_base: 1.0,
      );
      expect(recetaRepository.update(sinId), throwsA(isA<Exception>()));
    });

    test('GetById with non-existent ID throws', () async {
      expect(recetaRepository.getById(9999), throwsA(isA<Exception>()));
    });

    test('Delete non-existent returns 0', () async {
      final filas = await recetaRepository.delete(9999);
      expect(filas, 0);
    });

    test('Search with partial match returns results', () async {
      await recetaRepository.create(receta);

      final resultados = await recetaRepository.search('Café');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Receta Café Molido');
    });

    test('Search with special characters does not crash', () async {
      await recetaRepository.create(receta);

      final resultados = await recetaRepository.search('!@#');
      expect(resultados, isEmpty);
    });

    test('Create with non-existent articulo_producto fails', () async {
      final invalida = Receta(
        idArticuloProducto: 999,
        nombre: 'Receta Invalida',
        cantidad_base: 1.0,
      );
      expect(recetaRepository.create(invalida), throwsA(isA<Exception>()));
    });
  });

  group("RecetaRepository Consistency", () {
    late DatabaseHelper databaseHelper;
    late RecetaRepository recetaRepository;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_receta_consist.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 3,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );
      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);
      recetaRepository = RecetaRepository(databaseHelper);

      await unidadRepository.create(unidad);
      await articuloRepository.create(articulo);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create -> GetAll count matches', () async {
      final id1 = await recetaRepository.create(receta);
      final id2 = await recetaRepository.create(receta2);
      final id3 = await recetaRepository.create(receta3);

      expect(id1, 1);
      expect(id2, 2);
      expect(id3, 3);

      final todas = await recetaRepository.getAll();
      expect(todas.length, 3);
    });

    test('Create -> Delete -> GetAll count decreases', () async {
      await recetaRepository.create(receta);
      await recetaRepository.create(receta2);

      var todas = await recetaRepository.getAll();
      expect(todas.length, 2);

      await recetaRepository.delete(todas.first.idReceta!);

      todas = await recetaRepository.getAll();
      expect(todas.length, 1);
    });

    test('Create -> Update -> GetById reflects changes', () async {
      final id = await recetaRepository.create(receta);
      final modificada = receta.copyWith(
        idReceta: id,
        nombre: 'Actualizada',
        cantidad_base: 3.0,
      );

      await recetaRepository.update(modificada);
      final recuperada = await recetaRepository.getById(id);

      expect(recuperada.nombre, 'Actualizada');
      expect(recuperada.cantidad_base, 3.0);
      expect(recuperada.idArticuloProducto, receta.idArticuloProducto);
    });

    test('Multiple create + delete cycle maintains data integrity', () async {
      final ids = <int>[];
      for (int i = 0; i < 10; i++) {
        final r = Receta(
          idArticuloProducto: 1,
          nombre: 'Receta $i',
          cantidad_base: 1.0 + i,
        );
        final id = await recetaRepository.create(r);
        ids.add(id);
      }

      expect(await recetaRepository.getAll(), hasLength(10));

      for (int i = 0; i < ids.length; i += 2) {
        await recetaRepository.delete(ids[i]);
      }

      final restantes = await recetaRepository.getAll();
      expect(restantes, hasLength(5));

      for (int i = 1; i < ids.length; i += 2) {
        final r = await recetaRepository.getById(ids[i]);
        expect(r.nombre, 'Receta $i');
      }
    });
  });

  group("RecetaRepository Performance", () {
    late DatabaseHelper databaseHelper;
    late RecetaRepository recetaRepository;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_receta_perf.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 3,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );
      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);
      recetaRepository = RecetaRepository(databaseHelper);

      await unidadRepository.create(unidad);
      await articuloRepository.create(articulo);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Bulk insert 100 recetas completes in reasonable time', () async {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 100; i++) {
        final r = Receta(
          idArticuloProducto: 1,
          nombre: 'Receta $i',
          cantidad_base: 1.0,
        );
        await recetaRepository.create(r);
      }

      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(60000));
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('GetAll performance with 100 records', () async {
      for (int i = 0; i < 100; i++) {
        final r = Receta(
          idArticuloProducto: 1,
          nombre: 'Receta $i',
          cantidad_base: 1.0,
        );
        await recetaRepository.create(r);
      }

      final stopwatch = Stopwatch()..start();
      final all = await recetaRepository.getAll();
      stopwatch.stop();

      expect(all.length, 100);
      expect(stopwatch.elapsedMilliseconds, lessThan(5000));
    }, timeout: const Timeout(Duration(minutes: 1)));
  });
}
