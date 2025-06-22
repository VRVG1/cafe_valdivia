import 'package:cafe_valdivia/models/insumo_producto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test model insumo_producto', () {
    final insumoProductoObjeto = InsumoProducto(
      idInsumo: 10,
      idProducto: 20,
      cantidadRequerida: 8,
    );
    final insumoProducoMap = {
      'id_insumo': 10,
      'id_producto': 50,
      'cantidad_requerida': 9,
    };

    test("fromMap works correctly?", () {
      final objeto = InsumoProducto.fromMap(insumoProducoMap);

      expect(objeto.idInsumo, 10);
      expect(objeto.idProducto, 50);
      expect(objeto.cantidadRequerida, 9);
    });

    test('toMap works correctly?', () {
      final mapa = insumoProductoObjeto.toMap();

      expect(mapa['id_insumo'], 10);
      expect(mapa['id_producto'], 20);
      expect(mapa['cantidad_requerida'], 8);
    });
  });
}
