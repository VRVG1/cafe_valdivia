import 'package:freezed_annotation/freezed_annotation.dart';
part 'detalle_venta.freezed.dart';
part 'detalle_venta.g.dart';

@freezed
abstract class DetalleVenta with _$DetalleVenta {
  const factory DetalleVenta({
    @JsonKey(name: 'id_detalle_venta') int? idDetalleVenta,
    @JsonKey(name: 'id_venta') required int idVenta,
    @JsonKey(name: 'id_producto') required int idProducto,
    required int cantidad,
    @JsonKey(name: 'precio_unitario_venta') required String precioUnitarioVenta,
  }) = _DetalleVenta;

  factory DetalleVenta.fromJson(Map<String, dynamic> json) =>
      _$DetalleVentaFromJson(json);
}
