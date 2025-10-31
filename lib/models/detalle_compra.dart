import 'package:freezed_annotation/freezed_annotation.dart';
part 'detalle_compra.freezed.dart';
part 'detalle_compra.g.dart';

@freezed
abstract class DetalleCompra with _$DetalleCompra {
  const factory DetalleCompra({
    @JsonKey(name: 'id_detalle_compra') int? id,
    required String nombre,
    String? apellido,
    String? telefono,
    String? email,
  }) = _DetalleCompra;

  factory DetalleCompra.fromJson(Map<String, dynamic> json) =>
      _$DetalleCompraFromJson(json);
}
