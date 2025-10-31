// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cliente _$ClienteFromJson(Map<String, dynamic> json) => _Cliente(
  id: (json['id_cliente'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  apellido: json['apellido'] as String?,
  telefono: json['telefono'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$ClienteToJson(_Cliente instance) => <String, dynamic>{
  'id_cliente': instance.id,
  'nombre': instance.nombre,
  'apellido': instance.apellido,
  'telefono': instance.telefono,
  'email': instance.email,
};
