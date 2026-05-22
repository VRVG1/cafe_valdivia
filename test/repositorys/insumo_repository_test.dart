import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
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

  group('ArticuloRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadMedidaRepository;
    late Database database;

    Future<int> _crearUnidad(String nombre) async {
      return await unidadMedidaRepository.create(UnidadMedida(nombre: nombre));
    }

    Future<int> _crearArticulo(String nombre, int unidadId, double costo) async {
      return await articuloRepository.create(
        Articulo(
          nombre: nombre,
          tipo: ArticuloTipo.insumo,
          idUnidad: unidadId,
          costoUnitario: costo,
          precioVenta: 0.0,
          stock: 0.0,
        ),
      );
    }

    setUp(() async {
      final path = p.join(inMemoryDatabasePath, 'test_articulos_repository.db');
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
      articuloRepository = ArticuloRepository(
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
        'Create, GetById, Update, and Delete an Articulo successfully',
        () async {
          final unidadId = await _crearUnidad('Kilogramo');
          final nuevoArticulo = Articulo(
            nombre: 'Café en Grano',
            tipo: ArticuloTipo.insumo,
            idUnidad: unidadId,
            costoUnitario: 212.0,
            precioVenta: 0.0,
            stock: 0.0,
          );

          final articuloId = await articuloRepository.create(nuevoArticulo);
          expect(articuloId, isA<int>());

          var articuloRecuperado = await articuloRepository.getById(articuloId);
          expect(articuloRecuperado.nombre, 'Café en Grano');
          expect(articuloRecuperado.idUnidad, unidadId);

          final articuloActualizado = articuloRecuperado.copyWith(
            nombre: 'Café Tostado',
          );
          final rowsAffectedUpdate = await articuloRepository.update(
            articuloActualizado,
          );
          expect(rowsAffectedUpdate, 1);

          articuloRecuperado = await articuloRepository.getById(articuloId);
          expect(articuloRecuperado.nombre, 'Café Tostado');

          final rowsAffectedDelete = await articuloRepository.delete(articuloId);
          expect(rowsAffectedDelete, 1);
          expect(
            () => articuloRepository.getById(articuloId),
            throwsA(isA<Exception>()),
          );
        },
      );

      test('getAll returns a list of all articulos', () async {
        final unidadId = await _crearUnidad('Kilogramos');
        await _crearArticulo('Articulo A', unidadId, 666);
        await _crearArticulo('Articulo B', unidadId, 65.20);
        await _crearArticulo('Articulo C', unidadId, 21);

        final todosLosArticulos = await articuloRepository.getAll();

        expect(todosLosArticulos.length, 3);
        expect(todosLosArticulos.any((i) => i.nombre == 'Articulo B'), isTrue);
      });

      test('getAll with "where" clause filters correctly', () async {
        final unidadId = await _crearUnidad('Litro');
        await _crearArticulo('Leche Entera', unidadId, 20.5);
        await _crearArticulo('Leche Descremada', unidadId, 22.5);
        await _crearArticulo('Crema de Leche', unidadId, 30.0);

        final resultado = await articuloRepository.getAll(
          where: 'nombre LIKE ?',
          whereArgs: ['%Leche%'],
        );

        expect(resultado.length, 3);
        expect(resultado.any((i) => i.nombre == 'Crema de Leche'), isTrue);
      });
    });

    group('Business Logic', () {
      group('getArticulosConUnidad', () {
        test(
          'returns correct unit and a list of multiple articulos associated with it',
          () async {
            final unidadId = await _crearUnidad('Pieza');
            await _crearArticulo('Taza', unidadId, 50.0);
            await _crearArticulo('Plato', unidadId, 40.0);

            final (unidad, articulos) = await articuloRepository
                .getArticuloByIdUnidad(idUnidad: unidadId);

            expect(unidad.nombre, 'Pieza');
            expect(articulos.length, 2);
            expect(articulos.any((i) => i.nombre == 'Taza'), isTrue);
          },
        );

        test(
          'returns correct unit and an empty list if unit has no articulos',
          () async {
            final unidadId = await _crearUnidad('Caja');

            final (unidad, articulos) = await articuloRepository
                .getArticuloByIdUnidad(idUnidad: unidadId);

            expect(unidad.nombre, 'Caja');
            expect(articulos, isEmpty);
          },
        );

        test('throws exception if the unidadId does not exist', () {
          const idUnidadInexistente = 999;

          expect(
            () => articuloRepository.getArticuloByIdUnidad(
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
          final articuloId = await _crearArticulo(
            'Vaso Desechable',
            unidadId,
            22.22,
          );

          await database.insert('Detalle_Compra', {
            'id_compra': compraId1,
            'id_articulo': articuloId,
            'cantidad': 100,
            'precio_unitario_compra': 1.50,
          });
          await database.insert('Detalle_Compra', {
            'id_compra': compraId2,
            'id_articulo': articuloId,
            'cantidad': 50,
            'precio_unitario_compra': 2.00,
          });

          final costoPromedio = await articuloRepository.getCostoPromedio(
            articuloId,
          );

          expect(costoPromedio, closeTo(1.66, 0.01));
        });

        test('returns 0.0 if articulo has no purchase history', () async {
          final unidadId = await _crearUnidad('Gramo');
          final articuloId = await _crearArticulo('Azafrán', unidadId, 999);

          final costoPromedio = await articuloRepository.getCostoPromedio(
            articuloId,
          );

          expect(costoPromedio, 0.0);
        });

        test('returns 0.0 for non-existent articuloId', () async {
          final costoPromedio = await articuloRepository.getCostoPromedio(999);

          expect(costoPromedio, 0.0);
        });
      });
    });

    group('Robustness and Edge Cases', () {
      test('getById throws exception for non-existent ID', () {
        expect(() => articuloRepository.getById(999), throwsA(isA<Exception>()));
      });

      test('update throws exception for entity with null ID', () {
        final articuloSinId = Articulo(
          nombre: 'Articulo Fantasma',
          tipo: ArticuloTipo.insumo,
          idUnidad: 1,
          costoUnitario: 99.99,
          precioVenta: 0.0,
          stock: 0.0,
        );
        expect(
          () => articuloRepository.update(articuloSinId),
          throwsA(isA<Exception>()),
        );
      });

      test('delete returns 0 for non-existent ID', () async {
        final rowsAffected = await articuloRepository.delete(999);
        expect(rowsAffected, 0);
      });

      test(
        'create fails with foreign key violation for non-existent unidad',
        () async {
          final articuloInvalido = Articulo(
            nombre: 'Articulo Roto',
            tipo: ArticuloTipo.insumo,
            idUnidad: 999,
            costoUnitario: 29.0,
            precioVenta: 0.0,
            stock: 0.0,
          );

          expect(
            () => articuloRepository.create(articuloInvalido),
            throwsA(isA<DatabaseException>()),
          );
        },
      );

      test('create fails for articulo with empty name if constrained', () async {
        final unidadId = await _crearUnidad('Unidad');
        final articuloVacio = Articulo(
          nombre: '',
          tipo: ArticuloTipo.insumo,
          idUnidad: unidadId,
          costoUnitario: 1.0,
          precioVenta: 0.0,
          stock: 0.0,
        );

        expect(
          () => articuloRepository.create(articuloVacio),
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
            batch.insert('Articulo', {
              'nombre': 'Articulo $i',
              'id_unidad': unidadId,
              'costo_unitario': '1.0',
            });
          }
          final createResults = await batch.commit();
          expect(createResults.length, recordCount);
          print(
            'Creación de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          final allArticulos = await articuloRepository.getAll();
          expect(allArticulos.length, recordCount);
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
            batch.insert('Articulo', {
              'nombre': 'Articulo $i',
              'id_unidad': unidadId,
              'costo_unitario': '1.0',
            });
          }
          await batch.commit();
          final allArticulos = await articuloRepository.getAll();

          final stopwatch = Stopwatch()..start();

          final updateBatch = database.batch();
          for (final articulo in allArticulos) {
            updateBatch.update(
              'Articulo',
              {'costo_unitario': '2.0'},
              where: 'id_articulo = ?',
              whereArgs: [articulo.idArticulo],
            );
          }
          await updateBatch.commit(noResult: true);
          print(
            'Actualización de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          final deleteBatch = database.batch();
          for (final articulo in allArticulos) {
            deleteBatch.delete(
              'Articulo',
              where: 'id_articulo = ?',
              whereArgs: [articulo.idArticulo],
            );
          }
          await deleteBatch.commit(noResult: true);
          final finalList = await articuloRepository.getAll();
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
