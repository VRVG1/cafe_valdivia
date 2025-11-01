import 'package:freezed_annotation/freezed_annotation.dart';
part 'detalle_venta.freezed.dart';
part 'detalle_venta.g.dart';

@freezed
abstract class DetalleVenta with _$DetalleVenta {
  const factory DetalleVenta({
    int? id,
    required int idVenta,
    required int idProducto,
    required int cantidad,
    required String precioUnitarioVenta,
  }) = _DetalleVenta;

  factory DetalleVenta.fromJson(Map<String, dynamic> json) =>
      _$DetalleVentaFromJson(json);
}
