import 'package:freezed_annotation/freezed_annotation.dart';
part 'movimiento_inventario_producto.freezed.dart';
part 'movimiento_inventario_producto.g.dart';

TipoMovimiento? tipoMovimientoFromJson(String? tipo) {
  if (tipo == null) return null;
  return TipoMovimiento.fromValue(tipo);
}

String? tipoMovimientoToJson(TipoMovimiento? tipo) {
  return tipo?.value;
}

@freezed
abstract class MovimientoInventarioProducto
    with _$MovimientoInventarioProducto {
  const factory MovimientoInventarioProducto({
    int? id,
    required int idProducto,
    required int cantidad,
    required DateTime fecha,
    required int idDetalleVenta,
    required int idDetalleProduccion,
    @JsonKey(fromJson: tipoMovimientoFromJson, toJson: tipoMovimientoToJson)
    TipoMovimiento? tipo,
    String? motivo,
  }) = _MovimientoInventarioProducto;

  factory MovimientoInventarioProducto.fromJson(Map<String, dynamic> json) =>
      _$MovimientoInventarioProductoFromJson(json);
}

enum TipoMovimiento {
  entrada('entrada'),
  salida('salida'),
  ajuste('ajuste');

  final String value;
  const TipoMovimiento(this.value);

  factory TipoMovimiento.fromValue(String value) {
    return TipoMovimiento.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw ArgumentError('Tipo de Movimiento desconocido: $value'),
    );
  }
}
