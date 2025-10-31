// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Venta _$VentaFromJson(Map<String, dynamic> json) => _Venta(
  id: (json['id_venta'] as num?)?.toInt(),
  idCliente: (json['idCliente'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  detalles: json['detalles'] as String?,
  pagado: json['pagado'] as bool?,
  estado: json['estado'] as String?,
);

Map<String, dynamic> _$VentaToJson(_Venta instance) => <String, dynamic>{
  'id_venta': instance.id,
  'idCliente': instance.idCliente,
  'fecha': instance.fecha.toIso8601String(),
  'detalles': instance.detalles,
  'pagado': instance.pagado,
  'estado': instance.estado,
};
