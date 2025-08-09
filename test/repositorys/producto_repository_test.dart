import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_respository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('Unit test for ProductoRepository', () {
    late DatabaseHelper databaseHelper;
    late UnidadMedidaRespository unidadRepo;
    late ProdutoRepository produtoRepository;
    late InsumoRepository insumoRepository;
    late Database database;
    late String path;

    // Crear datos de prueba
    Future<int> crearUnidad() async {
      return await unidadRepo.create(UnidadMedida(nombre: 'Unidad'));
    }

    Future<int> crearInsumo(int unidadId) async {
      return await insumoRepository.create(
        Insumos(nombre: 'Insumo Test', idUnidad: unidadId),
      );
    }

    Future<int> crearProducto() async {
      return await produtoRepository.create(
        Producto(nombre: 'Café Test', precioVenta: 5.99),
      );
    }

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_producto_repository.db');
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

      unidadRepo = UnidadMedidaRespository(databaseHelper);
      insumoRepository = InsumoRepository(databaseHelper, unidadRepo);
      produtoRepository = ProdutoRepository(databaseHelper, insumoRepository);
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    test('CRUD operations', () async {
      // Create
      final productoId = await produtoRepository.create(
        Producto(nombre: 'Cafe tostado', precioVenta: 240),
      );
      expect(productoId, greaterThan(0));

      // Read
      var producto = await produtoRepository.getById(productoId);
      expect(producto.nombre, 'Cafe tostado');
      expect(producto.precioVenta, 240);

      // Update
      final productoActualizado = producto.copyWith(
        nombre: 'Cafe Molido',
        precioVenta: 280,
      );
      await produtoRepository.update(productoActualizado);
      producto = await produtoRepository.getById(productoId);
      expect(producto.nombre, 'Cafe Molido');
      expect(producto.precioVenta, 280);

      // Delete
      await produtoRepository.delete(productoId);
      expect(
        () => produtoRepository.getById(productoId),
        throwsA(isA<Exception>()),
      );
    });

    test('getWithInsumos loads relationships correctly', () async {
      // Crear datos relacionados
      final unidadId = await crearUnidad();
      final insumoId = await crearInsumo(unidadId);
      final productoId = await crearProducto();

      // Crear la relacion insumo-producto
      await database.insert('Insumo_Producto', {
        'id_insumo': insumoId,
        'id_producto': productoId,
        'cantidad_requerida': 0.2,
      });

      // obtener producto con relaciones
      final prodcutoCompleto = await produtoRepository.getWithInsumo(
        productoId,
      );

      // verificar relaciones
      expect(prodcutoCompleto.insumos, hasLength(1));
      expect(prodcutoCompleto.insumos![0].insumo!.id, insumoId);
      expect(prodcutoCompleto.insumos![0].cantidadRequerida, 0.2);
    });
    // ---------------------- PRUEBAS DE ROBUSTEZ ----------------------
    test('Update throws for null ID', () async {
      final productoInvalido = Producto(nombre: 'Inválido', precioVenta: 0);
      expect(
        () => produtoRepository.update(productoInvalido),
        throwsA(isA<Exception>()),
      );
    });

    test('Delete returns 0 for non-existent ID', () async {
      final result = await produtoRepository.delete(9999);
      expect(result, 0);
    });

    test('getById throws for non-existent ID', () async {
      expect(() => produtoRepository.getById(9999), throwsA(isA<Exception>()));
    });

    // ---------------------- PRUEBAS DE RENDIMIENTO ----------------------
    test('Performance: Bulk operations', () async {
      const recordCount = 500;
      final stopwatch = Stopwatch()..start();

      // Creación masiva
      final batch = database.batch();
      for (var i = 0; i < recordCount; i++) {
        batch.insert('Producto', {
          'nombre': 'Producto $i',
          'precio_venta': i + 0.99,
        });
      }
      await batch.commit(noResult: true);
      print('Creación: ${stopwatch.elapsedMilliseconds}ms');

      // Lectura masiva
      final productos = await produtoRepository.getAll();
      expect(productos.length, recordCount);
      print('Lectura: ${stopwatch.elapsedMilliseconds}ms');

      // Actualización masiva
      final updateBatch = database.batch();
      for (final p in productos) {
        updateBatch.update(
          'Producto',
          {'precio_venta': p.precioVenta + 1},
          where: 'id_producto = ?',
          whereArgs: [p.id],
        );
      }
      await updateBatch.commit(noResult: true);
      print('Actualización: ${stopwatch.elapsedMilliseconds}ms');

      // Eliminación masiva
      await database.delete('Producto');
      print('Total: ${stopwatch.elapsedMilliseconds}ms');
      stopwatch.stop();

      expect(stopwatch.elapsedMilliseconds, lessThan(2000));
    }, timeout: Timeout(Duration(seconds: 5)));

    test('getWithInsumo handles missing relationships', () async {
      final productoId = await crearProducto();
      final producto = await produtoRepository.getWithInsumo(productoId);
      expect(producto.insumos, isEmpty);
    });

    test('getAll with WHERE clause', () async {
      await database.insert('Producto', {'nombre': 'Café', 'precio_venta': 5});
      await database.insert('Producto', {'nombre': 'Té', 'precio_venta': 4});

      final resultados = await produtoRepository.getAll(
        where: 'precio_venta > ?',
        whereArgs: [4.5],
      );

      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Café');
    });
  });
}
