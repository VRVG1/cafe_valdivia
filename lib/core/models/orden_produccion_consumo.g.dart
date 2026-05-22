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
);

Map<String, dynamic> _$OrdenProduccionConsumoToJson(
  _OrdenProduccionConsumo instance,
) => <String, dynamic>{
  'id_consumo': instance.idConsumo,
  'id_orden_produccion': instance.idOrdenProduccion,
  'id_articulo': instance.idArticulo,
  'cantidad_usada': instance.cantidadUsada,
  'costo_articulo_momento': instance.costoArticuloMomento,
};
