// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Proveedor _$ProveedorFromJson(Map<String, dynamic> json) => _Proveedor(
  id: (json['id_proveedor'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  telefono: json['telefono'] as String,
  email: json['email'] as String?,
  direccion: json['direccion'] as String?,
);

Map<String, dynamic> _$ProveedorToJson(_Proveedor instance) =>
    <String, dynamic>{
      'id_proveedor': instance.id,
      'nombre': instance.nombre,
      'telefono': instance.telefono,
      'email': instance.email,
      'direccion': instance.direccion,
    };
