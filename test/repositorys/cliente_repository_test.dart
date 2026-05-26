import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  final cliente = Cliente(
    idCliente: 1,
    nombre: 'Pedro',
    apellido: 'Orderp',
    telefono: '3333333333',
    email: 'ejemplo@ejemplo.com',
  );
  final cliente2 = Cliente(
    nombre: 'Manito',
    apellido: 'Otinam',
    telefono: '1111111111',
    email: 'ejemplo2@ejemplo.com',
  );
  final cliente3 = Cliente(
    nombre: 'Sicaru',
    apellido: 'Uracis',
    telefono: '9999999999',
    email: 'ejemplo3@ejemplo.com',
  );

  group("ClienteRepository CRUD", () {
    late DatabaseHelper databaseHelper;
    late ClienteRepository clienteRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_cliente_repo.db');
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

      clienteRepository = ClienteRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create client and getById', () async {
      final id = await clienteRepository.create(cliente);

      expect(id, isNotNull);

      final clienteObtenido = await clienteRepository.getById(id);

      expect(clienteObtenido.nombre, cliente.nombre);
      expect(clienteObtenido.apellido, cliente.apellido);
      expect(clienteObtenido.telefono, cliente.telefono);
      expect(clienteObtenido.email, cliente.email);
    });

    test('Delete cliente and getById throws exception', () async {
      final id = await clienteRepository.create(cliente);

      expect(id, isNotNull);

      final filasAfectadas = await clienteRepository.delete(id);

      expect(filasAfectadas, 1);
      expect(clienteRepository.getById(id), throwsA(isA<Exception>()));
    });

    test('Update cliente', () async {
      final id = await clienteRepository.create(cliente);
      expect(id, isNotNull);
      final clienteModificado = cliente.copyWith(
        nombre: 'Ponchis',
        telefono: '000000000',
      );

      final filasAfectadas = await clienteRepository.update(clienteModificado);
      final clienteRecuperadoModificado = await clienteRepository.getById(id);

      expect(filasAfectadas, 1);
      expect(clienteRecuperadoModificado.nombre, 'Ponchis');
      expect(clienteRecuperadoModificado.apellido, 'Orderp');
      expect(clienteRecuperadoModificado.email, 'ejemplo@ejemplo.com');
      expect(clienteRecuperadoModificado.telefono, '000000000');
    });

    test('GetAll clientes returns all clients', () async {
      await clienteRepository.create(cliente);
      await clienteRepository.create(cliente2);
      await clienteRepository.create(cliente3);

      final todosLosClientes = await clienteRepository.getAll();

      expect(todosLosClientes.length, 3);
      expect(todosLosClientes.first.nombre, 'Pedro');
      expect(todosLosClientes.last.nombre, 'Sicaru');
    });

    test('Search client returns correct clientes', () async {
      await clienteRepository.create(cliente);
      await clienteRepository.create(cliente2);
      await clienteRepository.create(cliente3);

      var resultados = await clienteRepository.search('Sicaru');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Sicaru');

      resultados = await clienteRepository.search('1111111111');
      expect(resultados.length, 1);

      resultados = await clienteRepository.search('Nada');
      expect(resultados, isEmpty);
    });

    test('GetAll returns empty list when no clients', () async {
      final todos = await clienteRepository.getAll();
      expect(todos, isEmpty);
    });
  });

  group("ClienteRepository Edge Cases", () {
    late DatabaseHelper databaseHelper;
    late ClienteRepository clienteRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_cliente_edge.db');
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

      clienteRepository = ClienteRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create with empty nombre throws', () async {
      final invalido = Cliente(nombre: '', apellido: 'Valido', email: 'a@b.com');
      expect(clienteRepository.create(invalido), throwsA(isA<Exception>()));
    });

    test('Create with empty apellido throws', () async {
      final invalido = Cliente(nombre: 'Valido', apellido: '', email: 'a@b.com');
      expect(clienteRepository.create(invalido), throwsA(isA<Exception>()));
    });

    test('Create with duplicate email throws', () async {
      await clienteRepository.create(cliente);
      final duplicado = cliente.copyWith(nombre: 'Otro', apellido: 'User');
      expect(clienteRepository.create(duplicado), throwsA(isA<Exception>()));
    });

    test('Update with null ID throws', () async {
      final sinId = Cliente(nombre: 'Sin', apellido: 'Id', email: 's@i.com');
      expect(clienteRepository.update(sinId), throwsA(isA<Exception>()));
    });

    test('Update with empty nombre throws', () async {
      final id = await clienteRepository.create(cliente);
      final invalido = cliente.copyWith(idCliente: id, nombre: '');
      expect(clienteRepository.update(invalido), throwsA(isA<Exception>()));
    });

    test('Update with empty apellido throws', () async {
      final id = await clienteRepository.create(cliente);
      final invalido = cliente.copyWith(idCliente: id, apellido: '');
      expect(clienteRepository.update(invalido), throwsA(isA<Exception>()));
    });

    test('GetById with non-existent ID throws', () async {
      expect(clienteRepository.getById(9999), throwsA(isA<Exception>()));
    });

    test('Search with partial match returns results', () async {
      await clienteRepository.create(cliente);
      await clienteRepository.create(cliente2);

      // Buscar solo parte del nombre (gracias al wildcard %query%)
      final resultados = await clienteRepository.search('Pedr');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Pedro');
    });

    test('Search with special characters does not crash', () async {
      await clienteRepository.create(cliente);

      // Caracteres que no coinciden con ningun registro
      final resultados = await clienteRepository.search('!@#');
      expect(resultados, isEmpty);
    });
  });

  group("ClienteRepository Consistency", () {
    late DatabaseHelper databaseHelper;
    late ClienteRepository clienteRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_cliente_consist.db');
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

      clienteRepository = ClienteRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create → GetAll count matches', () async {
      final id1 = await clienteRepository.create(cliente);
      final id2 = await clienteRepository.create(cliente2);
      final id3 = await clienteRepository.create(cliente3);

      expect(id1, 1);
      expect(id2, 2);
      expect(id3, 3);

      final todos = await clienteRepository.getAll();
      expect(todos.length, 3);
    });

    test('Create → Delete → GetAll count decreases', () async {
      await clienteRepository.create(cliente);
      await clienteRepository.create(cliente2);

      var todos = await clienteRepository.getAll();
      expect(todos.length, 2);

      await clienteRepository.delete(todos.first.idCliente!);

      todos = await clienteRepository.getAll();
      expect(todos.length, 1);
    });

    test('Create → Update → GetById reflects changes', () async {
      final id = await clienteRepository.create(cliente);
      final modificado = cliente.copyWith(
        idCliente: id,
        nombre: 'Actualizado',
        telefono: '5555555555',
      );

      await clienteRepository.update(modificado);
      final recuperado = await clienteRepository.getById(id);

      expect(recuperado.nombre, 'Actualizado');
      expect(recuperado.telefono, '5555555555');
      // Campos no modificados se mantienen
      expect(recuperado.apellido, 'Orderp');
      expect(recuperado.email, 'ejemplo@ejemplo.com');
    });

    test('Multiple create + delete cycle maintains data integrity', () async {
      final ids = <int>[];
      for (int i = 0; i < 10; i++) {
        final c = Cliente(
          nombre: 'Nombre$i',
          apellido: 'Apellido$i',
          email: 'correo$i@test.com',
        );
        final id = await clienteRepository.create(c);
        ids.add(id);
      }

      expect(await clienteRepository.getAll(), hasLength(10));

      // Eliminar los pares
      for (int i = 0; i < ids.length; i += 2) {
        await clienteRepository.delete(ids[i]);
      }

      final restantes = await clienteRepository.getAll();
      expect(restantes, hasLength(5));
      // Verificar que los no-eliminados aun existen
      for (int i = 1; i < ids.length; i += 2) {
        final c = await clienteRepository.getById(ids[i]);
        expect(c.nombre, 'Nombre$i');
      }
    });
  });

  group("ClienteRepository Performance", () {
    late DatabaseHelper databaseHelper;
    late ClienteRepository clienteRepository;
    late Database database;
    late String path;
    // Misma configuracion que CRUD pero en su propio grupo

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_cliente_perf.db');
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

      clienteRepository = ClienteRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Bulk insert 100 clients completes in reasonable time', () async {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 100; i++) {
        final c = Cliente(
          nombre: 'Nombre$i',
          apellido: 'Apellido$i',
          telefono: '555${i.toString().padLeft(7, '0')}',
          email: 'correo$i@test.com',
        );
        await clienteRepository.create(c);
      }

      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(30000));
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('Search performance with 100 records', () async {
      for (int i = 0; i < 100; i++) {
        final c = Cliente(
          nombre: 'Cliente',
          apellido: 'Apellido$i',
          telefono: '555${i.toString().padLeft(7, '0')}',
          email: 'usu$i@test.com',
        );
        await clienteRepository.create(c);
      }

      final stopwatch = Stopwatch()..start();
      final results = await clienteRepository.search('Apellido50');
      stopwatch.stop();

      expect(results.length, 1);
      expect(results.first.apellido, 'Apellido50');
      expect(stopwatch.elapsedMilliseconds, lessThan(5000));
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('GetAll performance with 100 records', () async {
      for (int i = 0; i < 100; i++) {
        final c = Cliente(
          nombre: 'Cliente$i',
          apellido: 'Apellido$i',
          email: 'usu$i@test.com',
        );
        await clienteRepository.create(c);
      }

      final stopwatch = Stopwatch()..start();
      final all = await clienteRepository.getAll();
      stopwatch.stop();

      expect(all.length, 100);
      expect(stopwatch.elapsedMilliseconds, lessThan(5000));
    }, timeout: const Timeout(Duration(minutes: 1)));
  });
}
