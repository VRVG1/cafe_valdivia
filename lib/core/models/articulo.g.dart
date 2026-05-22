// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articulo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Articulo _$ArticuloFromJson(Map<String, dynamic> json) => _Articulo(
  idArticulo: (json['id_articulo'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String?,
  tipo: json['tipo'] as String?,
  idUnidad: (json['id_unidad'] as num).toInt(),
  costoUnitario: json['costo_unitario'] as String,
  precioVenta: json['precio_venta'] as String,
  stock: (json['stock'] as num).toDouble(),
);

Map<String, dynamic> _$ArticuloToJson(_Articulo instance) => <String, dynamic>{
  'id_articulo': instance.idArticulo,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'tipo': instance.tipo,
  'id_unidad': instance.idUnidad,
  'costo_unitario': instance.costoUnitario,
  'precio_venta': instance.precioVenta,
  'stock': instance.stock,
};
