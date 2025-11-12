// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_produccion_insumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleProduccionInsumo _$DetalleProduccionInsumoFromJson(
  Map<String, dynamic> json,
) => _DetalleProduccionInsumo(
  idDetalleProduccionInsumo: (json['id_detalle_produccion'] as num?)?.toInt(),
  idOrdenProduccion: (json['id_orden_produccion'] as num?)?.toInt(),
  idInsumo: (json['id_insumo'] as num).toInt(),
  cantidadUsada: (json['cantidad_usada'] as num).toDouble(),
  costoInsumoMomento: json['costo_insumo_momento'] as String,
);

Map<String, dynamic> _$DetalleProduccionInsumoToJson(
  _DetalleProduccionInsumo instance,
) => <String, dynamic>{
  'id_detalle_produccion': instance.idDetalleProduccionInsumo,
  'id_orden_produccion': instance.idOrdenProduccion,
  'id_insumo': instance.idInsumo,
  'cantidad_usada': instance.cantidadUsada,
  'costo_insumo_momento': instance.costoInsumoMomento,
};
