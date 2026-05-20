import 'package:freezed_annotation/freezed_annotation.dart';
part 'receta_detalle.freezed.dart';
part 'receta_detalle.g.dart';

@freezed
abstract class RecetaDetalle with _$RecetaDetalle {
  const factory RecetaDetalle({
    @JsonKey(name: 'id_receta_detalle') int? idRecetaDetalle,
    @JsonKey(name: 'id_receta') required int idReceta,
    @JsonKey(name: 'id_articulo') required int idArticulo,
    required double cantidad,
    @JsonKey(name: 'id_unidad') required int idUnidad,
  }) = _RecetaDetalle;

  factory RecetaDetalle.fromJson(Map<String, dynamic> json) =>
      _$RecetaDetalleFromJson(json);
}
