// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Compra _$CompraFromJson(Map<String, dynamic> json) => _Compra(
  id: (json['id_compra'] as num?)?.toInt(),
  id_proveedor: (json['id_proveedor'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  detalles: json['detalles'] as String?,
  pagado: json['pagado'] as bool?,
);

Map<String, dynamic> _$CompraToJson(_Compra instance) => <String, dynamic>{
  'id_compra': instance.id,
  'id_proveedor': instance.id_proveedor,
  'fecha': instance.fecha.toIso8601String(),
  'detalles': instance.detalles,
  'pagado': instance.pagado,
};
