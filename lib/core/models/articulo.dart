import 'package:freezed_annotation/freezed_annotation.dart';
part 'articulo.freezed.dart';
part 'articulo.g.dart';

@freezed
abstract class Articulo with _$Articulo {
  const factory Articulo({
    @JsonKey(name: 'id_articulo') int? idArticulo,
    required String nombre,
    String? descripcion,
    required ArticuloTipo tipo,
    @JsonKey(name: 'id_unidad') required int idUnidad,
    @JsonKey(name: 'costo_unitario') required double costoUnitario,
    @JsonKey(name: 'precio_venta') required double precioVenta,
    required double stock,
  }) = _Articulo;

  factory Articulo.fromJson(Map<String, dynamic> json) =>
      _$ArticuloFromJson(json);
}

@JsonEnum()
enum ArticuloTipo {
  @JsonValue('INSUMO')
  insumo('INSUMO'),
  @JsonValue('PRODUCTO')
  producto('PRODUCTO'),
  @JsonValue('PRODUCTO_INTERMEDIO')
  productoIntermedio('PRODUCTO_INTERMEDIO'),
  @JsonValue('INSUMO_PRODUCTO')
  insumoProducto('INSUMO_PRODUCTO');

  final String value;
  const ArticuloTipo(this.value);

  factory ArticuloTipo.fromValue(String value) {
    return ArticuloTipo.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Tipo de artículo desconocido: $value'),
    );
  }
}
