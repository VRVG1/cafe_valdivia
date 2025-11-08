import 'package:freezed_annotation/freezed_annotation.dart';
part 'insumo.freezed.dart';
part 'insumo.g.dart';

@freezed
abstract class Insumo with _$Insumo {
  const factory Insumo({
    @JsonKey(name: 'id_insumo') int? id,
    required String nombre,
    String? descripcion,
    @JsonKey(name: 'id_unidad') required int idUnidad,
    @JsonKey(name: 'costo_unitario') required String costoUnitario,
  }) = _Insumo;

  factory Insumo.fromJson(Map<String, dynamic> json) => _$InsumoFromJson(json);
}
