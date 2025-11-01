import 'package:cafe_valdivia/models/producto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Producto', () {
    final producto = Producto(
      id: 1,
      nombre: 'Café en grano',
      descripcion: 'Café de grano seleccionado',
      precioVenta: '150.00',
    );

    final productoJson = {
      'id': 1,
      'nombre': 'Café en grano',
      'descripcion': 'Café de grano seleccionado',
      'precioVenta': '150.00',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = Producto.fromJson(productoJson);
      expect(fromJson, producto);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = producto.toJson();
      expect(toJson, productoJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final productoCopia = producto.copyWith(
        precioVenta: '160.00',
        descripcion: 'Café de grano premium',
      );

      expect(productoCopia.precioVenta, '160.00');
      expect(productoCopia.descripcion, 'Café de grano premium');
      // Los demás valores deben permanecer iguales
      expect(productoCopia.id, producto.id);
      expect(productoCopia.nombre, producto.nombre);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final producto1 = Producto(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Café de grano seleccionado',
        precioVenta: '150.00',
      );
      final producto2 = Producto(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Café de grano seleccionado',
        precioVenta: '150.00',
      );

      expect(producto1, producto2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final producto1 = Producto(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Café de grano seleccionado',
        precioVenta: '150.00',
      );
      final producto2 = Producto(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Café de grano seleccionado',
        precioVenta: '150.00',
      );

      expect(producto1.hashCode, producto2.hashCode);
    });
  });
}
