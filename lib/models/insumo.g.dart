// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Insumo _$InsumoFromJson(Map<String, dynamic> json) => _Insumo(
  id: (json['id'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String?,
  idUnidad: (json['id_unidad'] as num).toInt(),
  costoUnitario: json['consto_unitario'] as String,
);

Map<String, dynamic> _$InsumoToJson(_Insumo instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'id_unidad': instance.idUnidad,
  'consto_unitario': instance.costoUnitario,
};
