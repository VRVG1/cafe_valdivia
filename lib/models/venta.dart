import 'package:freezed_annotation/freezed_annotation.dart';
part 'venta.freezed.dart';
part 'venta.g.dart';

class BoolToIntConverter implements JsonConverter<bool?, int?> {
  const BoolToIntConverter();

  @override
  bool? fromJson(int? json) => json == null ? null : json == 1;

  @override
  int? toJson(bool? object) => object == null ? null : (object ? 1 : 0);
}

VentaEstado? ventaEstadoFromJson(String? estado) {
  if (estado == null) return null;
  return VentaEstado.fromValue(estado);
}

String? ventaEstadoToJson(VentaEstado? estado) {
  return estado?.value;
}

@freezed
abstract class Venta with _$Venta {
  const factory Venta({
    @JsonKey(name: 'id_venta') int? idVenta,
    @JsonKey(name: 'id_cliente') required int idCliente,
    required DateTime fecha,
    String? detalles,
    @BoolToIntConverter() bool? pagado,
    @JsonKey(fromJson: ventaEstadoFromJson, toJson: ventaEstadoToJson)
    @Default(VentaEstado.pendiente)
    VentaEstado? estado,
  }) = _Venta;

  factory Venta.fromJson(Map<String, dynamic> json) => _$VentaFromJson(json);
}

enum VentaEstado {
  pendiente('pendiente'),
  completa('completado'),
  cancelado('cancelado');

  final String value;
  const VentaEstado(this.value);

  factory VentaEstado.fromValue(String value) {
    return VentaEstado.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Estado de venta desconocido: $value'),
    );
  }
}
