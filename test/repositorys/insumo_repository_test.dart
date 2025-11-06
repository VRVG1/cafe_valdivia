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

  group('Insumo repository test', () {
    late DatabaseHelper databaseHelper;
    late InsumoRepository insumoRepository;
    late UnidadMedidaRepository unidadMedidaRespository;
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
      // crear el helper de la BD
      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      // Crear el repositorio del que depende InsumoRepository
      unidadMedidaRespository = UnidadMedidaRepository(databaseHelper);

      // Crear el repositorio a probar, inyectando sus dependencias.
      insumoRepository = InsumoRepository(
        databaseHelper,
        unidadMedidaRespository,
      );
    });

    tearDown(() async {
      if (database.isOpen) {
        await database.close();
      }
    });

    test('Create, GetById, Update, and Delete an Insumo', () async {
      final unidadId = await unidadMedidaRespository.create(
        UnidadMedida(nombre: 'Kilogramo'),
      );
      final nuevoInsumo = Insumo(nombre: 'Café en Grano', idUnidad: unidadId);

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
    });

    test('getAll returns a list of all insumos', () async {
      final unidadId = await unidadMedidaRespository.create(
        UnidadMedida(nombre: 'Kilogramos'),
      );
      await insumoRepository.create(
        Insumo(nombre: 'Insumo A', idUnidad: unidadId),
      );
      await insumoRepository.create(
        Insumo(nombre: 'Insumo B', idUnidad: unidadId),
      );
      await insumoRepository.create(
        Insumo(nombre: 'Insumo C', idUnidad: unidadId),
      );

      final todosLosInsumo = await insumoRepository.getAll();

      expect(todosLosInsumo.length, 3);
      expect(todosLosInsumo.any((i) => i.nombre == 'Insumo B'), isTrue);
      expect(todosLosInsumo.last.nombre, 'Insumo C');
    });

    test('getWithUnidad correctly populates the unidad field', () async {
      // ARRANGE
      final unidadId = await unidadMedidaRespository.create(
        UnidadMedida(nombre: 'Litro'),
      );
      final insumoId = await insumoRepository.create(
        Insumo(nombre: 'Leche', idUnidad: unidadId),
      );

      // ACT
      final insumoCompleto = await insumoRepository.getWithUnidad(insumoId);

      // ASSERT
      expect(insumoCompleto.unidad, isNotNull);
      expect(insumoCompleto.unidad!.nombre, 'Litro');
      expect(insumoCompleto.unidad!.id, unidadId);
    });

    test(
      'getCostopromedio calculates weigthed average cost correctly',
      () async {
        final proveedorId = await database.insert('Proveedor', {
          'nombre': 'Proveedor de Vasos',
        });

        final compraId1 = await database.insert('Compra', {
          'idProveedor': proveedorId,
          'fecha': DateTime.now().toIso8601String(),
        });
        final compraId2 = await database.insert('Compra', {
          'idProveedor': proveedorId,
          'fecha': DateTime.now().toIso8601String(),
        });

        final unidadId = await unidadMedidaRespository.create(
          UnidadMedida(nombre: 'Unidad'),
        );
        final insumoId = await insumoRepository.create(
          Insumo(nombre: 'Vaso Desechable', idUnidad: unidadId),
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

        final costoPromedio = await insumoRepository.getCostoPromedio(insumoId);

        expect(costoPromedio, closeTo(1.66, 0.01));
      },
    );
    // --- PRUEBAS DE ROBUSTEZ (CASOS LÍMITE Y ERRORES) ---

    test('Robustness: getById throws exception for non-existent ID', () {
      expect(() => insumoRepository.getById(999), throwsA(isA<Exception>()));
    });

    test('Robustness: update throws exception for null ID', () {
      final insumoSinId = Insumo(nombre: 'Insumo Fantasma', idUnidad: 1);
      expect(
        () => insumoRepository.update(insumoSinId),
        throwsA(isA<Exception>()),
      );
    });

    test('Robustness: delete returns 0 for non-existent ID', () async {
      final rowsAffected = await insumoRepository.delete(999);
      expect(rowsAffected, 0);
    });

    test('Robustness: create fails with foreign key violation', () async {
      // ARRANGE: Crea un insumo que apunta a un id_unidad que no existe.
      final insumoInvalido = Insumo(nombre: 'Insumo Roto', idUnidad: 999);

      // ACT & ASSERT: Esperamos una DatabaseException por la restricción de clave foránea.
      expect(
        () => insumoRepository.create(insumoInvalido),
        throwsA(isA<DatabaseException>()),
      );
    });
    // --- PRUEBA DE CARGA ("RAPIDEZ") ---

    test(
      'Performance: handles a large number of operations efficiently',
      () async {
        final stopwatch = Stopwatch()..start();

        final unidadId = await unidadMedidaRespository.create(
          UnidadMedida(nombre: 'Pieza'),
        );
        const int recordCount = 1000;

        final batch = database.batch();
        for (int i = 0; i < recordCount; i++) {
          batch.insert('Insumo', {
            'nombre': 'Insumo $i',
            'id_unidad': unidadId,
          });
        }

        final results = await batch.commit();
        expect(results.length, recordCount);
        print(
          'Creación de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
        );

        // 2. Lectura masiva
        final allInsumo = await insumoRepository.getAll();
        expect(allInsumo.length, recordCount);
        print(
          'Lectura de $recordCount registros: ${stopwatch.elapsedMilliseconds} ms',
        );

        // 3. Borrado masivo
        final deleteBatch = database.batch();
        for (final insumo in allInsumo) {
          deleteBatch.delete(
            'Insumo',
            where: 'id_insumo = ?',
            whereArgs: [insumo.id],
          );
        }
        await deleteBatch.commit();
        final finalList = await insumoRepository.getAll();
        expect(finalList, isEmpty);

        stopwatch.stop();
        print(
          'Borrado de $recordCount y tiempo total: ${stopwatch.elapsedMilliseconds} ms',
        );

        // ASSERT: Asegura que todo el proceso no tarde demasiado.
        // Este umbral puede ajustarse según la máquina.
        expect(stopwatch.elapsed.inSeconds, lessThan(5));
      },
      timeout: const Timeout(Duration(seconds: 10)),
    ); // Aumenta el timeout para esta prueba
  });
}
