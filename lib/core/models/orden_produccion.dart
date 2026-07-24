import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
part 'orden_produccion.freezed.dart';
part 'orden_produccion.g.dart';

@freezed
abstract class OrdenProduccion with _$OrdenProduccion {
  const factory OrdenProduccion({
    @JsonKey(name: 'id_orden_produccion') int? idOrdenProduccion,
    @JsonKey(name: 'id_receta') required int idReceta,
    @JsonKey(name: 'cantidad_producida') required double cantidadProducida,
    required DateTime fecha,
    @JsonKey(name: 'costo_total_produccion')
    required double costoTotalProduccion,
    String? notas,
    @IntToBoolConverter() @Default(true) bool activo,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _OrdenProduccion;

  factory OrdenProduccion.fromJson(Map<String, dynamic> json) =>
      _$OrdenProduccionFromJson(json);
}
