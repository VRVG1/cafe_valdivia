import 'package:freezed_annotation/freezed_annotation.dart';
part 'producto.freezed.dart';
part 'producto.g.dart';

@freezed
abstract class Producto with _$Producto {
  const factory Producto({
    @JsonKey(name: 'id_producto') int? idProducto,
    required String nombre,
    String? descripcion,
    @JsonKey(name: 'precio_venta') required String precioVenta,
  }) = _Producto;

  factory Producto.fromJson(Map<String, dynamic> json) =>
      _$ProductoFromJson(json);
}
