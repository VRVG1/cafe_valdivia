import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleCompra Model Tests', () {
    final testMap = {
      'id_detalle_compra': 1,
      'id_compra': 100,
      'id_insumo': 200,
      'cantidad': 5.0,
      'costo_unitario': 2.5,
    };

    test('fromMap creates correct instance', () {
      final detalle = DetalleCompra.fromMap(testMap);

      expect(detalle.id, 1);
      expect(detalle.idCompra, 100);
      expect(detalle.idInsumo, 200);
      expect(detalle.cantidad, 5.0);
      expect(detalle.costoUnitario, 2.5);
    });

    test('toMap returns correct structure', () {
      final detalle = DetalleCompra(
        id: 1,
        idCompra: 100,
        idInsumo: 200,
        cantidad: 5.0,
        costoUnitario: 2.5,
      );

      final map = detalle.toMap();

      expect(map['id_detalle_compra'], 1);
      expect(map['id_compra'], 100);
      expect(map['id_insumo'], 200);
      expect(map['cantidad'], 5.0);
      expect(map['costo_unitario'], 2.5);
    });

    test('subtotal calculates correctly', () {
      final detalle = DetalleCompra(
        cantidad: 4,
        costoUnitario: 3.25,
        idCompra: 1,
        idInsumo: 1,
      );

      expect(detalle.subtotal, 13.0); // 4 * 3.25 = 13.0
    });
  });
}
