import 'package:freezed_annotation/freezed_annotation.dart';
part 'unidad_medida.freezed.dart';
part 'unidad_medida.g.dart';

@freezed
abstract class UnidadMedida with _$UnidadMedida {
  const factory UnidadMedida({
    @JsonKey(name: 'id_unidad') int? id,
    required String nombre,
  }) = _UnidadMedida;

  factory UnidadMedida.fromJson(Map<String, dynamic> json) =>
      _$UnidadMedidaFromJson(json);
}
