import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  final proveedor = Proveedor(
    idProveedor: 1,
    nombre: 'Ventus',
    direccion: 'Tamazula',
    email: 'ventus@ventus.com',
    telefono: '2233445566',
  );
  final proveedor2 = Proveedor(
    nombre: 'Pedro',
    direccion: 'Guzman',
    email: 'pedro@pedro.com',
    telefono: '000000000',
  );
  final proveedor3 = Proveedor(
    nombre: 'Link',
    direccion: 'Nintendo',
    email: 'link@link.com',
    telefono: '000000000',
  );

  group("ProveedorRepository CRUD", () {
    late DatabaseHelper databaseHelper;
    late ProveedorRepository proveedorRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_proveedor_crud.db');
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

      proveedorRepository = ProveedorRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create proveedor and getById', () async {
      final id = await proveedorRepository.create(proveedor);

      expect(id, isNotNull);

      final obtenido = await proveedorRepository.getById(id);

      expect(obtenido.nombre, proveedor.nombre);
      expect(obtenido.direccion, proveedor.direccion);
      expect(obtenido.email, proveedor.email);
      expect(obtenido.telefono, proveedor.telefono);
    });

    test('Delete proveedor and getById throws exception', () async {
      final id = await proveedorRepository.create(proveedor);
      expect(id, isNotNull);

      final filasAfectadas = await proveedorRepository.delete(id);

      expect(filasAfectadas, 1);
      expect(proveedorRepository.getById(id), throwsA(isA<Exception>()));
    });

    test('Update proveedor', () async {
      final id = await proveedorRepository.create(proveedor2);
      expect(id, isNotNull);

      final modificado = proveedor2.copyWith(
        idProveedor: id,
        nombre: 'Ponchote',
        direccion: 'Kokoro',
      );

      final filasAfectadas = await proveedorRepository.update(modificado);
      final recuperado = await proveedorRepository.getById(id);

      expect(filasAfectadas, 1);
      expect(recuperado.nombre, 'Ponchote');
      expect(recuperado.direccion, 'Kokoro');
      expect(recuperado.email, 'pedro@pedro.com');
      expect(recuperado.telefono, '000000000');
    });

    test('GetAll proveedores returns all proveedores', () async {
      await proveedorRepository.create(proveedor);
      await proveedorRepository.create(proveedor2);
      await proveedorRepository.create(proveedor3);

      final todos = await proveedorRepository.getAll();

      expect(todos.length, 3);
      expect(todos.first.nombre, 'Ventus');
      expect(todos.last.nombre, 'Link');
    });

    test('Search proveedor returns correct results', () async {
      await proveedorRepository.create(proveedor);
      await proveedorRepository.create(proveedor2);
      await proveedorRepository.create(proveedor3);

      var resultados = await proveedorRepository.search('Ventus');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Ventus');

      resultados = await proveedorRepository.search('000000000');
      expect(resultados.length, 2);

      resultados = await proveedorRepository.search('Nada');
      expect(resultados, isEmpty);
    });

    test('GetAll returns empty list when no proveedores', () async {
      final todos = await proveedorRepository.getAll();
      expect(todos, isEmpty);
    });
  });

  group("ProveedorRepository Edge Cases", () {
    late DatabaseHelper databaseHelper;
    late ProveedorRepository proveedorRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_proveedor_edge.db');
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

      proveedorRepository = ProveedorRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create with empty nombre throws', () async {
      final invalido = Proveedor(nombre: '', telefono: '1234567890');
      expect(proveedorRepository.create(invalido), throwsA(isA<Exception>()));
    });

    test('Create with duplicate email throws', () async {
      await proveedorRepository.create(proveedor);
      final duplicado = proveedor2.copyWith(email: proveedor.email);
      expect(proveedorRepository.create(duplicado), throwsA(isA<Exception>()));
    });

    test('Update with null ID throws', () async {
      final sinId = Proveedor(nombre: 'Sin ID');
      expect(proveedorRepository.update(sinId), throwsA(isA<Exception>()));
    });

    test('GetById with non-existent ID throws', () async {
      expect(proveedorRepository.getById(999), throwsA(isA<Exception>()));
    });

    test('Delete non-existent returns 0', () async {
      final filas = await proveedorRepository.delete(999);
      expect(filas, 0);
    });

    test('Update non-existent returns 0', () async {
      final inexistente = Proveedor(
        idProveedor: 999,
        nombre: 'test',
        telefono: '123',
      );
      final filas = await proveedorRepository.update(inexistente);
      expect(filas, 0);
    });

    test('Update with duplicate email throws', () async {
      await proveedorRepository.create(proveedor);
      final id = await proveedorRepository.create(proveedor2);

      final modificado = proveedor2.copyWith(
        idProveedor: id,
        email: proveedor.email,
      );

      expect(proveedorRepository.update(modificado), throwsA(isA<Exception>()));
    });

    test('Search with partial match returns results', () async {
      await proveedorRepository.create(proveedor);
      await proveedorRepository.create(proveedor2);

      final resultados = await proveedorRepository.search('Vent');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Ventus');
    });

    test('Search with special characters does not crash', () async {
      await proveedorRepository.create(proveedor);

      final resultados = await proveedorRepository.search('!@#');
      expect(resultados, isEmpty);
    });
  });

  group("ProveedorRepository Consistency", () {
    late DatabaseHelper databaseHelper;
    late ProveedorRepository proveedorRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_proveedor_consist.db');
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

      proveedorRepository = ProveedorRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create -> GetAll count matches', () async {
      final id1 = await proveedorRepository.create(proveedor);
      final id2 = await proveedorRepository.create(proveedor2);
      final id3 = await proveedorRepository.create(proveedor3);

      expect(id1, 1);
      expect(id2, 2);
      expect(id3, 3);

      final todos = await proveedorRepository.getAll();
      expect(todos.length, 3);
    });

    test('Create -> Delete -> GetAll count decreases', () async {
      await proveedorRepository.create(proveedor);
      await proveedorRepository.create(proveedor2);

      var todos = await proveedorRepository.getAll();
      expect(todos.length, 2);

      await proveedorRepository.delete(todos.first.idProveedor!);

      todos = await proveedorRepository.getAll();
      expect(todos.length, 1);
    });

    test('Create -> Update -> GetById reflects changes', () async {
      final id = await proveedorRepository.create(proveedor);
      final modificado = proveedor.copyWith(
        idProveedor: id,
        nombre: 'Actualizado',
        direccion: 'Nueva Dir',
      );

      await proveedorRepository.update(modificado);
      final recuperado = await proveedorRepository.getById(id);

      expect(recuperado.nombre, 'Actualizado');
      expect(recuperado.direccion, 'Nueva Dir');
      expect(recuperado.email, 'ventus@ventus.com');
    });

    test('Multiple create + delete cycle maintains data integrity', () async {
      final ids = <int>[];
      for (int i = 0; i < 10; i++) {
        final p = Proveedor(
          nombre: 'Proveedor $i',
          telefono: '555${i.toString().padLeft(7, '0')}',
          email: 'prov$i@test.com',
        );
        final id = await proveedorRepository.create(p);
        ids.add(id);
      }

      expect(await proveedorRepository.getAll(), hasLength(10));

      for (int i = 0; i < ids.length; i += 2) {
        await proveedorRepository.delete(ids[i]);
      }

      final restantes = await proveedorRepository.getAll();
      expect(restantes, hasLength(5));

      for (int i = 1; i < ids.length; i += 2) {
        final p = await proveedorRepository.getById(ids[i]);
        expect(p.nombre, 'Proveedor $i');
      }
    });
  });

  group("ProveedorRepository Performance", () {
    late DatabaseHelper databaseHelper;
    late ProveedorRepository proveedorRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_proveedor_perf.db');
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

      proveedorRepository = ProveedorRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Bulk insert 100 proveedores completes in reasonable time', () async {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 100; i++) {
        final p = Proveedor(
          nombre: 'Proveedor $i',
          telefono: '1234567890',
          email: 'prov$i@test.com',
        );
        await proveedorRepository.create(p);
      }

      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(60000));
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('GetAll performance with 100 records', () async {
      for (int i = 0; i < 100; i++) {
        final p = Proveedor(
          nombre: 'Proveedor $i',
          telefono: '1234567890',
          email: 'prov$i@test.com',
        );
        await proveedorRepository.create(p);
      }

      final stopwatch = Stopwatch()..start();
      final all = await proveedorRepository.getAll();
      stopwatch.stop();

      expect(all.length, 100);
      expect(stopwatch.elapsedMilliseconds, lessThan(5000));
    }, timeout: const Timeout(Duration(minutes: 1)));
  });
}
