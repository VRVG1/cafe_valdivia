// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimiento_inventario_producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovimientoInventarioProducto _$MovimientoInventarioProductoFromJson(
  Map<String, dynamic> json,
) => _MovimientoInventarioProducto(
  id: (json['id_movimiento_inventario_producto'] as num?)?.toInt(),
  idProducto: (json['idProducto'] as num).toInt(),
  tipo: json['tipo'] as String?,
  cantidad: (json['cantidad'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  idDetalleVenta: (json['idDetalleVenta'] as num).toInt(),
  idDetalleProduccion: (json['idDetalleProduccion'] as num).toInt(),
  motivo: json['motivo'] as String?,
);

Map<String, dynamic> _$MovimientoInventarioProductoToJson(
  _MovimientoInventarioProducto instance,
) => <String, dynamic>{
  'id_movimiento_inventario_producto': instance.id,
  'idProducto': instance.idProducto,
  'tipo': instance.tipo,
  'cantidad': instance.cantidad,
  'fecha': instance.fecha.toIso8601String(),
  'idDetalleVenta': instance.idDetalleVenta,
  'idDetalleProduccion': instance.idDetalleProduccion,
  'motivo': instance.motivo,
};
