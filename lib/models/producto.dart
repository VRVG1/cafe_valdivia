import 'package:freezed_annotation/freezed_annotation.dart';
part 'producto.freezed.dart';
part 'producto.g.dart';

@freezed
abstract class Producto with _$Producto {
  const factory Producto({
    int? id,
    required String nombre,
    String? descripcion,
    required String precioVenta,
  }) = _Producto;

  factory Producto.fromJson(Map<String, dynamic> json) =>
      _$ProductoFromJson(json);
}
