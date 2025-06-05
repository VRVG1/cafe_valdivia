import 'package:cafe_valdivia/handler/insumo_handler.dart';
import 'package:cafe_valdivia/handler/insumo_producto_handler.dart';
import 'package:cafe_valdivia/handler/producto_handler.dart';
import 'package:cafe_valdivia/models/insumo_producto.dart';
import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:sqflite/sqflite.dart';
import './test_database_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Database database;
  late InsumoProductoHandler insumoProductoHandler;
  late InsumoHandler insumoHandler;
  late ProductoHandler productoHandler;

  setUp(() async {
    database = await openTestDatabase();
    insumoProductoHandler = InsumoProductoHandler(() async => database);
    insumoHandler = InsumoHandler(() async => database);
    productoHandler = ProductoHandler(() async => database);
  });

  tearDown(() async {
    await database.close();
  });

  group("Test InsumoProductoHandler", () {
    late int productoId1;
    late int productoId2;
    late int insumoId1;
    late int insumoId2;

    setUpAll(() async {
      final tempDB = await openTestDatabase();
      final tempInsumoHandler = InsumoHandler(() async => tempDB);
      final tempProductoHandler = ProductoHandler(() async => tempDB);

      insumoId1 = await tempInsumoHandler.insert(
        Insumos(nombre: "Test Insumo", unidadMedida: "KG"),
      );
      insumoId2 = await tempInsumoHandler.insert(
        Insumos(nombre: "Test insumo 2", unidadMedida: "KG"),
      );
      productoId1 = await tempProductoHandler.insert(
        Producto(
          nombre: "Cafe latter",
          precioVenta: 20.0,
          stockDisponible: 100,
        ),
      );
      productoId2 = await tempProductoHandler.insert(
        Producto(
          nombre: "Cafe americano",
          precioVenta: 25.0,
          stockDisponible: 50,
        ),
      );

      await tempDB.close();
    });

    test("Insertar una relacion insumo-producto", () async {
      final insumoProducto = InsumoProducto(
        idInsumo: insumoId1,
        idProducto: productoId1,
        cantidadRequerida: 2.0,
      );

      final id = await insumoProductoHandler.insert(insumoProducto);
      expect(id, isNotNull);
      expect(id, greaterThan(0));

      final fetchedInsumoProducto = await insumoProductoHandler.get();

      expect(fetchedInsumoProducto.length, 1);
      expect(fetchedInsumoProducto.first.idInsumo, insumoId1);
      expect(fetchedInsumoProducto.first.idProducto, productoId1);
      expect(fetchedInsumoProducto.first.cantidadRequerida, 2.0);
    });

    test("Obtener todas las relaciones de insumo-producto", () async {
      await insumoProductoHandler.insert(
        InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId1,
          cantidadRequerida: 2.0,
        ),
      );
      await insumoProductoHandler.insert(
        InsumoProducto(
          idInsumo: insumoId2,
          idProducto: productoId2,
          cantidadRequerida: 3.0,
        ),
      );

      final relaciones = await insumoProductoHandler.get();
      expect(relaciones.length, 2);
      expect(
        relaciones.any(
          (r) => r.idProducto == productoId1 && r.idInsumo == insumoId1,
        ),
        isTrue,
      );
      expect(
        relaciones.any(
          (r) => r.idProducto == productoId2 && r.idInsumo == insumoId2,
        ),
        isTrue,
      );
    });

    test("Obtener relaciones por id de producto", () async {
      await insumoProductoHandler.insert(
        InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId1,
          cantidadRequerida: 2.0,
        ),
      );
      await insumoProductoHandler.insert(
        InsumoProducto(
          idInsumo: insumoId2,
          idProducto: productoId1,
          cantidadRequerida: 3.0,
        ),
      );
      await insumoProductoHandler.insert(
        InsumoProducto(
          idInsumo: insumoId2,
          idProducto: productoId2,
          cantidadRequerida: 1.0,
        ),
      );

      final relaciones = await insumoProductoHandler.getByProductoId(
        productoId1,
      );
      expect(relaciones.length, 2);
      expect(
        relaciones.any(
          (r) => r.idInsumo == insumoId1 && r.cantidadRequerida == 2.0,
        ),
        isTrue,
      );
      expect(
        relaciones.any(
          (r) => r.idInsumo == insumoId2 && r.cantidadRequerida == 3.0,
        ),
        isTrue,
      );
    });

    test("Actualizar una relacon insumo-producto", () async {
      final insumoProducto = InsumoProducto(
        idInsumo: insumoId1,
        idProducto: productoId1,
        cantidadRequerida: 2.0,
      );
      final id = await insumoProductoHandler.insert(insumoProducto);

      final updatedInsumoProducto = InsumoProducto(
        idInsumoProducto: id,
        idInsumo: insumoId1,
        idProducto: productoId1,
        cantidadRequerida: 3.0,
      );

      final updatedId = await insumoProductoHandler.update(
        updatedInsumoProducto,
      );

      expect(updatedId, 1);
      final fetchedRelaciones = await insumoProductoHandler.get();
      expect(fetchedRelaciones.first.cantidadRequerida, 3.0);
    });

    test("Eliminar un insumo-producto", () async {
      final insumoProducto = InsumoProducto(
        idInsumo: insumoId1,
        idProducto: productoId1,
        cantidadRequerida: 2.0,
      );
      final id = await insumoProductoHandler.insert(insumoProducto);
      expect(id, isNotNull);

      final deletedId = await insumoProductoHandler.delete(id);
      expect(deletedId, 1);

      final relaciones = await insumoProductoHandler.get();
      expect(relaciones.length, 0);
    });

    test("Eliminar insumo-producto mediante idProducto e idInsumo", () async {
      await insumoProductoHandler.insert(
        InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId1,
          cantidadRequerida: 2.0,
        ),
      );
      await insumoProductoHandler.insert(
        InsumoProducto(
          idInsumo: insumoId2,
          idProducto: productoId2,
          cantidadRequerida: 3.0,
        ),
      );

      final eliminado = await insumoProductoHandler
          .deleteInsumoProductoByProductoYInsumo(insumoId1, productoId1);

      expect(eliminado, 1);

      final obtenerTodos = await insumoProductoHandler.get();
      expect(obtenerTodos.length, 1);
      expect(obtenerTodos.first.idInsumo, insumoId2);
    });

    test(
      "Agregar una relacion duplicada deberia dar error ya que (productoId, insumoId) son pares unicos",
      () async {
        await insumoProductoHandler.insert(
          InsumoProducto(
            idInsumo: insumoId1,
            idProducto: productoId1,
            cantidadRequerida: 2.0,
          ),
        );

        // Clonar el insumo-producto para intentar insertar un duplicado
        final duplicateInsert = InsumoProducto(
          idInsumo: insumoId1,
          idProducto: productoId1,
          cantidadRequerida: 8.0,
        );

        expectLater(
          () async => await insumoProductoHandler.insert(duplicateInsert),
          throwsA(isA<DatabaseException>()),
        );
      },
    );

    test("Buscar un insumo que no existe", () async {
      final id = await insumoProductoHandler.getById(9999);
      expect(id, isNull);
    });
  });
}
