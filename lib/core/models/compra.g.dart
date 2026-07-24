// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Compra _$CompraFromJson(Map<String, dynamic> json) => _Compra(
  idCompra: (json['id_compra'] as num?)?.toInt(),
  idProveedor: (json['id_proveedor'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  detalles: json['detalles'] as String?,
  pagado: const BoolToIntConverter().fromJson(
    (json['pagado'] as num?)?.toInt(),
  ),
  activo: json['activo'] == null
      ? true
      : const IntToBoolConverter().fromJson((json['activo'] as num).toInt()),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CompraToJson(_Compra instance) => <String, dynamic>{
  'id_compra': instance.idCompra,
  'id_proveedor': instance.idProveedor,
  'fecha': instance.fecha.toIso8601String(),
  'detalles': instance.detalles,
  'pagado': const BoolToIntConverter().toJson(instance.pagado),
  'activo': const IntToBoolConverter().toJson(instance.activo),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
