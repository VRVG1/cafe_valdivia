// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_compra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleCompra _$DetalleCompraFromJson(Map<String, dynamic> json) =>
    _DetalleCompra(
      id: (json['id_detalle_compra'] as num?)?.toInt(),
      idCompra: (json['id_compra'] as num).toInt(),
      idInsumo: (json['id_insumo'] as num).toInt(),
      cantidad: (json['cantidad'] as num).toInt(),
      precioUnitarioCompra: json['precio_unitario_compra'] as String,
    );

Map<String, dynamic> _$DetalleCompraToJson(_DetalleCompra instance) =>
    <String, dynamic>{
      'id_detalle_compra': instance.id,
      'id_compra': instance.idCompra,
      'id_insumo': instance.idInsumo,
      'cantidad': instance.cantidad,
      'precio_unitario_compra': instance.precioUnitarioCompra,
    };
