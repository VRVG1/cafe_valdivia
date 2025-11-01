// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsumoProducto _$InsumoProductoFromJson(Map<String, dynamic> json) =>
    _InsumoProducto(
      id: (json['id'] as num?)?.toInt(),
      idInsumo: (json['idInsumo'] as num).toInt(),
      idProducto: (json['idProducto'] as num).toInt(),
      nombre: json['nombre'] as String,
      cantidadRequerida: (json['cantidadRequerida'] as num).toDouble(),
    );

Map<String, dynamic> _$InsumoProductoToJson(_InsumoProducto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idInsumo': instance.idInsumo,
      'idProducto': instance.idProducto,
      'nombre': instance.nombre,
      'cantidadRequerida': instance.cantidadRequerida,
    };
