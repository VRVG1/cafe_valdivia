// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orden_produccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdenProduccion _$OrdenProduccionFromJson(Map<String, dynamic> json) =>
    _OrdenProduccion(
      idOrdenProduccion: (json['id_orden_produccion'] as num?)?.toInt(),
      idProducto: (json['id_producto'] as num).toInt(),
      cantidadProducida: json['cantidad_producida'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      costoTotalProduccion: json['costo_total_produccion'] as String,
      notas: json['notas'] as String?,
    );

Map<String, dynamic> _$OrdenProduccionToJson(_OrdenProduccion instance) =>
    <String, dynamic>{
      'id_orden_produccion': instance.idOrdenProduccion,
      'id_producto': instance.idProducto,
      'cantidad_producida': instance.cantidadProducida,
      'fecha': instance.fecha.toIso8601String(),
      'costo_total_produccion': instance.costoTotalProduccion,
      'notas': instance.notas,
    };
