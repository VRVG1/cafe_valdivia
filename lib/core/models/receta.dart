import 'package:freezed_annotation/freezed_annotation.dart';
part 'receta.freezed.dart';
part 'receta.g.dart';

@freezed
abstract class Receta with _$Receta {
  const factory Receta({
    @JsonKey(name: 'id_receta') int? idReceta,
    @JsonKey(name: 'id_articulo_producto') required int idArticuloProducto,
    required String nombre,
    required double cantidad_base,
  }) = _Receta;

  factory Receta.fromJson(Map<String, dynamic> json) => _$RecetaFromJson(json);
}
