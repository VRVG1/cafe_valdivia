import 'package:freezed_annotation/freezed_annotation.dart';
part 'detalle_produccion_insumo.freezed.dart';
part 'detalle_produccion_insumo.g.dart';

@freezed
abstract class DetalleProduccionInsumo with _$DetalleProduccionInsumo {
  const factory DetalleProduccionInsumo({
    @JsonKey(name: 'id_detalle_produccion_insumo') int? id,
    required int idOrdenProduccion,
    required int idInsumo,
    required String costoInsumoMomento,
  }) = _DetalleProduccionInsumo;

  factory DetalleProduccionInsumo.fromJson(Map<String, dynamic> json) =>
      _$DetalleProduccionInsumoFromJson(json);
}
