import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
part 'compra.freezed.dart';
part 'compra.g.dart';

@freezed
abstract class Compra with _$Compra {
  const factory Compra({
    @JsonKey(name: 'id_compra') int? idCompra,
    @JsonKey(name: 'id_proveedor') required int idProveedor,
    required DateTime fecha,
    String? detalles,
    @BoolToIntConverter() bool? pagado,
    @IntToBoolConverter() @Default(true) bool activo,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Compra;

  factory Compra.fromJson(Map<String, dynamic> json) => _$CompraFromJson(json);
}
