import 'package:freezed_annotation/freezed_annotation.dart';
part 'detalle_compra.freezed.dart';
part 'detalle_compra.g.dart';

@freezed
abstract class DetalleCompra with _$DetalleCompra {
  const factory DetalleCompra({
    @JsonKey(name: 'id_detalle_compra') int? id,
    @JsonKey(name: 'id_compra') required int idCompra,
    @JsonKey(name: 'id_insumo') required int idInsumo,
    required int cantidad,
    @JsonKey(name: 'precio_unitario_compra')
    required String precioUnitarioCompra,
  }) = _DetalleCompra;

  factory DetalleCompra.fromJson(Map<String, dynamic> json) =>
      _$DetalleCompraFromJson(json);
}
