// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_produccion_insumo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleProduccionInsumo _$DetalleProduccionInsumoFromJson(
  Map<String, dynamic> json,
) => _DetalleProduccionInsumo(
  id: (json['id_detalle_produccion_insumo'] as num?)?.toInt(),
  idOrdenProduccion: (json['idOrdenProduccion'] as num).toInt(),
  idInsumo: (json['idInsumo'] as num).toInt(),
  costoInsumoMomento: json['costoInsumoMomento'] as String,
);

Map<String, dynamic> _$DetalleProduccionInsumoToJson(
  _DetalleProduccionInsumo instance,
) => <String, dynamic>{
  'id_detalle_produccion_insumo': instance.id,
  'idOrdenProduccion': instance.idOrdenProduccion,
  'idInsumo': instance.idInsumo,
  'costoInsumoMomento': instance.costoInsumoMomento,
};
