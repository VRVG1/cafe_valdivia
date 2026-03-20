// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimiento_inventario_insumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovimientoInventarioInsumo _$MovimientoInventarioInsumoFromJson(
  Map<String, dynamic> json,
) => _MovimientoInventarioInsumo(
  idMovimientoInventarioInsumo:
      (json['id_movimiento_inventario_insumo'] as num?)?.toInt(),
  idInsumo: (json['id_insumo'] as num).toInt(),
  tipo: json['tipo'] as String?,
  cantidad: (json['cantidad'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  idDetalleCompra: (json['id_detalle_compra'] as num).toInt(),
  idDetalleProduccion: (json['id_detalle_produccion'] as num).toInt(),
  motivo: json['motivo'] as String?,
);

Map<String, dynamic> _$MovimientoInventarioInsumoToJson(
  _MovimientoInventarioInsumo instance,
) => <String, dynamic>{
  'id_movimiento_inventario_insumo': instance.idMovimientoInventarioInsumo,
  'id_insumo': instance.idInsumo,
  'tipo': instance.tipo,
  'cantidad': instance.cantidad,
  'fecha': instance.fecha.toIso8601String(),
  'id_detalle_compra': instance.idDetalleCompra,
  'id_detalle_produccion': instance.idDetalleProduccion,
  'motivo': instance.motivo,
};
