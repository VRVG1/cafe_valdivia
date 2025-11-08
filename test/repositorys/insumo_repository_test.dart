import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
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

  group('InsumosRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late InsumosRepository insumoRepository;
    late UnidadMedidaRepository unidadMedidaRepository;
    late Database database;

    Future<int> _crearUnidad(String nombre) async {
      return await unidadMedidaRepository.create(UnidadMedida(nombre: nombre));
    }

    Future<int> _crearInsumo(String nombre, int unidadId, String costo) async {
      return await insumoRepository.create(
        Insumo(nombre: nombre, idUnidad: unidadId, costoUnitario: costo),
      );
    }

    setUp(() async {
      final path = p.join(inMemoryDatabasePath, 'test_insumos_repository.db');
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

      unidadMedidaRepository = UnidadMedidaRepository(databaseHelper);
      insumoRepository = InsumosRepository(
        databaseHelper,
        unidadMedidaRepository,
      );
    });

    tearDown(() async {
      if (database.isOpen) {
        await database.close();
      }
    });

    group('CRUD Operations', () {
      test(
        'Create, GetById, Update, and Delete an Insumo successfully',
        () async {
          final unidadId = await _crearUnidad('Kilogramo');
          final nuevoInsumo = Insumo(
            nombre: 'Café en Grano',
            idUnidad: unidadId,
            costoUnitario: "212.0",
          );

          final insumoId = await insumoRepository.create(nuevoInsumo);
          expect(insumoId, isA<int>());

          var insumoRecuperado = await insumoRepository.getById(insumoId);
          expect(insumoRecuperado.nombre, 'Café en Grano');
          expect(insumoRecuperado.idUnidad, unidadId);

          final insumoActualizado = insumoRecuperado.copyWith(
            nombre: 'Café Tostado',
          );
          final rowsAffectedUpdate = await insumoRepository.update(
            insumoActualizado,
          );
          expect(rowsAffectedUpdate, 1);

          insumoRecuperado = await insumoRepository.getById(insumoId);
          expect(insumoRecuperado.nombre, 'Café Tostado');

          final rowsAffectedDelete = await insumoRepository.delete(insumoId);
          expect(rowsAffectedDelete, 1);
          expect(
            () => insumoRepository.getById(insumoId),
            throwsA(isA<Exception>()),
          );
        },
      );

      test('getAll returns a list of all insumos', () async {
        final unidadId = await _crearUnidad('Kilogramos');
        await _crearInsumo('Insumo A', unidadId, "666");
        await _crearInsumo('Insumo B', unidadId, "65.20");
        await _crearInsumo('Insumo C', unidadId, "21");

        final todosLosInsumos = await insumoRepository.getAll();

        expect(todosLosInsumos.length, 3);
        expect(todosLosInsumos.any((i) => i.nombre == 'Insumo B'), isTrue);
      });

      test('getAll with "where" clause filters correctly', () async {
        final unidadId = await _crearUnidad('Litro');
        await _crearInsumo('Leche Entera', unidadId, "20.5");
        await _crearInsumo('Leche Descremada', unidadId, "22.5");
        await _crearInsumo('Crema de Leche', unidadId, "30.0");

        final resultado = await insumoRepository.getAll(
          where: 'nombre LIKE ?',
          whereArgs: ['%Leche%'],
        );

        expect(resultado.length, 3);
        expect(resultado.any((i) => i.nombre == 'Crema de Leche'), isTrue);
      });
    });

    group('Business Logic', () {
      group('getInsumosConUnidad', () {
        test(
          'returns correct unit and a list of multiple insumos associated with it',
          () async {
            final unidadId = await _crearUnidad('Pieza');
            await _crearInsumo('Taza', unidadId, "50.0");
            await _crearInsumo('Plato', unidadId, "40.0");

            final (unidad, insumos) = await insumoRepository
                .getInsumoByIdUnidad(idUnidad: unidadId);

            expect(unidad.nombre, 'Pieza');
            expect(insumos.length, 2);
            expect(insumos.any((i) => i.nombre == 'Taza'), isTrue);
          },
        );

        test(
          'returns correct unit and an empty list if unit has no insumos',
          () async {
            final unidadId = await _crearUnidad('Caja');

            final (unidad, insumos) = await insumoRepository
                .getInsumoByIdUnidad(idUnidad: unidadId);

            expect(unidad.nombre, 'Caja');
            expect(insumos, isEmpty);
          },
        );

        test('throws exception if the unidadId does not exist', () {
          const idUnidadInexistente = 999;

          expect(
            () => insumoRepository.getInsumoByIdUnidad(
              idUnidad: idUnidadInexistente,
            ),
            throwsA(isA<Exception>()),
          );
        });
      });

      group('getCostoPromedio', () {
        test('calculates weighted average cost correctly', () async {
          final proveedorId = await database.insert('Proveedor', {
            'nombre': 'Proveedor de Vasos',
          });
          final compraId1 = await database.insert('Compra', {
            'id_proveedor': proveedorId,
            'fecha': DateTime.now().toIso8601String(),
          });
          final compraId2 = await database.insert('Compra', {
            'id_proveedor': proveedorId,
            'fecha': DateTime.now().toIso8601String(),
          });
          final unidadId = await _crearUnidad('Unidad');
          final insumoId = await _crearInsumo(
            'Vaso Desechable',
            unidadId,
            "22.22",
          );

          await database.insert('Detalle_Compra', {
            'id_compra': compraId1,
            'id_insumo': insumoId,
            'cantidad': 100,
            'precio_unitario_compra': 1.50,
          });
          await database.insert('Detalle_Compra', {
            'id_compra': compraId2,
            'id_insumo': insumoId,
            'cantidad': 50,
            'precio_unitario_compra': 2.00,
          });

          final costoPromedio = await insumoRepository.getCostoPromedio(
            insumoId,
          );

          expect(costoPromedio, closeTo(1.66, 0.01));
        });

        test('returns 0.0 if insumo has no purchase history', () async {
          final unidadId = await _crearUnidad('Gramo');
          final insumoId = await _crearInsumo('Azafrán', unidadId, "999");

          final costoPromedio = await insumoRepository.getCostoPromedio(
            insumoId,
          );

          expect(costoPromedio, 0.0);
        });

        test('returns 0.0 for non-existent insumoId', () async {
          final costoPromedio = await insumoRepository.getCostoPromedio(999);

          expect(costoPromedio, 0.0);
        });
      });
    });

    group('Robustness and Edge Cases', () {
      test('getById throws exception for non-existent ID', () {
        expect(() => insumoRepository.getById(999), throwsA(isA<Exception>()));
      });

      test('update throws exception for entity with null ID', () {
        final insumoSinId = Insumo(
          nombre: 'Insumo Fantasma',
          idUnidad: 1,
          costoUnitario: "99.99",
        );
        expect(
          () => insumoRepository.update(insumoSinId),
          throwsA(isA<Exception>()),
        );
      });

      test('delete returns 0 for non-existent ID', () async {
        final rowsAffected = await insumoRepository.delete(999);
        expect(rowsAffected, 0);
      });

      test(
        'create fails with foreign key violation for non-existent unidad',
        () async {
          final insumoInvalido = Insumo(
            nombre: 'Insumo Roto',
            idUnidad: 999,
            costoUnitario: "29.0",
          );

          expect(
            () => insumoRepository.create(insumoInvalido),
            throwsA(isA<DatabaseException>()),
          );
        },
      );

      test('create fails for insumo with empty name if constrained', () async {
        final unidadId = await _crearUnidad('Unidad');
        final insumoVacio = Insumo(
          nombre: '',
          idUnidad: unidadId,
          costoUnitario: "1.0",
        );

        expect(
          () => insumoRepository.create(insumoVacio),
          throwsA(isA<DatabaseException>()),
        );
      });
    });

    group('Performance Tests', () {
      const recordCount = 1000;

      test(
        'handles bulk creation and reading efficiently',
        () async {
          final stopwatch = Stopwatch()..start();
          final unidadId = await _crearUnidad('Pieza');

          final batch = database.batch();
          for (int i = 0; i < recordCount; i++) {
            batch.insert('Insumo', {
              'nombre': 'Insumo $i',
              'id_unidad': unidadId,
              'costo_unitario': '1.0',
            });
          }
          final createResults = await batch.commit();
          expect(createResults.length, recordCount);
          print(
            'Creación de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          final allInsumos = await insumoRepository.getAll();
          expect(allInsumos.length, recordCount);
          print(
            'Lectura de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          stopwatch.stop();
          expect(
            stopwatch.elapsed.inSeconds,
            lessThan(5),
            reason:
                "La creación y lectura masiva no debe exceder los 5 segundos",
          );
        },
        timeout: const Timeout(Duration(seconds: 10)),
      );

      test(
        'handles bulk updates and deletions efficiently',
        () async {
          final unidadId = await _crearUnidad('Pieza');
          final batch = database.batch();
          for (int i = 0; i < recordCount; i++) {
            batch.insert('Insumo', {
              'nombre': 'Insumo $i',
              'id_unidad': unidadId,
              'costo_unitario': '1.0',
            });
          }
          await batch.commit();
          final allInsumos = await insumoRepository.getAll();

          final stopwatch = Stopwatch()..start();

          final updateBatch = database.batch();
          for (final insumo in allInsumos) {
            updateBatch.update(
              'Insumo',
              {'costo_unitario': '2.0'},
              where: 'id_insumo = ?',
              whereArgs: [insumo.id],
            );
          }
          await updateBatch.commit(noResult: true);
          print(
            'Actualización de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          final deleteBatch = database.batch();
          for (final insumo in allInsumos) {
            deleteBatch.delete(
              'Insumo',
              where: 'id_insumo = ?',
              whereArgs: [insumo.id],
            );
          }
          await deleteBatch.commit(noResult: true);
          final finalList = await insumoRepository.getAll();
          expect(finalList, isEmpty);
          print(
            'Borrado de $recordCount y tiempo total: ${stopwatch.elapsedMilliseconds} ms',
          );

          stopwatch.stop();
          expect(
            stopwatch.elapsed.inSeconds,
            lessThan(5),
            reason:
                "La actualización y borrado masivos no deben exceder los 5 segundos",
          );
        },
        timeout: const Timeout(Duration(seconds: 10)),
      );
    });
  });
}
