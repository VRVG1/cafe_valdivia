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

  final unidad = UnidadMedida(nombre: 'Kilogramos');
  final unidad2 = UnidadMedida(nombre: 'Litros');
  final unidad3 = UnidadMedida(nombre: 'Unidades');

  final articulo = Articulo(
    idArticulo: 1,
    nombre: 'Café Molido',
    descripcion: 'Café molido de 500g',
    tipo: ArticuloTipo.producto,
    idUnidad: 1,
    costoUnitario: 50.0,
    precioVenta: 120.0,
    stock: 100.0,
  );
  final articulo2 = Articulo(
    nombre: 'Leche Entera',
    tipo: ArticuloTipo.insumo,
    idUnidad: 1,
    costoUnitario: 15.0,
    precioVenta: 30.0,
    stock: 50.0,
  );
  final articulo3 = Articulo(
    nombre: 'Azúcar',
    descripcion: 'Azúcar refinada',
    tipo: ArticuloTipo.insumo,
    idUnidad: 1,
    costoUnitario: 20.0,
    precioVenta: 45.0,
    stock: 200.0,
  );

  group("ArticuloRepository CRUD", () {
    late DatabaseHelper databaseHelper;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_articulo_crud.db');
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

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);

      await unidadRepository.create(unidad);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create articulo and getById', () async {
      final id = await articuloRepository.create(articulo);

      expect(id, isNotNull);

      final articuloObtenido = await articuloRepository.getById(id);

      expect(articuloObtenido.nombre, articulo.nombre);
      expect(articuloObtenido.descripcion, articulo.descripcion);
      expect(articuloObtenido.tipo, articulo.tipo);
      expect(articuloObtenido.idUnidad, articulo.idUnidad);
      expect(articuloObtenido.costoUnitario, articulo.costoUnitario);
      expect(articuloObtenido.precioVenta, articulo.precioVenta);
      expect(articuloObtenido.stock, articulo.stock);
    });

    test('Delete articulo and getById throws exception', () async {
      final id = await articuloRepository.create(articulo);

      expect(id, isNotNull);

      final filasAfectadas = await articuloRepository.delete(id);

      expect(filasAfectadas, 1);
      expect(articuloRepository.getById(id), throwsA(isA<Exception>()));
    });

    test('Update articulo', () async {
      final id = await articuloRepository.create(articulo);
      expect(id, isNotNull);

      final articuloModificado = articulo.copyWith(
        nombre: 'Café Molido Premium',
        precioVenta: 150.0,
        stock: 80.0,
      );

      final filasAfectadas = await articuloRepository.update(
        articuloModificado,
      );
      final articuloRecuperado = await articuloRepository.getById(id);

      expect(filasAfectadas, 1);
      expect(articuloRecuperado.nombre, 'Café Molido Premium');
      expect(articuloRecuperado.precioVenta, 150.0);
      expect(articuloRecuperado.stock, 80.0);
      expect(articuloRecuperado.descripcion, articulo.descripcion);
      expect(articuloRecuperado.tipo, articulo.tipo);
    });

    test('GetAll articulos returns all articulos', () async {
      await articuloRepository.create(articulo);
      await articuloRepository.create(articulo2);
      await articuloRepository.create(articulo3);

      final todos = await articuloRepository.getAll();

      expect(todos.length, 3);
      expect(todos.first.nombre, 'Café Molido');
      expect(todos.last.nombre, 'Azúcar');
    });

    test('Search articulo returns correct results', () async {
      await articuloRepository.create(articulo);
      await articuloRepository.create(articulo2);
      await articuloRepository.create(articulo3);

      var resultados = await articuloRepository.search('Café');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Café Molido');

      resultados = await articuloRepository.search('SinResultados');
      expect(resultados, isEmpty);
    });

    test('GetAll returns empty list when no articulos', () async {
      final todos = await articuloRepository.getAll();
      expect(todos, isEmpty);
    });
  });

  group("ArticuloRepository Edge Cases", () {
    late DatabaseHelper databaseHelper;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_articulo_edge.db');
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

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);

      await unidadRepository.create(unidad);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create with empty nombre throws', () async {
      final invalido = Articulo(
        nombre: '',
        tipo: ArticuloTipo.insumo,
        idUnidad: 1,
        costoUnitario: 0,
        precioVenta: 0,
        stock: 0,
      );
      expect(articuloRepository.create(invalido), throwsA(isA<Exception>()));
    });

    test('Create with duplicate nombre throws', () async {
      await articuloRepository.create(articulo);
      final duplicado = articulo.copyWith(descripcion: 'Otra descripción');
      expect(articuloRepository.create(duplicado), throwsA(isA<Exception>()));
    });

    test('Update with null ID throws', () async {
      final sinId = Articulo(
        nombre: 'Sin ID',
        tipo: ArticuloTipo.insumo,
        idUnidad: 1,
        costoUnitario: 10,
        precioVenta: 20,
        stock: 5,
      );
      expect(articuloRepository.update(sinId), throwsA(isA<Exception>()));
    });

    test('GetById with non-existent ID throws', () async {
      expect(articuloRepository.getById(9999), throwsA(isA<Exception>()));
    });

    test('Delete non-existent returns 0', () async {
      final filas = await articuloRepository.delete(9999);
      expect(filas, 0);
    });

    test('Search with partial match returns results', () async {
      await articuloRepository.create(articulo);
      await articuloRepository.create(articulo2);

      // Buscar solo parte del nombre (gracias al wildcard %query%)
      final resultados = await articuloRepository.search('Café');
      expect(resultados.length, 1);
      expect(resultados.first.nombre, 'Café Molido');
    });

    test('Search with special characters does not crash', () async {
      await articuloRepository.create(articulo);

      final resultados = await articuloRepository.search('!@#');
      expect(resultados, isEmpty);
    });
  });

  group("ArticuloRepository Articulo-specific Methods", () {
    late DatabaseHelper databaseHelper;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_articulo_specific.db');
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

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);

      await unidadRepository.create(unidad);
      await unidadRepository.create(unidad2);
      await unidadRepository.create(unidad3);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('getArticuloByIdUnidad returns unidad and its articulos', () async {
      final art1 = await articuloRepository.create(
        articulo.copyWith(idUnidad: 1),
      );
      final art2 = await articuloRepository.create(
        articulo2.copyWith(idUnidad: 1),
      );
      // Crear un articulo en otra unidad para verificar que no se filtra mal
      await articuloRepository.create(
        articulo3.copyWith(idUnidad: 2, nombre: 'Agua'),
      );

      final (unidadObtenida, listaArticulos) = await articuloRepository
          .getArticuloByIdUnidad(idUnidad: 1);

      expect(unidadObtenida.nombre, 'Kilogramos');
      expect(listaArticulos.length, 2);
      expect(listaArticulos.any((a) => a.nombre == 'Café Molido'), isTrue);
      expect(listaArticulos.any((a) => a.nombre == 'Leche Entera'), isTrue);
      expect(listaArticulos.any((a) => a.nombre == 'Agua'), isFalse);
    });

    test(
      'getArticuloByIdUnidad returns empty list when no articulos',
      () async {
        final (unidadObtenida, listaArticulos) = await articuloRepository
            .getArticuloByIdUnidad(idUnidad: 3);

        expect(unidadObtenida.nombre, 'Unidades');
        expect(listaArticulos, isEmpty);
      },
    );

    test('getArticuloByIdUnidad throws for non-existent unidad', () async {
      expect(
        () => articuloRepository.getArticuloByIdUnidad(idUnidad: 999),
        throwsA(isA<Exception>()),
      );
    });
  });

  group("ArticuloRepository Consistency", () {
    late DatabaseHelper databaseHelper;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_articulo_consist.db');
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

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);

      await unidadRepository.create(unidad);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test('Create -> GetAll count matches', () async {
      final id1 = await articuloRepository.create(articulo);
      final id2 = await articuloRepository.create(articulo2);
      final id3 = await articuloRepository.create(articulo3);

      expect(id1, 1);
      expect(id2, 2);
      expect(id3, 3);

      final todos = await articuloRepository.getAll();
      expect(todos.length, 3);
    });

    test('Create -> Delete -> GetAll count decreases', () async {
      await articuloRepository.create(articulo);
      await articuloRepository.create(articulo2);

      var todos = await articuloRepository.getAll();
      expect(todos.length, 2);

      await articuloRepository.delete(todos.first.idArticulo!);

      todos = await articuloRepository.getAll();
      expect(todos.length, 1);
    });

    test('Create -> Update -> GetById reflects changes', () async {
      final id = await articuloRepository.create(articulo);
      final modificado = articulo.copyWith(
        idArticulo: id,
        nombre: 'Actualizado',
        precioVenta: 200.0,
        stock: 0,
      );

      await articuloRepository.update(modificado);
      final recuperado = await articuloRepository.getById(id);

      expect(recuperado.nombre, 'Actualizado');
      expect(recuperado.precioVenta, 200.0);
      expect(recuperado.stock, 0);
      // Campos no modificados se mantienen
      expect(recuperado.descripcion, articulo.descripcion);
      expect(recuperado.tipo, articulo.tipo);
    });

    test('Multiple create + delete cycle maintains data integrity', () async {
      final ids = <int>[];
      for (int i = 0; i < 10; i++) {
        final a = Articulo(
          nombre: 'Articulo$i',
          tipo: ArticuloTipo.insumo,
          idUnidad: 1,
          costoUnitario: 10.0 * (i + 1),
          precioVenta: 20.0 * (i + 1),
          stock: 100.0 + i,
        );
        final id = await articuloRepository.create(a);
        ids.add(id);
      }

      expect(await articuloRepository.getAll(), hasLength(10));

      // Eliminar los pares
      for (int i = 0; i < ids.length; i += 2) {
        await articuloRepository.delete(ids[i]);
      }

      final restantes = await articuloRepository.getAll();
      expect(restantes, hasLength(5));
      // Verificar que los no-eliminados aun existen
      for (int i = 1; i < ids.length; i += 2) {
        final a = await articuloRepository.getById(ids[i]);
        expect(a.nombre, 'Articulo$i');
      }
    });
  });

  group("ArticuloRepository Performance", () {
    late DatabaseHelper databaseHelper;
    late ArticuloRepository articuloRepository;
    late UnidadMedidaRepository unidadRepository;
    late Database database;
    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_articulo_perf.db');
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

      unidadRepository = UnidadMedidaRepository(databaseHelper);
      articuloRepository = ArticuloRepository(databaseHelper, unidadRepository);

      await unidadRepository.create(unidad);
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test(
      'Bulk insert 100 articulos completes in reasonable time',
      () async {
        final stopwatch = Stopwatch()..start();

        for (int i = 0; i < 100; i++) {
          final a = Articulo(
            nombre: 'Articulo$i',
            tipo: ArticuloTipo.insumo,
            idUnidad: 1,
            costoUnitario: 5.0 + i,
            precioVenta: 10.0 + i * 2,
            stock: 50.0 + i,
          );
          await articuloRepository.create(a);
        }

        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(60000));
      },
      timeout: const Timeout(Duration(minutes: 1)),
    );

    test(
      'GetAll performance with 100 records',
      () async {
        for (int i = 0; i < 100; i++) {
          final a = Articulo(
            nombre: 'Articulo$i',
            tipo: ArticuloTipo.insumo,
            idUnidad: 1,
            costoUnitario: 5.0 + i,
            precioVenta: 10.0 + i * 2,
            stock: 50.0 + i,
          );
          await articuloRepository.create(a);
        }

        final stopwatch = Stopwatch()..start();
        final all = await articuloRepository.getAll();
        stopwatch.stop();

        expect(all.length, 100);
        expect(stopwatch.elapsedMilliseconds, lessThan(5000));
      },
      timeout: const Timeout(Duration(minutes: 1)),
    );
  });
}
