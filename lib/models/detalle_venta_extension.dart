import 'package:cafe_valdivia/models/detalle_venta.dart';

extension DetalleVentaExtension on DetalleVenta {
  int get subTotal {
    final double? precioUnitarioDouble = double.tryParse(precioUnitarioVenta);
    final int precioUnitarioCentavos = (precioUnitarioDouble != null)
        ? (precioUnitarioDouble * 100).round()
        : 0;
    return precioUnitarioCentavos * cantidad;
  }

  String get subTotalFormateado {
    final int totalCentavos = subTotal;
    final double totalDecimal = totalCentavos / 100.0;

    return totalDecimal.toStringAsFixed(2);
  }
}
