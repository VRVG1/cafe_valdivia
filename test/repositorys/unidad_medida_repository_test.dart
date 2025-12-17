import 'dart:math';

import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
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

  group('unidad_medida_respository test', () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRepository respository;
    late Database database;

    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_unidad_medida_repository.db');
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

      respository = UnidadMedidaRepository(databaseHelper);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    Future<int> _crearUnidad(String nombre) async {
      return await respository.create(UnidadMedida(nombre: nombre));
    }

    group("CRUD Operations", () {
      test(
        "Create, GetById, Update and Delete an UnidadMedida successfully",
        () async {
          final unidadId = await _crearUnidad("Sicaru");

          expect(unidadId, isA<int>());

          var unidadRecuperada = await respository.getById(unidadId);
          expect(unidadRecuperada.nombre, "Sicaru");
          expect(unidadRecuperada.idUnidadMedida, unidadId);

          final unidadActualizada = unidadRecuperada.copyWith(nombre: "Manito");
          final filasAfectadas = await respository.update(unidadActualizada);
          expect(filasAfectadas, 1);

          unidadRecuperada = await respository.getById(unidadId);
          expect(unidadRecuperada.nombre, "Manito");

          final filasAfectadasEliminacion = await respository.delete(unidadId);
          expect(filasAfectadasEliminacion, 1);
          expect(
            () => respository.getById(unidadId),
            throwsA(isA<Exception>()),
          );
        },
      );
      test("getAll returns a list of all Unidad de Medida", () async {
        await _crearUnidad("Unidad 1");
        await _crearUnidad("Unidad 2");
        await _crearUnidad("Unidad 3");
        await _crearUnidad("Unidad 4");

        final List<UnidadMedida> todasLasUnidades = await respository.getAll();

        expect(todasLasUnidades.length, 4);
        expect(todasLasUnidades.any((i) => i.nombre == "Unidad 3"), isTrue);
      });
      test('getAll with "where" clause filters correctly', () async {
        await _crearUnidad("Bolsas");
        await _crearUnidad("Bolsas Grandes");
        await _crearUnidad("Botella");
        await _crearUnidad("Bolsas Medianas");

        final List<UnidadMedida> resultado = await respository.getAll(
          where: 'nombre LIKE ?',
          whereArgs: ["%bolsas%"],
        );

        expect(resultado.length, 3);
        expect(
          resultado.any((element) => element.nombre == 'Bolsas Grandes'),
          isTrue,
        );
      });
    });

    group("Robustness and Edge Cases", () {
      test("throws exception if the unidadId does not exist", () {
        expect(() => respository.getById(999), throwsA(isA<Exception>()));
      });

      test("update throws exception for entity with null ID", () {
        final unidadSinID = UnidadMedida(nombre: "Sin ID");
        expect(() => respository.update(unidadSinID), throwsA(isA<Exception>()));
      });

      test("delete returns 0 for non-existent ID", () async {
        final rowsAffected = await respository.delete(999);
        expect(rowsAffected, 0);
      });
      test('create fails for insumo with empty name if constrained', () async {
        final UnidadMedida unidadMedida = UnidadMedida(nombre: "");
        expect(
          () => respository.create(unidadMedida),
          throwsA(isA<DatabaseException>()),
        );
      });
    });
    group("Performance Tests", () {
      const int recordCount = 1000;

      test(
        'handles bulk creation and reading efficiently',
        () async {
          final Stopwatch stopwatch = Stopwatch()..start();

          final Batch batch = database.batch();
          for (int i = 0; i < recordCount; i++) {
            batch.insert('Unidad_Medida', {'nombre': 'UnidadMedida $i'});
          }

          final List<Object?> createResults = await batch.commit();
          expect(createResults.length, recordCount);
          appLogger.i(
            "Creación de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms",
          );

          final List<UnidadMedida> allUnidadMedida = await respository.getAll();
          expect(allUnidadMedida.length, recordCount);
          appLogger.i(
            "Lectura de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms",
          );

          stopwatch.stop();
          expect(
            stopwatch.elapsed.inSeconds,
            lessThan(5),
            reason:
                "La creacion y lectura masiva no debe exceder los 5 segundos.",
          );
        },
        timeout: const Timeout(Duration(seconds: 10)),
      );

      test(
        "handles bulk updates and deletion efficiently",
        () async {
          final Batch batch = database.batch();
          for (int i = 0; i < recordCount; i++) {
            batch.insert('Unidad_Medida', {'nombre': 'UnidadMedida $i'});
          }

          await batch.commit();

          final List<UnidadMedida> allUnidadMedida = await respository.getAll();

          final Stopwatch stopwatch = Stopwatch()..start();

          final Batch updateBatch = database.batch();
          for (final UnidadMedida unidadMedida in allUnidadMedida) {
            updateBatch.update(
              'Unidad_Medida',
              {'nombre': 'UPDATED: ${unidadMedida.nombre}'},
              where: 'id_unidad = ?',
              whereArgs: [unidadMedida.idUnidadMedida],
            );
          }

          await updateBatch.commit(noResult: true);
          appLogger.i(
            'Actualización de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          final Batch deleteBatch = database.batch();
          for (final UnidadMedida unidadMedida in allUnidadMedida) {
            deleteBatch.delete(
              "Unidad_Medida",
              where: 'id_unidad = ?',
              whereArgs: [unidadMedida.idUnidadMedida],
            );
          }
          await deleteBatch.commit(noResult: true);
          final List<UnidadMedida> finalList = await respository.getAll();
          expect(finalList, isEmpty);
          appLogger.i(
            'Borrado de $recordCount y tiempo total: ${stopwatch.elapsedMilliseconds} ms',
          );

          stopwatch.stop();
          expect(
            stopwatch.elapsed.inSeconds,
            lessThan(5),
            reason:
                "La actualización y borrado no deben exceder los 5 segundos",
          );
        },
        timeout: const Timeout(Duration(seconds: 10)),
      );
    });
  });
}
