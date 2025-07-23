import 'package:cafe_valdivia/models/cliente.dart';
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

  group("ClienteRepository Test", () {
    late DatabaseHelper databaseHelper;
    late ClienteRepository clienteRepository;
    late Database database;

    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_cliente_repo.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 2,
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

    final cliente = Cliente(
      id: 1,
      nombre: 'Pedro',
      apellido: 'Orderp',
      telefono: '3333333333',
      email: 'ejemplo@ejemplo.com',
    );
    final cliente2 = Cliente(
      nombre: 'Manito',
      apellido: 'Otinam',
      telefono: '1111111111',
      email: 'ejemplo@ejemplo.com',
    );
    final cliente3 = Cliente(
      nombre: 'Sicaru',
      apellido: 'Uracis',
      telefono: '9999999999',
      email: 'ejemplo@ejemplo.com',
    );

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
      expect(() => clienteRepository.getById(id), throwsA(isA<Exception>()));
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
      await clienteRepository.create(cliente2);
      await clienteRepository.create(cliente3);

      var resultados = await clienteRepository.search('Sicaru');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Sicaru');

      resultados = await clienteRepository.search('1111111111');
      expect(resultados.length, 2);

      resultados = await clienteRepository.search('Nada');
      expect(resultados, isEmpty);
    });
  });
}
