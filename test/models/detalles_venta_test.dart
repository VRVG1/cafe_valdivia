import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/detalle_venta_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleVenta', () {
    final detalleVenta = DetalleVenta(
      idDetalleVenta: 1,
      idVenta: 10,
      idProducto: 20,
      cantidad: 3,
      precioUnitarioVenta: '15.50',
    );

    final detalleVentaJson = {
      'id_detalle_venta': 1,
      'id_venta': 10,
      'id_producto': 20,
      'cantidad': 3,
      'precio_unitario_venta': '15.50',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = DetalleVenta.fromJson(detalleVentaJson);
      expect(fromJson, detalleVenta);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = detalleVenta.toJson();
      expect(toJson, detalleVentaJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = detalleVenta.copyWith(cantidad: 5);

      expect(copia.cantidad, 5);
      // Los demás valores deben permanecer iguales
      expect(copia.idVenta, detalleVenta.idVenta);
      expect(copia.idVenta, detalleVenta.idVenta);
      expect(copia.idProducto, detalleVenta.idProducto);
      expect(copia.precioUnitarioVenta, detalleVenta.precioUnitarioVenta);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final dv1 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idProducto: 20,
        cantidad: 3,
        precioUnitarioVenta: '15.50',
      );
      final dv2 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idProducto: 20,
        cantidad: 3,
        precioUnitarioVenta: '15.50',
      );

      expect(dv1, dv2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final dv1 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idProducto: 20,
        cantidad: 3,
        precioUnitarioVenta: '15.50',
      );
      final dv2 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idProducto: 20,
        cantidad: 3,
        precioUnitarioVenta: '15.50',
      );

      expect(dv1.hashCode, dv2.hashCode);
    });

    group('Extension', () {
      test('subTotal calcula el valor correcto en centavos', () {
        // 3 * 15.50 = 46.50 -> 4650 centavos
        expect(detalleVenta.subTotal, 4650);
      });

      test('subTotalFormateado retorna el string correcto', () {
        expect(detalleVenta.subTotalFormateado, '46.50');
      });

      test('subTotal con precio inválido retorna 0', () {
        final detalleInvalido = detalleVenta.copyWith(
          precioUnitarioVenta: 'invalido',
        );
        expect(detalleInvalido.subTotal, 0);
        expect(detalleInvalido.subTotalFormateado, '0.00');
      });
    });
  });
}
