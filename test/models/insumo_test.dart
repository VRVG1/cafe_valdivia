import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Articulo', () {
    final articulo = Articulo(
      nombre: "Cafe verde arabica",
      descripcion: "Cafe verde de alta calidad",
      idUnidad: 1,
      costoUnitario: 25.50,
      tipo: ArticuloTipo.insumo,
      precioVenta: 0.0,
      stock: 0.0,
    );

    final articuloJson = {
      'id_articulo': 1,
      'nombre': 'Café en grano',
      'descripcion': 'Grano de café de altura',
      'id_unidad': 1,
      'costo_unitario': 25.50,
      'precio_venta': 0.0,
      'stock': 0.0,
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = Articulo.fromJson(articuloJson);
      expect(fromJson, articulo);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = articulo.toJson();
      expect(toJson, articuloJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = articulo.copyWith(costoUnitario: 28.00);

      expect(copia.costoUnitario, 28.00);
      // Los demás valores deben permanecer iguales
      expect(copia.idArticulo, articulo.idArticulo);
      expect(copia.nombre, articulo.nombre);
      expect(copia.descripcion, articulo.descripcion);
      expect(copia.idUnidad, articulo.idUnidad);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final i1 = Articulo(
        idArticulo: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: 25.50,
        tipo: ArticuloTipo.insumo,
        precioVenta: 0.0,
        stock: 0.0,
      );
      final i2 = Articulo(
        idArticulo: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: 25.50,
        tipo: ArticuloTipo.insumo,
        precioVenta: 0.0,
        stock: 0.0,
      );

      expect(i1, i2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final i1 = Articulo(
        idArticulo: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: 25.50,
        tipo: ArticuloTipo.insumo,
        precioVenta: 0.0,
        stock: 0.0,
      );
      final i2 = Articulo(
        idArticulo: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: 25.50,
        tipo: ArticuloTipo.insumo,
        precioVenta: 0.0,
        stock: 0.0,
      );

      expect(i1.hashCode, i2.hashCode);
    });
  });
}
