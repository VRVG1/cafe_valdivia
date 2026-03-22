import 'package:freezed_annotation/freezed_annotation.dart';
part 'insumo_producto.freezed.dart';
part 'insumo_producto.g.dart';

@freezed
abstract class InsumoProducto with _$InsumoProducto {
  const factory InsumoProducto({
    @JsonKey(name: 'id_insumo_producto') int? idInsumoProducto,
    @JsonKey(name: 'id_insumo') required int idInsumo,
    @JsonKey(name: 'id_producto') required int idProducto,
    required String nombre,
    @JsonKey(name: 'cantidad_requerida') required double cantidadRequerida,
  }) = _InsumoProducto;

  factory InsumoProducto.fromJson(Map<String, dynamic> json) =>
      _$InsumoProductoFromJson(json);
}
