import 'package:freezed_annotation/freezed_annotation.dart';
part 'orden_produccion.freezed.dart';
part 'orden_produccion.g.dart';

@freezed
abstract class OrdenProduccion with _$OrdenProduccion {
  const factory OrdenProduccion({
    @JsonKey(name: 'id_orden_produccion') int? id,
    required int idProducto,
    required int cantidad_producida,
    required DateTime fecha,
    required String costo_total_produccion,
    String? notas,
  }) = _OrdenProduccion;

  factory OrdenProduccion.fromJson(Map<String, dynamic> json) =>
      _$OrdenProduccionFromJson(json);
}
