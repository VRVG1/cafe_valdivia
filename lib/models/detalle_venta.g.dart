// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_venta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleVenta _$DetalleVentaFromJson(Map<String, dynamic> json) =>
    _DetalleVenta(
      id: (json['id'] as num?)?.toInt(),
      idVenta: (json['idVenta'] as num).toInt(),
      idProducto: (json['idProducto'] as num).toInt(),
      cantidad: (json['cantidad'] as num).toInt(),
      precioUnitarioVenta: json['precioUnitarioVenta'] as String,
    );

Map<String, dynamic> _$DetalleVentaToJson(_DetalleVenta instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idVenta': instance.idVenta,
      'idProducto': instance.idProducto,
      'cantidad': instance.cantidad,
      'precioUnitarioVenta': instance.precioUnitarioVenta,
    };
