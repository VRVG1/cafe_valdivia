import "package:cafe_valdivia/models/producto.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Pruebas del modelo producto", () {
    test("Probar si el toMap() si regresa un mapa valido", () {
      final producto = Producto(
        idProducto: 1,
        nombre: "Cafe molido",
        descripcion: "Cafe molido bien chido",
        precioVenta: 100.0,
        stockDisponible: 50,
      );

      final map = producto.toMap();

      expect(map['id_producto'], 1);
      expect(map['nombre'], "Cafe molido");
      expect(map['descripcion'], "Cafe molido bien chido");
      expect(map['precio_venta'], 100.0);
      expect(map['stock_disponible'], 50);
    });

    test('Probar si el fromMap() si crea un objeto tipo producto valido', () {
      final map = {
        'id_producto': 2,
        'nombre': 'Cafe tostado medio',
        'descripcion': 'Cafe tostado al estilo medio',
        'precio_venta': 200.0,
        'stock_disponible': 20,
      };

      final producto = Producto.fromMap(map);

      expect(producto.idProducto, 2);
      expect(producto.nombre, 'Cafe tostado medio');
      expect(producto.descripcion, 'Cafe tostado al estilo medio');
      expect(producto.precioVenta, 200.0);
      expect(producto.stockDisponible, 20);
    });

    test(
      'Al usar el toMap() es capaz de manejar los valores por defecto y nulos',
      () {
        final producto = Producto(
          idProducto: 3,
          nombre: 'Cafe sin stock',
          descripcion: null,
          precioVenta: 0.0,
          stockDisponible: 0,
        );

        final map = producto.toMap();

        expect(map['id_producto'], 3);
        expect(map['nombre'], 'Cafe sin stock');
        expect(map['descripcion'], isNull);
        expect(map['precio_venta'], 0.0);
        expect(map['stock_disponible'], 0);
      },
    );
  });
}
