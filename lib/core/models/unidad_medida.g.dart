// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidad_medida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnidadMedida _$UnidadMedidaFromJson(Map<String, dynamic> json) =>
    _UnidadMedida(
      idUnidadMedida: (json['id_unidad'] as num?)?.toInt(),
      nombre: json['nombre'] as String,
      activo: json['activo'] == null
          ? true
          : const IntToBoolConverter().fromJson(
              (json['activo'] as num).toInt(),
            ),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UnidadMedidaToJson(_UnidadMedida instance) =>
    <String, dynamic>{
      'id_unidad': instance.idUnidadMedida,
      'nombre': instance.nombre,
      'activo': const IntToBoolConverter().toJson(instance.activo),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
