import 'package:freezed_annotation/freezed_annotation.dart';
part 'compra.freezed.dart';
part 'compra.g.dart';

@freezed
abstract class Compra with _$Compra {
  const factory Compra({
    @JsonKey(name: 'id_compra') int? id,
    required int id_proveedor,
    required DateTime fecha,
    String? detalles,
    bool? pagado,
  }) = _Compra;

  factory Compra.fromJson(Map<String, dynamic> json) => _$CompraFromJson(json);
}
