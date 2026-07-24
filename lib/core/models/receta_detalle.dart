import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
part 'receta_detalle.freezed.dart';
part 'receta_detalle.g.dart';

@freezed
abstract class RecetaDetalle with _$RecetaDetalle {
  const factory RecetaDetalle({
    @JsonKey(name: 'id_receta_detalle') int? idRecetaDetalle,
    @JsonKey(name: 'id_receta') required int idReceta,
    @JsonKey(name: 'id_articulo_componente') required int idArticulo,
    required double cantidad,
    @JsonKey(name: 'id_unidad') required int idUnidad,
    @IntToBoolConverter() @Default(true) bool activo,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _RecetaDetalle;

  factory RecetaDetalle.fromJson(Map<String, dynamic> json) =>
      _$RecetaDetalleFromJson(json);
}
