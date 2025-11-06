// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Producto _$ProductoFromJson(Map<String, dynamic> json) => _Producto(
  idProducto: (json['id_producto'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String?,
  precioVenta: json['precio_venta'] as String,
);

Map<String, dynamic> _$ProductoToJson(_Producto instance) => <String, dynamic>{
  'id_producto': instance.idProducto,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'precio_venta': instance.precioVenta,
};
