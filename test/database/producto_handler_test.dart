import "package:cafe_valdivia/handler/producto_handler.dart";
import "package:cafe_valdivia/models/producto.dart";
import 'package:flutter_test/flutter_test.dart';
import "package:sqflite/sqflite.dart";
import "./test_database_helper.dart";

void main() {
  late Database database;
  late ProductoHandler productoHandler;

  setUp(() async {
    database = await openTestDatabase();
    productoHandler = ProductoHandler(() async => database);
  });

  tearDown(() async {
    await database.close();
  });

  group("Test ProductoHandler", () {
    test("Test insertar un nuevo produto", () async {
      final producto = Producto(
        nombre: "Café Americano",
        precioVenta: 20,
        stockDisponible: 10,
        descripcion: "Cafe Americano simple",
      );

      final id = await productoHandler.insert(producto);

      expect(id, isNotNull);
      expect(id, greaterThan(0));

      final productoObtenido = await productoHandler.getById(id);

      expect(productoObtenido, isNotNull);
      expect(productoObtenido!.nombre, 'Café Americano');
      expect(productoObtenido.precioVenta, 20);
      expect(productoObtenido.stockDisponible, 10);
      expect(productoObtenido.descripcion, 'Cafe Americano simple');
    });

    test("Obtener todos los productos", () async {
      final producto1 = Producto(
        nombre: "Cafe Latte",
        precioVenta: 25,
        stockDisponible: 15,
        descripcion: "Cafe Latte con leche",
      );

      final producto2 = Producto(
        nombre: "Café Mocha",
        precioVenta: 30,
        stockDisponible: 5,
        descripcion: "Café con chocolate",
      );

      await productoHandler.insert(producto1);
      await productoHandler.insert(producto2);

      final todosLosProductos = await productoHandler.get();

      expect(todosLosProductos, isNotEmpty);
      expect(todosLosProductos.length, 2);
      expect(todosLosProductos.any((p) => p.nombre == "Cafe Latte"), isTrue);
      expect(todosLosProductos.any((p) => p.nombre == "Café Mocha"), isTrue);
    });

    test("Actualizar un producto existente", () async {
      final productoOriginal = Producto(
        nombre: "Café Espresso",
        precioVenta: 15,
        stockDisponible: 20,
        descripcion: "Café espresso fuerte",
      );

      final id = await productoHandler.insert(productoOriginal);

      expect(id, isNotNull);

      final productoActualizado = Producto(
        idProducto: id,
        nombre: "Café Espresso Doble",
        precioVenta: 18,
        stockDisponible: 25,
        descripcion: "Café espresso doble fuerte",
      );

      final productoModificado = await productoHandler.update(
        productoActualizado,
      );

      expect(productoModificado, 1);
      final productoObtenido = await productoHandler.getById(id);
      expect(productoObtenido!.nombre, 'Café Espresso Doble');
      expect(productoObtenido.precioVenta, 18);
      expect(productoObtenido.stockDisponible, 25);
      expect(productoObtenido.descripcion, 'Café espresso doble fuerte');
    });

    test("Eliminar un producto existente", () async {
      final producto = Producto(
        nombre: "Café Capuchino",
        precioVenta: 22,
        stockDisponible: 12,
        descripcion: "Café capuchino con espuma",
      );

      final id = await productoHandler.insert(producto);
      expect(id, isNotNull);

      final eliminado = await productoHandler.delete(id);
      expect(eliminado, 1);

      final productoObtenido = await productoHandler.getById(id);
      expect(productoObtenido, isNull);
    });

    test("Verificar que de error al buscar un producto inexsitente", () async {
      final proudctoInexistente = await productoHandler.getById(920);
      expect(proudctoInexistente, isNull);
    });
  });
}
