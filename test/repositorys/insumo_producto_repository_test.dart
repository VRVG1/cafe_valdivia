import 'package:cafe_valdivia/models/insumo_producto.dart';
import 'package:cafe_valdivia/repositorys/insumo_producto_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group("Insumo producto repository", () {
    late DatabaseHelper databaseHelper;
    late InsumoProductoRepository repo;
    late Database database;
    late int insumoId1;
    late int insumoId2;
    late int productoId1;
    late int productoId2;

    late String path;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_insumo_producto_repository.db');
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

      repo = InsumoProductoRepository(databaseHelper);

      // LIMPIAR TABLAS ANTES DE INSERTAR
      await database.delete('Insumo_Producto');
      await database.delete('Detalle_Venta');
      await database.delete('Detalle_Compra');
      await database.delete('Movimiento_Inventario');
      await database.delete('Insumo');
      await database.delete('Producto');
      await database.delete('Unidad_Medida'); // ¡Clave para resolver el error!

      // Unidad_Medida
      final idUnidad = await database.insert('Unidad_Medida', {
        'nombre': 'Kilogramo',
      });

      //  Insumo
      insumoId1 = await database.insert('Insumo', {
        'nombre': 'Café Arábica',
        'id_unidad': idUnidad, // Relacionado con Unidad_Medida
        'costo_unitario': 8.5,
      });

      insumoId2 = await database.insert('Insumo', {
        'nombre': 'Café Arábica 2',
        'id_unidad': idUnidad, // Relacionado con Unidad_Medida
        'costo_unitario': 2.5,
      });

      //  Producto
      productoId1 = await database.insert('Producto', {
        'nombre': 'Café Premium 250g',
        'precio_venta': 12.99,
      });

      productoId2 = await database.insert('Producto', {
        'nombre': 'Café Premium 750g',
        'precio_venta': 32.99,
      });
    });

    tearDown(() async {
      await database.close(); // Cerrar después de limpiar
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test("Create relaction insumo_producto and getById", () async {
      final relacion1 = InsumoProducto(
        idInsumo: insumoId1,
        idProducto: productoId1,
        cantidadRequerida: 10,
      );
      final id = await repo.create(relacion1);
      expect(id, isNotNull);
      final relacionObtenida = await repo.getByProducto(1);

      expect(relacionObtenida.first.cantidadRequerida, 10);
    });

    test(
      'Create many relations and get all with idProducto are same',
      () async {
        final relacion1 = InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId1,
          cantidadRequerida: 10,
        );
        final relacion2 = InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId2,
          cantidadRequerida: 20,
        );
        final relacion3 = InsumoProducto(
          idInsumo: insumoId2,
          idProducto: insumoId1,
          cantidadRequerida: 30,
        );
        await repo.create(relacion1);
        await repo.create(relacion2);
        await repo.create(relacion3);

        final relacionesObtenidas = await repo.getByProducto(productoId1);
        expect(relacionesObtenidas.length, 2);
        expect(relacionesObtenidas.first.cantidadRequerida, 10);
        expect(relacionesObtenidas.last.cantidadRequerida, 30);
      },
    );

    test('Update relations', () async {
      final relacion2 = InsumoProducto(
        idInsumo: insumoId1,
        idProducto: productoId2,
        cantidadRequerida: 20,
      );
      final id = await repo.create(relacion2);

      final relacionActualizada = relacion2.copyWith(
        id: id,
        cantidadRequerida: 99,
        idInsumo: 2,
      );
      final idUpdated = await repo.update(relacionActualizada);
      final getUpdatedRelation = await repo.getById(idUpdated);

      expect(getUpdatedRelation.id, id);
      expect(getUpdatedRelation.cantidadRequerida, 99);
      expect(getUpdatedRelation.idInsumo, 2);
    });
    test(
      'Delete insumoproducto relacion whit productID or with insumoproductoID',
      () async {
        final relacion1 = InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId1,
          cantidadRequerida: 10,
        );
        final relacion2 = InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId2,
          cantidadRequerida: 20,
        );
        final relacion3 = InsumoProducto(
          idInsumo: insumoId2,
          idProducto: productoId2,
          cantidadRequerida: 30,
        );
        final idToDelete = await repo.create(relacion1);
        await repo.create(relacion2);
        await repo.create(relacion3);
        var all = await repo.getAll();
        expect(all.length, 3);

        final rowsaffected = await repo.deleteByProducto(productoId2);
        expect(rowsaffected, 2);

        final rowsAffected2 = await repo.delete(idToDelete);
        expect(rowsAffected2, 1);

        all = await repo.getAll();
        expect(all.length, 0);
      },
    );
  });
}
