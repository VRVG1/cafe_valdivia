import 'package:cafe_valdivia/core/models/detalle_venta.dart';
import 'package:cafe_valdivia/core/models/detalle_venta_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleVenta', () {
    final detalleVenta = DetalleVenta(
      idDetalleVenta: 1,
      idVenta: 10,
      idArticulo: 20,
      cantidad: 3.0,
      precioUnitarioVenta: 15.50,
    );

    final detalleVentaJson = {
      'id_detalle_venta': 1,
      'id_venta': 10,
      'id_articulo': 20,
      'cantidad': 3.0,
      'precio_unitario_venta': 15.50,
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
      final copia = detalleVenta.copyWith(cantidad: 5.0);

      expect(copia.cantidad, 5.0);

      expect(copia.idVenta, detalleVenta.idVenta);
      expect(copia.idVenta, detalleVenta.idVenta);
      expect(copia.idArticulo, detalleVenta.idArticulo);
      expect(copia.precioUnitarioVenta, detalleVenta.precioUnitarioVenta);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final dv1 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idArticulo: 20,
        cantidad: 3.0,
        precioUnitarioVenta: 15.50,
      );
      final dv2 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idArticulo: 20,
        cantidad: 3.0,
        precioUnitarioVenta: 15.50,
      );

      expect(dv1, dv2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final dv1 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idArticulo: 20,
        cantidad: 3.0,
        precioUnitarioVenta: 15.50,
      );
      final dv2 = DetalleVenta(
        idDetalleVenta: 1,
        idVenta: 10,
        idArticulo: 20,
        cantidad: 3.0,
        precioUnitarioVenta: 15.50,
      );

      expect(dv1.hashCode, dv2.hashCode);
    });

    group('Extension', () {
      test('subTotal calcula el valor correcto en centavos', () {
        expect(detalleVenta.subTotal, 46.50);
      });

      test('subTotalFormateado retorna el string correcto', () {
        expect(detalleVenta.subTotalFormateado, '46.50');
      });

    });
  });
}
