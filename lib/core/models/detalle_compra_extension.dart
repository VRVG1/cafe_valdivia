import 'package:cafe_valdivia/core/models/detalle_compra.dart';

extension DetalleCompraExtension on DetalleCompra {
  double get subTotal {
    return precioUnitarioCompra * cantidad;
  }

  String get subTotalFormateado {
    return subTotal.toStringAsFixed(2);
  }
}
