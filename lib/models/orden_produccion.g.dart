// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orden_produccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdenProduccion _$OrdenProduccionFromJson(Map<String, dynamic> json) =>
    _OrdenProduccion(
      id: (json['id_orden_produccion'] as num?)?.toInt(),
      idProducto: (json['idProducto'] as num).toInt(),
      cantidad_producida: (json['cantidad_producida'] as num).toInt(),
      fecha: DateTime.parse(json['fecha'] as String),
      costo_total_produccion: json['costo_total_produccion'] as String,
      notas: json['notas'] as String?,
    );

Map<String, dynamic> _$OrdenProduccionToJson(_OrdenProduccion instance) =>
    <String, dynamic>{
      'id_orden_produccion': instance.id,
      'idProducto': instance.idProducto,
      'cantidad_producida': instance.cantidad_producida,
      'fecha': instance.fecha.toIso8601String(),
      'costo_total_produccion': instance.costo_total_produccion,
      'notas': instance.notas,
    };
