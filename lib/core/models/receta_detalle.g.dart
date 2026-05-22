// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta_detalle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecetaDetalle _$RecetaDetalleFromJson(Map<String, dynamic> json) =>
    _RecetaDetalle(
      idRecetaDetalle: (json['id_receta_detalle'] as num?)?.toInt(),
      idReceta: (json['id_receta'] as num).toInt(),
      idArticulo: (json['id_articulo'] as num).toInt(),
      cantidad: (json['cantidad'] as num).toDouble(),
      idUnidad: (json['id_unidad'] as num).toInt(),
    );

Map<String, dynamic> _$RecetaDetalleToJson(_RecetaDetalle instance) =>
    <String, dynamic>{
      'id_receta_detalle': instance.idRecetaDetalle,
      'id_receta': instance.idReceta,
      'id_articulo': instance.idArticulo,
      'cantidad': instance.cantidad,
      'id_unidad': instance.idUnidad,
    };
