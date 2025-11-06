// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_produccion_insumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleProduccionInsumo _$DetalleProduccionInsumoFromJson(
  Map<String, dynamic> json,
) => _DetalleProduccionInsumo(
  idProduccionInsumo: (json['id_detalle_produccion_insumo'] as num?)?.toInt(),
  idOrdenProduccion: (json['id_orden_produccion'] as num).toInt(),
  idInsumo: (json['id_insumo'] as num).toInt(),
  costoInsumoMomento: json['consto_insumo_momento'] as String,
);

Map<String, dynamic> _$DetalleProduccionInsumoToJson(
  _DetalleProduccionInsumo instance,
) => <String, dynamic>{
  'id_detalle_produccion_insumo': instance.idProduccionInsumo,
  'id_orden_produccion': instance.idOrdenProduccion,
  'id_insumo': instance.idInsumo,
  'consto_insumo_momento': instance.costoInsumoMomento,
};
