// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Receta _$RecetaFromJson(Map<String, dynamic> json) => _Receta(
  idReceta: (json['id_receta'] as num?)?.toInt(),
  idArticuloProducto: (json['id_articulo_producto'] as num).toInt(),
  nombre: json['nombre'] as String,
  cantidad_base: (json['cantidad_base'] as num).toDouble(),
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

Map<String, dynamic> _$RecetaToJson(_Receta instance) => <String, dynamic>{
  'id_receta': instance.idReceta,
  'id_articulo_producto': instance.idArticuloProducto,
  'nombre': instance.nombre,
  'cantidad_base': instance.cantidad_base,
  'activo': const IntToBoolConverter().toJson(instance.activo),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
