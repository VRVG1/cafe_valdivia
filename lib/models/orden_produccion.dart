import 'package:freezed_annotation/freezed_annotation.dart';
part 'orden_produccion.freezed.dart';
part 'orden_produccion.g.dart';

@freezed
abstract class OrdenProduccion with _$OrdenProduccion {
  const factory OrdenProduccion({
    int? id,
    required int idProducto,
    required int cantidadProducida,
    required DateTime fecha,
    required String costoTotalProduccion,
    String? notas,
  }) = _OrdenProduccion;

  factory OrdenProduccion.fromJson(Map<String, dynamic> json) =>
      _$OrdenProduccionFromJson(json);
}
