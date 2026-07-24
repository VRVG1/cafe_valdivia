import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafe_valdivia/core/models/converters.dart';

part 'orden_produccion_consumo.freezed.dart';
part 'orden_produccion_consumo.g.dart';

@freezed
abstract class OrdenProduccionConsumo with _$OrdenProduccionConsumo {
  const factory OrdenProduccionConsumo({
    @JsonKey(name: 'id_consumo') int? idConsumo,
    @JsonKey(name: 'id_orden_produccion') required int idOrdenProduccion,
    @JsonKey(name: 'id_articulo') required int idArticulo,
    @JsonKey(name: 'cantidad_usada') required double cantidadUsada,
    @JsonKey(name: 'costo_articulo_momento')
    required double costoArticuloMomento,
    @IntToBoolConverter() @Default(true) bool activo,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _OrdenProduccionConsumo;

  factory OrdenProduccionConsumo.fromJson(Map<String, dynamic> json) =>
      _$OrdenProduccionConsumoFromJson(json);
}
