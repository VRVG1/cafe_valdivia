import 'package:freezed_annotation/freezed_annotation.dart';
part 'detalle_compra.freezed.dart';
part 'detalle_compra.g.dart';

@freezed
abstract class DetalleCompra with _$DetalleCompra {
  const factory DetalleCompra({
    int? id,
    required int idCompra,
    required int idInsumo,
    required int cantidad,
    required String precioUnitarioCompra,
  }) = _DetalleCompra;

  factory DetalleCompra.fromJson(Map<String, dynamic> json) =>
      _$DetalleCompraFromJson(json);
}
