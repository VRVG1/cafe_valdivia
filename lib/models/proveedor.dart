import 'package:freezed_annotation/freezed_annotation.dart';
part 'proveedor.freezed.dart';
part 'proveedor.g.dart';

@freezed
abstract class Proveedor with _$Proveedor {
  const factory Proveedor({
    int? id,
    required String nombre,
    required String telefono,
    String? email,
    String? direccion,
  }) = _Proveedor;

  factory Proveedor.fromJson(Map<String, dynamic> json) =>
      _$ProveedorFromJson(json);
}
