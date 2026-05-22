import 'package:cafe_valdivia/core/models/detalle_venta.dart';

extension DetalleVentaExtension on DetalleVenta {
  double get subTotal {
    return precioUnitarioVenta * cantidad;
  }

  String get subTotalFormateado {
    return subTotal.toStringAsFixed(2);
  }
}
