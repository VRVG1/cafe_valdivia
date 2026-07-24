import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
part 'cliente.freezed.dart';
part 'cliente.g.dart';

@freezed
abstract class Cliente with _$Cliente {
  const factory Cliente({
    @JsonKey(name: 'id_cliente') int? idCliente,
    required String nombre,
    required String apellido,
    String? telefono,
    String? email,
    @IntToBoolConverter() @Default(true) bool activo,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Cliente;

  factory Cliente.fromJson(Map<String, dynamic> json) =>
      _$ClienteFromJson(json);
}
