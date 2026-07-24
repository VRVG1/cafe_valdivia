// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_compra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleCompra _$DetalleCompraFromJson(Map<String, dynamic> json) =>
    _DetalleCompra(
      id: (json['id_detalle_compra'] as num?)?.toInt(),
      idCompra: (json['id_compra'] as num).toInt(),
      idArticulo: (json['id_articulo'] as num).toInt(),
      cantidad: (json['cantidad'] as num).toDouble(),
      precioUnitarioCompra: (json['precio_unitario_compra'] as num).toDouble(),
      activo: json['activo'] as bool? ?? true,
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DetalleCompraToJson(_DetalleCompra instance) =>
    <String, dynamic>{
      'id_detalle_compra': instance.id,
      'id_compra': instance.idCompra,
      'id_articulo': instance.idArticulo,
      'cantidad': instance.cantidad,
      'precio_unitario_compra': instance.precioUnitarioCompra,
      'activo': instance.activo,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
