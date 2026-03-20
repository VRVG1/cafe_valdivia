import 'package:freezed_annotation/freezed_annotation.dart';
part 'movimiento_inventario_insumo.freezed.dart';
part 'movimiento_inventario_insumo.g.dart';

@freezed
abstract class MovimientoInventarioInsumo with _$MovimientoInventarioInsumo {
  const factory MovimientoInventarioInsumo({
    @JsonKey(name: 'id_movimiento_inventario_insumo')
    int? idMovimientoInventarioInsumo,
    @JsonKey(name: 'id_insumo') required int idInsumo,
    String? tipo,
    required int cantidad,
    required DateTime fecha,
    @JsonKey(name: 'id_detalle_compra') required int idDetalleCompra,
    @JsonKey(name: 'id_detalle_produccion') required int idDetalleProduccion,
    String? motivo,
  }) = _MovimientoInventarioInsumo;

  factory MovimientoInventarioInsumo.fromJson(Map<String, dynamic> json) =>
      _$MovimientoInventarioInsumoFromJson(json);
}
