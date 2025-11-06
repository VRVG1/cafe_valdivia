import 'package:freezed_annotation/freezed_annotation.dart';
part 'orden_produccion.freezed.dart';
part 'orden_produccion.g.dart';

@freezed
abstract class OrdenProduccion with _$OrdenProduccion {
  const factory OrdenProduccion({
    @JsonKey(name: 'id_orden_produccion') int? idOrdenProduccion,
    @JsonKey(name: 'id_producto') required int idProducto,
    @JsonKey(name: 'cantidad_producida') required int cantidadProducida,
    required DateTime fecha,
    @JsonKey(name: 'costo_total_produccion')
    required String costoTotalProduccion,
    String? notas,
  }) = _OrdenProduccion;

  factory OrdenProduccion.fromJson(Map<String, dynamic> json) =>
      _$OrdenProduccionFromJson(json);
}
