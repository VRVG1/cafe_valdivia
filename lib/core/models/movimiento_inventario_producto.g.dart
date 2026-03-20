// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimiento_inventario_producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovimientoInventarioProducto _$MovimientoInventarioProductoFromJson(
  Map<String, dynamic> json,
) => _MovimientoInventarioProducto(
  idMovimientoInventarioProducto:
      (json['id_movimiento_inventario_producto'] as num?)?.toInt(),
  idProducto: (json['id_producto'] as num).toInt(),
  cantidad: (json['cantidad'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  idDetalleVenta: (json['id_detalle_venta'] as num).toInt(),
  idDetalleProduccion: (json['id_detalle_produccion'] as num).toInt(),
  tipo: tipoMovimientoFromJson(json['tipo'] as String?),
  motivo: json['motivo'] as String?,
);

Map<String, dynamic> _$MovimientoInventarioProductoToJson(
  _MovimientoInventarioProducto instance,
) => <String, dynamic>{
  'id_movimiento_inventario_producto': instance.idMovimientoInventarioProducto,
  'id_producto': instance.idProducto,
  'cantidad': instance.cantidad,
  'fecha': instance.fecha.toIso8601String(),
  'id_detalle_venta': instance.idDetalleVenta,
  'id_detalle_produccion': instance.idDetalleProduccion,
  'tipo': tipoMovimientoToJson(instance.tipo),
  'motivo': instance.motivo,
};
