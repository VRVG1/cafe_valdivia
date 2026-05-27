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
};

const _$ArticuloTipoEnumMap = {
  ArticuloTipo.insumo: 'INSUMO',
  ArticuloTipo.producto: 'PRODUCTO',
  ArticuloTipo.productoIntermedio: 'PRODUCTO_INTERMEDIO',
  ArticuloTipo.insumoProducto: 'INSUMO_PRODUCTO',
};
