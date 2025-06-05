import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleVenta Tests', () {
    test('El metodo toMap() deberia crear un mapa valido', () {
      final detalleVenta = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 100,
        idProducto: 200,
        cantidad: 2,
        precioUnitarioVenta: 10.0,
        subtotal: 20.0,
      );

      final map = detalleVenta.toMap();

      expect(map['id_detalle_venta'], 1);
      expect(map['id_venta'], 100);
      expect(map['id_producto'], 200);
      expect(map['cantidad'], 2);
      expect(map['precio_unitario_venta'], 10.0);
      expect(map['subtotal'], 20.0);
    });

    test(
      "El metodo fromMap() crea un objeto DetalleVenta a partir de un mapa",
      () {
        final map = {
          'id_detalle_venta': 9,
          'id_venta': 492,
          'id_producto': 102,
          'cantidad': 10,
          'precio_unitario_venta': 120.0,
          'subtotal': 1200.0,
        };

        final detalleVenta = DetalleVenta.fromMap(map);

        expect(detalleVenta.idDetalleVenta, 9);
        expect(detalleVenta.idVenta, 492);
        expect(detalleVenta.idProducto, 102);
        expect(detalleVenta.cantidad, 10);
        expect(detalleVenta.precioUnitarioVenta, 120.0);
        expect(detalleVenta.subtotal, 1200.0);
      },
    );

    test(
      "El metodo toMap() es capas de manejar valores por defecto y nullos",
      () {
        final venta = DetalleVenta(
          idDetalleVenta: null,
          idVenta: 120,
          idProducto: 122,
          cantidad: 120,
          precioUnitarioVenta: 0.0,
          subtotal: 0.0,
        );

        final map = venta.toMap();

        expect(map['id_detalle_venta'], isNull);
        expect(map['id_venta'], 120);
        expect(map['id_producto'], 122);
        expect(map['cantidad'], 120);
        expect(map['precio_unitario_venta'], 0.0);
        expect(map['subtotal'], 0.0);
      },
    );
  });
}
