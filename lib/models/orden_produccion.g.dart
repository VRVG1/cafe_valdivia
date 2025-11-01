// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orden_produccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdenProduccion _$OrdenProduccionFromJson(Map<String, dynamic> json) =>
    _OrdenProduccion(
      id: (json['id'] as num?)?.toInt(),
      idProducto: (json['idProducto'] as num).toInt(),
      cantidadProducida: (json['cantidadProducida'] as num).toInt(),
      fecha: DateTime.parse(json['fecha'] as String),
      costoTotalProduccion: json['costoTotalProduccion'] as String,
      notas: json['notas'] as String?,
    );

Map<String, dynamic> _$OrdenProduccionToJson(_OrdenProduccion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idProducto': instance.idProducto,
      'cantidadProducida': instance.cantidadProducida,
      'fecha': instance.fecha.toIso8601String(),
      'costoTotalProduccion': instance.costoTotalProduccion,
      'notas': instance.notas,
    };
