// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta_detalle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecetaDetalle _$RecetaDetalleFromJson(Map<String, dynamic> json) =>
    _RecetaDetalle(
      idRecetaDetalle: (json['id_receta_detalle'] as num?)?.toInt(),
      idReceta: (json['id_receta'] as num).toInt(),
      idArticulo: (json['id_articulo_componente'] as num).toInt(),
      cantidad: (json['cantidad'] as num).toDouble(),
      idUnidad: (json['id_unidad'] as num).toInt(),
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

Map<String, dynamic> _$RecetaDetalleToJson(_RecetaDetalle instance) =>
    <String, dynamic>{
      'id_receta_detalle': instance.idRecetaDetalle,
      'id_receta': instance.idReceta,
      'id_articulo_componente': instance.idArticulo,
      'cantidad': instance.cantidad,
      'id_unidad': instance.idUnidad,
      'activo': const IntToBoolConverter().toJson(instance.activo),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
