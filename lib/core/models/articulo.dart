import 'package:freezed_annotation/freezed_annotation.dart';
part 'articulo.freezed.dart';
part 'articulo.g.dart';

@freezed
abstract class Articulo with _$Articulo {
  const factory Articulo({
    @JsonKey(name: 'id_articulo') int? idArticulo,
    required String nombre,
    String? descripcion,
    required String? tipo,
    @JsonKey(name: 'id_unidad') required int idUnidad,
    @JsonKey(name: 'costo_unitario') required String costoUnitario,
    @JsonKey(name: 'precio_venta') required String precioVenta,
    required double stock,
  }) = _Articulo;

  factory Articulo.fromJson(Map<String, dynamic> json) =>
      _$ArticuloFromJson(json);
}
