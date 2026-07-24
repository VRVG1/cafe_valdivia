import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
part 'receta.freezed.dart';
part 'receta.g.dart';

@freezed
abstract class Receta with _$Receta {
  const factory Receta({
    @JsonKey(name: 'id_receta') int? idReceta,
    @JsonKey(name: 'id_articulo_producto') required int idArticuloProducto,
    required String nombre,
    required double cantidad_base,
    @IntToBoolConverter() @Default(true) bool activo,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Receta;

  factory Receta.fromJson(Map<String, dynamic> json) => _$RecetaFromJson(json);
}
