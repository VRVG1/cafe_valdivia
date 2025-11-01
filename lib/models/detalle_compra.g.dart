// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_compra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetalleCompra _$DetalleCompraFromJson(Map<String, dynamic> json) =>
    _DetalleCompra(
      id: (json['id'] as num?)?.toInt(),
      idCompra: (json['idCompra'] as num).toInt(),
      idInsumo: (json['idInsumo'] as num).toInt(),
      cantidad: (json['cantidad'] as num).toInt(),
      precioUnitarioCompra: json['precioUnitarioCompra'] as String,
    );

Map<String, dynamic> _$DetalleCompraToJson(_DetalleCompra instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCompra': instance.idCompra,
      'idInsumo': instance.idInsumo,
      'cantidad': instance.cantidad,
      'precioUnitarioCompra': instance.precioUnitarioCompra,
    };
