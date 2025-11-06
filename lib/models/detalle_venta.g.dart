// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_venta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleVenta _$DetalleVentaFromJson(Map<String, dynamic> json) =>
    _DetalleVenta(
      idDetalleVenta: (json['id_detalle_venta'] as num?)?.toInt(),
      idVenta: (json['id_venta'] as num).toInt(),
      idProducto: (json['id_producto'] as num).toInt(),
      cantidad: (json['cantidad'] as num).toInt(),
      precioUnitarioVenta: json['precio_unitario_venta'] as String,
    );

Map<String, dynamic> _$DetalleVentaToJson(_DetalleVenta instance) =>
    <String, dynamic>{
      'id_detalle_venta': instance.idDetalleVenta,
      'id_venta': instance.idVenta,
      'id_producto': instance.idProducto,
      'cantidad': instance.cantidad,
      'precio_unitario_venta': instance.precioUnitarioVenta,
    };
