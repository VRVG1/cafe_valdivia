// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orden_produccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdenProduccion _$OrdenProduccionFromJson(Map<String, dynamic> json) =>
    _OrdenProduccion(
      idOrdenProduccion: (json['id_orden_produccion'] as num?)?.toInt(),
      idReceta: (json['id_receta'] as num).toInt(),
      cantidadProducida: (json['cantidad_producida'] as num).toDouble(),
      fecha: DateTime.parse(json['fecha'] as String),
      costoTotalProduccion: (json['costo_total_produccion'] as num).toDouble(),
      notas: json['notas'] as String?,
      activo: json['activo'] == null
          ? true
          : const IntToBoolConverter().fromJson(
              (json['activo'] as num).toInt(),
            ),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrdenProduccionToJson(_OrdenProduccion instance) =>
    <String, dynamic>{
      'id_orden_produccion': instance.idOrdenProduccion,
      'id_receta': instance.idReceta,
      'cantidad_producida': instance.cantidadProducida,
      'fecha': instance.fecha.toIso8601String(),
      'costo_total_produccion': instance.costoTotalProduccion,
      'notas': instance.notas,
      'activo': const IntToBoolConverter().toJson(instance.activo),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
