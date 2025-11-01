import 'package:cafe_valdivia/models/insumo_producto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test model insumo_producto', () {
    final insumoProductoObjeto = InsumoProducto(
      idInsumo: 10,
      idProducto: 20,
      cantidadRequerida: 8,
      nombre: "Bolita",
    );
    final insumoProducoMap = {
      'idInsumo': 10,
      'idProducto': 50,
      'cantidadRequerida': 9,
      'nombre': "Cordoba",
    };

    test("fromJson works correctly?", () {
      final objeto = InsumoProducto.fromJson(insumoProducoMap);

      expect(objeto.idInsumo, 10);
      expect(objeto.idProducto, 50);
      expect(objeto.cantidadRequerida, 9);
    });

    test('toJson works correctly?', () {
      final mapa = insumoProductoObjeto.toJson();

      expect(mapa['idInsumo'], 10);
      expect(mapa['idProducto'], 20);
      expect(mapa['cantidadRequerida'], 8);
    });
  });
}
