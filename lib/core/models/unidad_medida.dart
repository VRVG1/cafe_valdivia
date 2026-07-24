import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
part 'unidad_medida.freezed.dart';
part 'unidad_medida.g.dart';

@freezed
abstract class UnidadMedida with _$UnidadMedida {
  const factory UnidadMedida({
    @JsonKey(name: 'id_unidad') int? idUnidadMedida,
    required String nombre,
    @IntToBoolConverter() @Default(true) bool activo,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UnidadMedida;

  factory UnidadMedida.fromJson(Map<String, dynamic> json) =>
      _$UnidadMedidaFromJson(json);
}
