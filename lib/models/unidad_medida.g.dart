// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidad_medida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnidadMedida _$UnidadMedidaFromJson(Map<String, dynamic> json) =>
    _UnidadMedida(
      idUnidadMedida: (json['id_unidad_medida'] as num?)?.toInt(),
      nombre: json['nombre'] as String,
    );

Map<String, dynamic> _$UnidadMedidaToJson(_UnidadMedida instance) =>
    <String, dynamic>{
      'id_unidad_medida': instance.idUnidadMedida,
      'nombre': instance.nombre,
    };
