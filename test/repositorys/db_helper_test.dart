import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  setUpAll(() {
    sqfliteTestInit();
  });

  group('DatabaseHelper test', () {
    late DatabaseHelper databaseHelper;
    late Database database;

    setUp(() async {
      // Creamos BD en memoria
      final path = p.join(inMemoryDatabasePath, 'test_cafe_sales.db');
      // Limpiamos base de datos si esque existe una
      await databaseFactory.deleteDatabase(path);

      // creamos la instancia de mi helper
      databaseHelper = DatabaseHelper();

      //Abirmos una conecion a la base de datos en memoria
      database = await openDatabase(
        path,
        version: 2,
        onCreate: (db, version) async {
          await databaseHelper.testOnCreate(db);
        },
        onConfigure: (db) async {
          await databaseHelper.testOnConfigure(db);
        },
      );
      // Inyectamos la base de datos de prueba al helper
      databaseHelper.setMockDatabase(database);
    });

    //tearDown se ejecuta despues de cada prueba
    //Cerramos la conexcion a la BD para limpiar los recursos
    tearDown(() async {
      await database.close();
    });

    test('La base de datos es creada y las tablas estan presentes', () async {
      /// Usando la metodologia AAA

      // ARRANGE: Se configuro en el setUp
      // ACT: Consultamos la tabla maestra de sqlite para ver que las tablas existen.
      final tablas = await database.rawQuery(
        "SELECT * FROM sqlite_master WHERE type='table' ORDER BY name;",
      );

      final tableNames =
          tablas.map((tabla) => tabla['name'] as String).toList();

      // ASSERT: Verificamos que todas nuestras tablas esperadas fueron creadas.
      expect(tableNames, contains('Cliente'));
      expect(tableNames, contains('Compra'));
      expect(tableNames, contains('Detalle_Compra'));
      expect(tableNames, contains('Detalle_Venta'));
      expect(tableNames, contains('Insumo'));
      expect(tableNames, contains('Insumo_Producto'));
      expect(tableNames, contains('Inventario'));
      expect(tableNames, contains('Movimiento_Inventario'));
      expect(tableNames, contains('Producto'));
      expect(tableNames, contains('Proveedor'));
      expect(tableNames, contains('Unidad_Medida'));
      expect(tableNames, contains('Venta'));
    });
  });
}
