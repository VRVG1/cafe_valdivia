import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/utils/logger.dart';
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
      email: 'pedro@pedro.com',
      telefono: '000000000',
    );
    final proveedor3 = Proveedor(
      nombre: 'Link',
      direccion: 'Nintendo',
      email: 'link@link.com',
      telefono: '000000000',
    );

    group("CRUD for proveedor", () {
      test('Create proveedor and getById', () async {
        final id = await proveedorRepository.create(proveedor1);
        expect(id, 1);

        final proveedor = await proveedorRepository.getById(id);

        expect(proveedor.direccion, 'Tamazula');
        expect(proveedor.nombre, 'Ventus');
        expect(proveedor.email, 'ventus@ventus.com');
        expect(proveedor.idProveedor, id);
      });

      test('Detele proveedor and getById throws a exception', () async {
        final id = await proveedorRepository.create(proveedor2);
        expect(id, isNotNull);

        await proveedorRepository.create(proveedor3);
        final proveedores = await proveedorRepository.getAll();
        expect(proveedores.length, 2);

        await proveedorRepository.delete(id);
        expect(
          () => proveedorRepository.getById(id),
          throwsA(isA<Exception>()),
        );
      });

      test('Update proveedor', () async {
        final id = await proveedorRepository.create(proveedor2);
        expect(id, isNotNull);

        final proveedorModificado = proveedor2.copyWith(
          idProveedor: id,
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
        expect(proveedorModificadoRcuperado.email, 'pedro@pedro.com');
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
    // Pruebas de robustez
    group('Robustness Tests', () {
      test('Get non-existent provider throws exception', () {
        expect(
          () => proveedorRepository.getById(999),
          throwsA(isA<Exception>()),
        );
      });

      test('Delete non-existent provider returns 0 rows affected', () async {
        final affectedRows = await proveedorRepository.delete(999);
        expect(affectedRows, 0);
      });

      test('Update non-existent provider returns 0 rows affected', () async {
        final proveedor = Proveedor(
          idProveedor: 999,
          nombre: 'test',
          telefono: '123',
        );
        final affectedRows = await proveedorRepository.update(proveedor);
        expect(affectedRows, 0);
      });

      test('Update provider with null id throws exception', () async {
        final proveedor = Proveedor(nombre: 'test', telefono: '123');
        expect(
          () => proveedorRepository.update(proveedor),
          throwsA(isA<Exception>()),
        );
      });
    });

    // Pruebas de integridad
    group('Integrity Tests', () {
      test(
        'Creating a provider with a duplicate email throws exception',
        () async {
          await proveedorRepository.create(proveedor1);
          final proveedorConMismoEmail = proveedor2.copyWith(
            email: proveedor1.email,
          );

          expect(
            () async =>
                await proveedorRepository.create(proveedorConMismoEmail),
            throwsA(isA<DatabaseException>()),
          );
        },
      );

      test(
        'Updating a provider to have a duplicate email throws exception',
        () async {
          await proveedorRepository.create(proveedor1);
          final id = await proveedorRepository.create(proveedor2);

          final proveedorModificado = proveedor2.copyWith(
            idProveedor: id,
            email: proveedor1.email,
          );

          expect(
            () async => await proveedorRepository.update(proveedorModificado),
            throwsA(isA<DatabaseException>()),
          );
        },
      );
    });

    // Pruebas de rendimiento
    group('Performance Tests', () {
      const int recordCount = 1000;
      test('Create 100 providers', () async {
        final stopwatch = Stopwatch()..start();
        final Batch batch = database.batch();
        for (int i = 0; i < recordCount; i++) {
          batch.insert('Proveedor', {
            'nombre': 'Proveedor $i',
            'telefono': '1234567890',
            'email': 'proveedor$i@test.com',
          });
        }

        final createResult = await batch.commit();
        expect(createResult.length, recordCount);
        appLogger.i(
          'Creacion de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
        );

        final proveedores = await proveedorRepository.getAll();
        expect(proveedores.length, recordCount);
        appLogger.i(
          'Lectura de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
        );
        stopwatch.stop();
        expect(
          stopwatch.elapsed.inSeconds,
          lessThan(5),
          reason: "La creacion y lectura masiva no debe exceder los 5 segundos",
        );
      });
    });

    // Pruebas de validación
    group('Validation Tests', () {
      test('Creating a provider with empty name should fail', () {
        final proveedorInvalido = Proveedor(nombre: '', telefono: '1234567890');
        // Assuming the database schema has a CHECK constraint for non-empty name
        expect(
          () async => await proveedorRepository.create(proveedorInvalido),
          throwsA(isA<DatabaseException>()),
        );
      });
    });
  });
}
