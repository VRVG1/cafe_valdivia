// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Insumo _$InsumoFromJson(Map<String, dynamic> json) => _Insumo(
  id: (json['id_insumo'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String?,
  idUnidad: (json['idUnidad'] as num).toInt(),
  costoUnitario: json['costoUnitario'] as String,
);

Map<String, dynamic> _$InsumoToJson(_Insumo instance) => <String, dynamic>{
  'id_insumo': instance.id,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'idUnidad': instance.idUnidad,
  'costoUnitario': instance.costoUnitario,
};
