import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
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

  group("inventario_repository", () {
    late DatabaseHelper databaseHelper;
    late InventarioRepository inventarioRepository;
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
      inventarioRepository = InventarioRepository(databaseHelper);
    });
  });
}
