import 'package:freezed_annotation/freezed_annotation.dart';
part 'movimiento_inventario_insumo.freezed.dart';
part 'movimiento_inventario_insumo.g.dart';

@freezed
abstract class MovimientoInventarioInsumo with _$MovimientoInventarioInsumo {
  const factory MovimientoInventarioInsumo({
    int? id,
    required int idInsumo,
    String? tipo,
    required int cantidad,
    required DateTime fecha,
    required int idDetalleCompra,
    required int idDetalleProduccion,
    String? motivo,
  }) = _MovimientoInventarioInsumo;

  factory MovimientoInventarioInsumo.fromJson(Map<String, dynamic> json) =>
      _$MovimientoInventarioInsumoFromJson(json);
}
