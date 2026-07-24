// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orden_produccion_consumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdenProduccionConsumo _$OrdenProduccionConsumoFromJson(
  Map<String, dynamic> json,
) => _OrdenProduccionConsumo(
  idConsumo: (json['id_consumo'] as num?)?.toInt(),
  idOrdenProduccion: (json['id_orden_produccion'] as num).toInt(),
  idArticulo: (json['id_articulo'] as num).toInt(),
  cantidadUsada: (json['cantidad_usada'] as num).toDouble(),
  costoArticuloMomento: (json['costo_articulo_momento'] as num).toDouble(),
  activo: json['activo'] == null
      ? true
      : const IntToBoolConverter().fromJson((json['activo'] as num).toInt()),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$OrdenProduccionConsumoToJson(
  _OrdenProduccionConsumo instance,
) => <String, dynamic>{
  'id_consumo': instance.idConsumo,
  'id_orden_produccion': instance.idOrdenProduccion,
  'id_articulo': instance.idArticulo,
  'cantidad_usada': instance.cantidadUsada,
  'costo_articulo_momento': instance.costoArticuloMomento,
  'activo': const IntToBoolConverter().toJson(instance.activo),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
