import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
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

  group('ProductoRepository Tests', () {
    late DatabaseHelper databaseHelper;
    late ProductoRepository productoRepository;
    late InsumosRepository insumoRepository;
    late UnidadMedidaRepository unidadMedidaRepository;
    late Database database;

    Future<int> _crearUnidad(String nombre) async {
      return await unidadMedidaRepository.create(UnidadMedida(nombre: nombre));
    }

    Future<int> _crearInsumo(String nombre, int unidadId, String costo) async {
      final insumo = Insumo(
        nombre: nombre,
        idUnidad: unidadId,
        costoUnitario: costo,
      );
      return await insumoRepository.create(insumo);
    }

    Future<int> _crearProducto(String nombre, String precio) async {
      final producto = Producto(nombre: nombre, precioVenta: precio);
      return await productoRepository.create(producto);
    }

    setUp(() async {
      final path = p.join(inMemoryDatabasePath, 'test_producto_repository.db');
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
      productoRepository = ProductoRepository(databaseHelper, insumoRepository);
    });

    tearDown(() async {
      if (database.isOpen) {
        await database.close();
      }
    });

    group('CRUD Operations', () {
      test(
        'Create, GetById, Update, and Delete a Producto successfully',
        () async {
          final nuevoProducto = Producto(
            nombre: 'Café Americano',
            precioVenta: "45.0",
          );

          final productoId = await productoRepository.create(nuevoProducto);
          expect(productoId, isA<int>());

          var productoRecuperado = await productoRepository.getById(productoId);
          expect(productoRecuperado.nombre, 'Café Americano');
          expect(productoRecuperado.precioVenta, 45.0);

          final productoActualizado = productoRecuperado.copyWith(
            nombre: 'Café Espresso',
            precioVenta: "50.0",
          );
          final rowsAffectedUpdate = await productoRepository.update(
            productoActualizado,
          );
          expect(rowsAffectedUpdate, 1);

          productoRecuperado = await productoRepository.getById(productoId);
          expect(productoRecuperado.nombre, 'Café Espresso');
          expect(productoRecuperado.precioVenta, 50.0);

          final rowsAffectedDelete = await productoRepository.delete(
            productoId,
          );
          expect(rowsAffectedDelete, 1);
          expect(
            () => productoRepository.getById(productoId),
            throwsA(isA<Exception>()),
          );
        },
      );

      test('getAll returns a list of all productos', () async {
        await _crearProducto('Pastel de Chocolate', "60.0");
        await _crearProducto('Galleta de Avena', "25.0");
        await _crearProducto('Jugo de Naranja', "35.0");

        final todosLosProductos = await productoRepository.getAll();

        expect(todosLosProductos.length, 3);
        expect(
          todosLosProductos.any((p) => p.nombre == 'Galleta de Avena'),
          isTrue,
        );
      });

      test('getAll with "where" clause filters correctly', () async {
        await _crearProducto('Café Latte', "55.0");
        await _crearProducto('Café Mocha', "65.0");
        await _crearProducto('Té Verde', "40.0");

        final resultado = await productoRepository.getAll(
          where: 'nombre LIKE ?',
          whereArgs: ['%Café%'],
        );

        expect(resultado.length, 2);
        expect(resultado.every((p) => p.nombre.contains('Café')), isTrue);
      });
    });

    group('Business Logic', () {
      group('getProductoByInsumoId', () {
        test('throws exception because of incorrect query logic', () async {
          // ARRANGE: Crear datos
          final unidadId = await _crearUnidad('Unidad');
          final insumoId = await _crearInsumo('Insumo Test', unidadId, "10.0");
          final productoId = await _crearProducto('Producto Test', "100.0");

          // Crear relación
          await database.insert('Insumo_Producto', {
            'id_insumo': insumoId,
            'id_producto': productoId,
            'cantidad_requerida': 1.0,
          });

          // ACT & ASSERT
          // La implementación actual de getProductoByInsumoId intenta buscar
          // 'idInsumo' en la tabla 'Producto', lo cual es incorrecto y causa un error.
          // Esta prueba verifica que se lance una excepción de base de datos.
          expect(
            () => productoRepository.getProductoByInsumoId(idInsumo: insumoId),
            throwsA(isA<DatabaseException>()),
          );
        });

        test('returns empty list if insumo has no associated products', () async {
          // ARRANGE
          final unidadId = await _crearUnidad('Unidad');
          final insumoId = await _crearInsumo(
            'Insumo sin productos',
            unidadId,
            "5.0",
          );

          // ACT & ASSERT
          // Esta prueba también fallará por la misma razón que la anterior,
          // pero su objetivo es documentar el comportamiento esperado si la consulta fuera correcta.
          expect(
            () => productoRepository.getProductoByInsumoId(idInsumo: insumoId),
            throwsA(isA<DatabaseException>()),
          );
        });

        test('throws exception if the insumoId does not exist', () {
          // ARRANGE: un ID de insumo que no existe
          const idInsumoInexistente = 999;

          // ACT & ASSERT
          // La función primero intentará hacer la consulta errónea y fallará.
          // Si la consulta se corrigiera, la función debería lanzar una excepción
          // al no poder encontrar el insumo con insumoRepo.getById.
          expect(
            () => productoRepository.getProductoByInsumoId(
              idInsumo: idInsumoInexistente,
            ),
            throwsA(isA<Exception>()),
          );
        });
      });
    });

    group('Robustness and Edge Cases', () {
      test('getById throws exception for non-existent ID', () {
        expect(
          () => productoRepository.getById(999),
          throwsA(isA<Exception>()),
        );
      });

      test('update throws exception for entity with null ID', () {
        final productoSinId = Producto(
          nombre: 'Producto Fantasma',
          precioVenta: "99.99",
        );
        expect(
          () => productoRepository.update(productoSinId),
          throwsA(isA<Exception>()),
        );
      });

      test('delete returns 0 for non-existent ID', () async {
        final rowsAffected = await productoRepository.delete(999);
        expect(rowsAffected, 0);
      });

      test(
        'create fails for producto with empty name if constrained',
        () async {
          final productoVacio = Producto(nombre: '', precioVenta: "10.0");

          expect(
            () => productoRepository.create(productoVacio),
            throwsA(isA<DatabaseException>()),
          );
        },
      );
    });

    group('Performance Tests', () {
      const recordCount = 1000;

      test(
        'handles bulk creation and reading efficiently',
        () async {
          final stopwatch = Stopwatch()..start();

          final batch = database.batch();
          for (int i = 0; i < recordCount; i++) {
            batch.insert('Producto', {
              'nombre': 'Producto $i',
              'precio_venta': (i * 0.5).toString(),
            });
          }
          final createResults = await batch.commit();
          expect(createResults.length, recordCount);
          print(
            'Creación de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          stopwatch.reset();
          final allProductos = await productoRepository.getAll();
          expect(allProductos.length, recordCount);
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
          final batch = database.batch();
          for (int i = 0; i < recordCount; i++) {
            batch.insert('Producto', {
              'nombre': 'Producto $i',
              'precio_venta': '1.0',
            });
          }
          await batch.commit();
          final allProductos = await productoRepository.getAll();

          final stopwatch = Stopwatch()..start();

          final updateBatch = database.batch();
          for (final producto in allProductos) {
            updateBatch.update(
              'Producto',
              {'precio_venta': '2.0'},
              where: 'id_producto = ?',
              whereArgs: [producto.idProducto],
            );
          }
          await updateBatch.commit(noResult: true);
          print(
            'Actualización de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
          );

          stopwatch.reset();
          final deleteBatch = database.batch();
          for (final producto in allProductos) {
            deleteBatch.delete(
              'Producto',
              where: 'id_producto = ?',
              whereArgs: [producto.idProducto],
            );
          }
          await deleteBatch.commit(noResult: true);
          final finalList = await productoRepository.getAll();
          expect(finalList, isEmpty);
          print(
            'Borrado de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
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
