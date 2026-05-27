import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  final unidad = UnidadMedida(nombre: 'Kilogramos');
  final unidad2 = UnidadMedida(nombre: 'Litros');
  final unidad3 = UnidadMedida(nombre: 'Unidades');

  group("UnidadMedidaRepository CRUD", () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository repository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_unidad_medida_crud.db');
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

      repository = UnidadMedidaRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create unidad and getById', () async {
      final id = await repository.create(unidad);

      expect(id, isNotNull);

      final obtenida = await repository.getById(id);

      expect(obtenida.nombre, unidad.nombre);
      expect(obtenida.idUnidadMedida, id);
    });

    test('Delete unidad and getById throws exception', () async {
      final id = await repository.create(unidad);

      expect(id, isNotNull);

      final filasAfectadas = await repository.delete(id);

      expect(filasAfectadas, 1);
      expect(repository.getById(id), throwsA(isA<Exception>()));
    });

    test('Update unidad', () async {
      final id = await repository.create(unidad);
      expect(id, isNotNull);

      final modificada = unidad.copyWith(
        idUnidadMedida: id,
        nombre: 'Kilogramos Actualizado',
      );

      final filasAfectadas = await repository.update(modificada);
      final recuperada = await repository.getById(id);

      expect(filasAfectadas, 1);
      expect(recuperada.nombre, 'Kilogramos Actualizado');
    });

    test('GetAll unidades returns all unidades', () async {
      await repository.create(unidad);
      await repository.create(unidad2);
      await repository.create(unidad3);

      final todas = await repository.getAll();

      expect(todas.length, 3);
      expect(todas.any((u) => u.nombre == 'Kilogramos'), isTrue);
      expect(todas.any((u) => u.nombre == 'Litros'), isTrue);
      expect(todas.any((u) => u.nombre == 'Unidades'), isTrue);
    });

    test('GetAll with where clause filters correctly', () async {
      await repository.create(UnidadMedida(nombre: 'Bolsas'));
      await repository.create(UnidadMedida(nombre: 'Bolsas Grandes'));
      await repository.create(UnidadMedida(nombre: 'Botella'));
      await repository.create(UnidadMedida(nombre: 'Bolsas Medianas'));

      final resultado = await repository.getAll(
        where: 'nombre LIKE ?',
        whereArgs: ['%bolsas%'],
      );

      expect(resultado.length, 3);
      expect(resultado.any((u) => u.nombre == 'Bolsas Grandes'), isTrue);
    });

    test('GetAll returns empty list when no unidades', () async {
      final todas = await repository.getAll();
      expect(todas, isEmpty);
    });
  });

  group("UnidadMedidaRepository Edge Cases", () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository repository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_unidad_medida_edge.db');
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

      repository = UnidadMedidaRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('GetById with non-existent ID throws', () async {
      expect(repository.getById(999), throwsA(isA<Exception>()));
    });

    test('Update with null ID throws', () async {
      final sinId = UnidadMedida(nombre: 'Sin ID');
      expect(repository.update(sinId), throwsA(isA<Exception>()));
    });

    test('Delete non-existent returns 0', () async {
      final filas = await repository.delete(999);
      expect(filas, 0);
    });
  });

  group("UnidadMedidaRepository Consistency", () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository repository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_unidad_medida_consist.db');
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

      repository = UnidadMedidaRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create -> GetAll count matches', () async {
      final id1 = await repository.create(unidad);
      final id2 = await repository.create(unidad2);
      final id3 = await repository.create(unidad3);

      expect(id1, 1);
      expect(id2, 2);
      expect(id3, 3);

      final todas = await repository.getAll();
      expect(todas.length, 3);
    });

    test('Create -> Delete -> GetAll count decreases', () async {
      await repository.create(unidad);
      await repository.create(unidad2);

      var todas = await repository.getAll();
      expect(todas.length, 2);

      await repository.delete(todas.first.idUnidadMedida!);

      todas = await repository.getAll();
      expect(todas.length, 1);
    });

    test('Create -> Update -> GetById reflects changes', () async {
      final id = await repository.create(unidad);
      final modificada = unidad.copyWith(
        idUnidadMedida: id,
        nombre: 'Actualizado',
      );

      await repository.update(modificada);
      final recuperada = await repository.getById(id);

      expect(recuperada.nombre, 'Actualizado');
    });

    test('Multiple create + delete cycle maintains data integrity', () async {
      final ids = <int>[];
      for (int i = 0; i < 10; i++) {
        final u = UnidadMedida(nombre: 'Unidad $i');
        final id = await repository.create(u);
        ids.add(id);
      }

      expect(await repository.getAll(), hasLength(10));

      for (int i = 0; i < ids.length; i += 2) {
        await repository.delete(ids[i]);
      }

      final restantes = await repository.getAll();
      expect(restantes, hasLength(5));

      for (int i = 1; i < ids.length; i += 2) {
        final r = await repository.getById(ids[i]);
        expect(r.nombre, 'Unidad $i');
      }
    });
  });

  group("UnidadMedidaRepository Performance", () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository repository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_unidad_medida_perf.db');
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

      repository = UnidadMedidaRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Bulk insert 100 unidades completes in reasonable time', () async {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 100; i++) {
        await repository.create(UnidadMedida(nombre: 'Unidad $i'));
      }

      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(60000));
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('GetAll performance with 100 records', () async {
      for (int i = 0; i < 100; i++) {
        await repository.create(UnidadMedida(nombre: 'Unidad $i'));
      }

      final stopwatch = Stopwatch()..start();
      final all = await repository.getAll();
      stopwatch.stop();

      expect(all.length, 100);
      expect(stopwatch.elapsedMilliseconds, lessThan(5000));
    }, timeout: const Timeout(Duration(minutes: 1)));
  });
}
