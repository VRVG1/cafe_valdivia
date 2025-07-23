import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('Proveedor repository Test', () {
    late DatabaseHelper databaseHelper;
    late ProveedorRepository proveedorRepository;
    late Database database;

    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_proveedor_repo.db');
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

      proveedorRepository = ProveedorRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    final proveedor1 = Proveedor(
      nombre: 'Ventus',
      direccion: 'Tamazula',
      email: 'ventus@ventus.com',
      telefono: '2233445566',
    );
    final proveedor2 = Proveedor(
      nombre: 'Pedro',
      direccion: 'Guzman',
      email: 'ventus@ventus.com',
      telefono: '000000000',
    );
    final proveedor3 = Proveedor(
      nombre: 'Link',
      direccion: 'Nintendo',
      email: 'link@link.com',
      telefono: '000000000',
    );

    test('Create proveedor and getById', () async {
      final id = await proveedorRepository.create(proveedor1);
      expect(id, 1);

      final proveedor = await proveedorRepository.getById(id);

      expect(proveedor.direccion, 'Tamazula');
      expect(proveedor.nombre, 'Ventus');
      expect(proveedor.email, 'ventus@ventus.com');
      expect(proveedor.id, id);
    });

    test('Detele proveedor and getById throws a exception', () async {
      final id = await proveedorRepository.create(proveedor2);
      expect(id, isNotNull);

      await proveedorRepository.create(proveedor3);
      final proveedores = await proveedorRepository.getAll();
      expect(proveedores.length, 2);

      await proveedorRepository.delete(id);
      expect(() => proveedorRepository.getById(id), throwsA(isA<Exception>()));
    });

    test('oUpdate proveedor', () async {
      final id = await proveedorRepository.create(proveedor2);
      expect(id, isNotNull);

      final proveedorModificado = proveedor2.copyWith(
        id: id,
        nombre: 'Ponchote',
        direccion: 'Kokoro',
      );

      final rows = await proveedorRepository.update(proveedorModificado);
      final proveedorModificadoRcuperado = await proveedorRepository.getById(
        id,
      );

      expect(rows, 1);
      expect(proveedorModificadoRcuperado.direccion, 'Kokoro');
      expect(proveedorModificadoRcuperado.nombre, 'Ponchote');
      expect(proveedorModificadoRcuperado.email, 'ventus@ventus.com');
      expect(proveedorModificadoRcuperado.telefono, '000000000');
    });

    test('GetAll provedores', () async {
      await proveedorRepository.create(proveedor1);
      await proveedorRepository.create(proveedor2);
      await proveedorRepository.create(proveedor3);

      final proveedores = await proveedorRepository.getAll();

      expect(proveedores.length, 3);
      expect(proveedores.first.nombre, 'Ventus');
      expect(proveedores.last.nombre, 'Link');
    });

    test('Search client returns correct clientes', () async {
      await proveedorRepository.create(proveedor1);
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
  });
}
