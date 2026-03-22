// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsumoProducto _$InsumoProductoFromJson(Map<String, dynamic> json) =>
    _InsumoProducto(
      idInsumoProducto: (json['id_insumo_producto'] as num?)?.toInt(),
      idInsumo: (json['id_insumo'] as num).toInt(),
      idProducto: (json['id_producto'] as num).toInt(),
      nombre: json['nombre'] as String,
      cantidadRequerida: (json['cantidad_requerida'] as num).toDouble(),
    );

Map<String, dynamic> _$InsumoProductoToJson(_InsumoProducto instance) =>
    <String, dynamic>{
      'id_insumo_producto': instance.idInsumoProducto,
      'id_insumo': instance.idInsumo,
      'id_producto': instance.idProducto,
      'nombre': instance.nombre,
      'cantidad_requerida': instance.cantidadRequerida,
    };
