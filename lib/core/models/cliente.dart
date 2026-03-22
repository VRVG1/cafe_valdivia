import 'package:freezed_annotation/freezed_annotation.dart';
part 'cliente.freezed.dart';
part 'cliente.g.dart';

@freezed
abstract class Cliente with _$Cliente {
  const factory Cliente({
    @JsonKey(name: 'id_cliente') int? idCliente,
    required String nombre,
    String? apellido,
    String? telefono,
    String? email,
  }) = _Cliente;

  factory Cliente.fromJson(Map<String, dynamic> json) =>
      _$ClienteFromJson(json);
}
