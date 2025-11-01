import 'package:freezed_annotation/freezed_annotation.dart';
part 'movimiento_inventario_producto.freezed.dart';
part 'movimiento_inventario_producto.g.dart';

@freezed
abstract class MovimientoInventarioProducto
    with _$MovimientoInventarioProducto {
  const factory MovimientoInventarioProducto({
    int? id,
    required int idProducto,
    String? tipo,
    required int cantidad,
    required DateTime fecha,
    required int idDetalleVenta,
    required int idDetalleProduccion,
    String? motivo,
  }) = _MovimientoInventarioProducto;

  factory MovimientoInventarioProducto.fromJson(Map<String, dynamic> json) =>
      _$MovimientoInventarioProductoFromJson(json);
}
