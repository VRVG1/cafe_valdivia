import 'package:freezed_annotation/freezed_annotation.dart';
part 'insumo.freezed.dart';
part 'insumo.g.dart';

@freezed
abstract class Insumo with _$Insumo {
  const factory Insumo({
    int? id,
    required String nombre,
    String? descripcion,
    required int idUnidad,
    required String costoUnitario,
  }) = _Insumo;

  factory Insumo.fromJson(Map<String, dynamic> json) => _$InsumoFromJson(json);
}
