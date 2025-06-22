import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("DetalleVenta", () {
    final testMap = {
      'id_detalle_venta': 1,
      'id_venta': 100,
      'id_producto': 200,
      'cantidad': 3,
      'precio_unitario_venta': 7.5,
    };
    final testVenta = DetalleVenta(
      id: 1,
      idVenta: 20,
      idProducto: 30,
      cantidad: 6,
      precioUnitarioVenta: 20.0,
    );

    test('fromMap creates correct instance', () {
      final detalle = DetalleVenta.fromMap(testMap);

      expect(detalle.id, 1);
      expect(detalle.idVenta, 100);
      expect(detalle.idProducto, 200);
      expect(detalle.cantidad, 3);
      expect(detalle.precioUnitarioVenta, 7.5);
    });

    test('toMap returns a correct structure', () {
      final mapa = testVenta.toMap();

      expect(mapa['id_detalle_venta'], 1);
      expect(mapa['id_venta'], 20);
      expect(mapa['id_producto'], 30);
      expect(mapa['cantidad'], 6);
      expect(mapa['precio_unitario_venta'], 20.0);
    });

    test("subtotal calculates correctly", () {
      expect(testVenta.subtotal, 120.0);
    });

    test("CopyWith works correctly", () {
      final copy = testVenta.copyWith(cantidad: 8, precioUnitarioVenta: 10.0);

      expect(copy.id, 1);
      expect(copy.cantidad, 8);
      expect(copy.precioUnitarioVenta, 10.0);
      expect(identical(copy, testVenta), false);
    });
  });
}
