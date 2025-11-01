import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/models/detalle_compra_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleCompra Model Tests', () {
    final testMap = {
      'id_detalle_compra': 1,
      'idCompra': 100,
      'idInsumo': 200,
      'cantidad': 5,
      'precioUnitarioCompra': "2.5",
    };

    test('fromJson creates correct instance', () {
      final detalle = DetalleCompra.fromJson(testMap);

      expect(detalle.id, 1);
      expect(detalle.idCompra, 100);
      expect(detalle.idInsumo, 200);
      expect(detalle.cantidad, 5.0);
      expect(detalle.precioUnitarioCompra, "2.5");
    });

    test('toJson returns correct structure', () {
      final detalle = DetalleCompra(
        id: 1,
        idCompra: 100,
        idInsumo: 200,
        cantidad: 5,
        precioUnitarioCompra: "2.5",
      );

      final map = detalle.toJson();

      expect(map['id_detalle_compra'], 1);
      expect(map['idCompra'], 100);
      expect(map['idInsumo'], 200);
      expect(map['cantidad'], 5.0);
      expect(map['precioUnitarioCompra'], "2.5");
    });

    test('subtotal calculates correctly', () {
      final detalle = DetalleCompra(
        cantidad: 4,
        precioUnitarioCompra: "3.25",
        idCompra: 1,
        idInsumo: 1,
      );

      final detalle2 = DetalleCompra(
        cantidad: 9,
        precioUnitarioCompra: "3.15",
        idCompra: 1,
        idInsumo: 1,
      );

      expect(detalle.subTotalFormateado, "13.00");
      expect(detalle2.subTotalFormateado, "28.35");
    });
  });
}
