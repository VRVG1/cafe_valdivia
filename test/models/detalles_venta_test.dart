import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/detalle_venta_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("DetalleVenta", () {
    final testMap = {
      'id_detalle_venta': 1,
      'idVenta': 100,
      'idProducto': 200,
      'cantidad': 3,
      'precioUnitarioVenta': "7.5",
    };
    final testVenta = DetalleVenta(
      id: 1,
      idVenta: 20,
      idProducto: 30,
      cantidad: 6,
      precioUnitarioVenta: "20.00",
    );

    test('fromJson creates correct instance', () {
      final detalle = DetalleVenta.fromJson(testMap);

      expect(detalle.id, 1);
      expect(detalle.idVenta, 100);
      expect(detalle.idProducto, 200);
      expect(detalle.cantidad, 3);
      expect(detalle.precioUnitarioVenta, "7.5");
    });

    test('toJson returns a correct structure', () {
      final mapa = testVenta.toJson();

      expect(mapa['id_detalle_venta'], 1);
      expect(mapa['idVenta'], 20);
      expect(mapa['idProducto'], 30);
      expect(mapa['cantidad'], 6);
      expect(mapa['precioUnitarioVenta'], "20.00");
    });

    test("subtotal calculates correctly", () {
      expect(testVenta.subTotalFormateado, "120.00");
    });

    test("CopyWith works correctly", () {
      final copy = testVenta.copyWith(cantidad: 8, precioUnitarioVenta: "10.0");

      expect(copy.id, 1);
      expect(copy.cantidad, 8);
      expect(copy.precioUnitarioVenta, "10.0");
      expect(identical(copy, testVenta), false);
    });
  });
}
