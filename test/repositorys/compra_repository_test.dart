import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_respository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group("Test of compra repository", () {
    late DatabaseHelper databaseHelper;
    late CompraRepository compraRepository;
    late ProveedorRepository proveedorRepository;
    late UnidadMedidaRespository unidadMedidaRespository;
    late InsumoRepository insumoRepository;
    late Database database;

    late String path;
    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_cliente_repo.db');
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
      proveedorRepository = ProveedorRepository(databaseHelper);
      unidadMedidaRespository = UnidadMedidaRespository(databaseHelper);
      insumoRepository = InsumoRepository(
        databaseHelper,
        unidadMedidaRespository,
      );
      databaseHelper.setMockDatabase(database);

      compraRepository = CompraRepository(
        databaseHelper,
        proveedorRepository,
        insumoRepository,
      );
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test("Crear compra con detalles", () {});
  });
}
