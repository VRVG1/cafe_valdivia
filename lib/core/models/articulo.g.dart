// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articulo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Articulo _$ArticuloFromJson(Map<String, dynamic> json) => _Articulo(
  idArticulo: (json['id_articulo'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String?,
  tipo: $enumDecode(_$ArticuloTipoEnumMap, json['tipo']),
  idUnidad: (json['id_unidad'] as num).toInt(),
  costoUnitario: (json['costo_unitario'] as num).toDouble(),
  precioVenta: (json['precio_venta'] as num).toDouble(),
  stock: (json['stock'] as num).toDouble(),
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

Map<String, dynamic> _$ArticuloToJson(_Articulo instance) => <String, dynamic>{
  'id_articulo': instance.idArticulo,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'tipo': _$ArticuloTipoEnumMap[instance.tipo]!,
  'id_unidad': instance.idUnidad,
  'costo_unitario': instance.costoUnitario,
  'precio_venta': instance.precioVenta,
  'stock': instance.stock,
  'activo': const IntToBoolConverter().toJson(instance.activo),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$ArticuloTipoEnumMap = {
  ArticuloTipo.insumo: 'INSUMO',
  ArticuloTipo.producto: 'PRODUCTO',
  ArticuloTipo.productoIntermedio: 'PRODUCTO_INTERMEDIO',
};
