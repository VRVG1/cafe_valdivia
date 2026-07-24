// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Proveedor _$ProveedorFromJson(Map<String, dynamic> json) => _Proveedor(
  idProveedor: (json['id_proveedor'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  telefono: json['telefono'] as String?,
  email: json['email'] as String?,
  direccion: json['direccion'] as String?,
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

Map<String, dynamic> _$ProveedorToJson(_Proveedor instance) =>
    <String, dynamic>{
      'id_proveedor': instance.idProveedor,
      'nombre': instance.nombre,
      'telefono': instance.telefono,
      'email': instance.email,
      'direccion': instance.direccion,
      'activo': const IntToBoolConverter().toJson(instance.activo),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
