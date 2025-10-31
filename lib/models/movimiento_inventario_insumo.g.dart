// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimiento_inventario_insumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovimientoInventarioInsumo _$MovimientoInventarioInsumoFromJson(
  Map<String, dynamic> json,
) => _MovimientoInventarioInsumo(
  id: (json['id_movimiento_inventario_insumo'] as num?)?.toInt(),
  idInsumo: (json['idInsumo'] as num).toInt(),
  tipo: json['tipo'] as String?,
  cantidad: (json['cantidad'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  idDetalleCompra: (json['idDetalleCompra'] as num).toInt(),
  idDetalleProduccion: (json['idDetalleProduccion'] as num).toInt(),
  motivo: json['motivo'] as String?,
);

Map<String, dynamic> _$MovimientoInventarioInsumoToJson(
  _MovimientoInventarioInsumo instance,
) => <String, dynamic>{
  'id_movimiento_inventario_insumo': instance.id,
  'idInsumo': instance.idInsumo,
  'tipo': instance.tipo,
  'cantidad': instance.cantidad,
  'fecha': instance.fecha.toIso8601String(),
  'idDetalleCompra': instance.idDetalleCompra,
  'idDetalleProduccion': instance.idDetalleProduccion,
  'motivo': instance.motivo,
};
