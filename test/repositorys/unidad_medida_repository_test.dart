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
          final filasAfectadas = respository.update(unidadActualizada);
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
        await _crearUnidad("Bolasas Medianas");

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

    group("Business Logic", () {});
    group("Robustness and Edge Cases", () {});
    group("Performance Tests", () {});
  });
}
