import 'package:cafe_valdivia/core/models/articulo_producto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ArticuloProducto', () {
    final articuloProducto = ArticuloProducto(
      idArticuloProducto: 1,
      idArticulo: 10,
      idProducto: 20,
      nombre: 'Azúcar',
      cantidadRequerida: 0.5,
    );

    final articuloProductoJson = {
      'id_articulo_producto': 1,
      'id_articulo': 10,
      'id_producto': 20,
      'nombre': 'Azúcar',
      'cantidad_requerida': 0.5,
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = ArticuloProducto.fromJson(articuloProductoJson);
      expect(fromJson, articuloProducto);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = articuloProducto.toJson();
      expect(toJson, articuloProductoJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = articuloProducto.copyWith(cantidadRequerida: 1.0);

      expect(copia.cantidadRequerida, 1.0);
      // Los demás valores deben permanecer iguales
      expect(copia.idArticuloProducto, articuloProducto.idArticuloProducto);
      expect(copia.idArticulo, articuloProducto.idArticulo);
      expect(copia.idProducto, articuloProducto.idProducto);
      expect(copia.nombre, articuloProducto.nombre);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final ip1 = ArticuloProducto(
        idArticuloProducto: 1,
        idArticulo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );
      final ip2 = ArticuloProducto(
        idArticuloProducto: 1,
        idArticulo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );

      expect(ip1, ip2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final ip1 = ArticuloProducto(
        idArticuloProducto: 1,
        idArticulo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );
      final ip2 = ArticuloProducto(
        idArticuloProducto: 1,
        idArticulo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );

      expect(ip1.hashCode, ip2.hashCode);
    });
  });
}
