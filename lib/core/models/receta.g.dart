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
);

Map<String, dynamic> _$RecetaToJson(_Receta instance) => <String, dynamic>{
  'id_receta': instance.idReceta,
  'id_articulo_producto': instance.idArticuloProducto,
  'nombre': instance.nombre,
  'cantidad_base': instance.cantidad_base,
};
