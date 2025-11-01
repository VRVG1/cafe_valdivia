import 'package:freezed_annotation/freezed_annotation.dart';
part 'insumo_producto.freezed.dart';
part 'insumo_producto.g.dart';

@freezed
abstract class InsumoProducto with _$InsumoProducto {
  const factory InsumoProducto({
    int? id,
    required int idInsumo,
    required int idProducto,
    required String nombre,
    required double cantidadRequerida,
  }) = _InsumoProducto;

  factory InsumoProducto.fromJson(Map<String, dynamic> json) =>
      _$InsumoProductoFromJson(json);
}
