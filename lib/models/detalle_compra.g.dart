// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_compra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleCompra _$DetalleCompraFromJson(Map<String, dynamic> json) =>
    _DetalleCompra(
      id: (json['id_detalle_compra'] as num?)?.toInt(),
      nombre: json['nombre'] as String,
      apellido: json['apellido'] as String?,
      telefono: json['telefono'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$DetalleCompraToJson(_DetalleCompra instance) =>
    <String, dynamic>{
      'id_detalle_compra': instance.id,
      'nombre': instance.nombre,
      'apellido': instance.apellido,
      'telefono': instance.telefono,
      'email': instance.email,
    };
