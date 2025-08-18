import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
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

    final unidadMedida1 = UnidadMedida(nombre: 'KG');
    final unidadMedida2 = UnidadMedida(nombre: 'Pieza');

    test('Agregando una unidad de medida y obtenerlo (getById)', () async {
      final id = await respository.create(unidadMedida1);
      expect(id, isNotNull);

      final umgetbyid = await respository.getById(id);
      expect(umgetbyid.nombre, 'KG');
    });

    test('Agregando 2 unidad de medida y obtener todos', () async {
      await respository.create(unidadMedida1);
      await respository.create(unidadMedida2);

      final listUnidadMedida = await respository.getAll();
      expect(listUnidadMedida.length, 2);
      expect(listUnidadMedida.first.nombre, 'KG');
      expect(listUnidadMedida.last.nombre, 'Pieza');
    });

    test(
      'Eliminar unidad de medida y deberia lanzar un error al buscar una unidad de medida que no existe',
      () async {
        final id = await respository.create(unidadMedida1);
        expect(id, isNotNull);
        final rows = await respository.delete(id);
        expect(rows, 1);

        expect(() => respository.getById(id), throwsA(isA<Exception>()));
      },
    );

    test('Actualizar una unidad de medida', () async {
      final id = await respository.create(unidadMedida1);
      expect(id, isNotNull);
      final unidadMedidaActualziado = unidadMedida1.copyWith(
        id: id,
        nombre: "Sergio Pendejo",
      );
      final rows = await respository.update(unidadMedidaActualziado);
      expect(rows, 1);
      final unidadMediadActualizadoBaseDeDatos = await respository.getById(id);
      expect(unidadMediadActualizadoBaseDeDatos.nombre, "Sergio Pendejo");
    });
  });
}
