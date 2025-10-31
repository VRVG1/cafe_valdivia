import 'package:freezed_annotation/freezed_annotation.dart';
part 'venta.freezed.dart';
part 'venta.g.dart';

@freezed
abstract class Venta with _$Venta {
  const factory Venta({
    @JsonKey(name: 'id_venta') int? id,
    required int idCliente,
    required DateTime fecha,
    String? detalles,
    bool? pagado,
    String? estado,
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
