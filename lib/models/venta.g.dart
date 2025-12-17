// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Venta _$VentaFromJson(Map<String, dynamic> json) => _Venta(
  idVenta: (json['id_venta'] as num?)?.toInt(),
  idCliente: (json['id_cliente'] as num).toInt(),
  fecha: DateTime.parse(json['fecha'] as String),
  detalles: json['detalles'] as String?,
  pagado: const BoolToIntConverter().fromJson(
    (json['pagado'] as num?)?.toInt(),
  ),
  estado: json['estado'] == null
      ? VentaEstado.pendiente
      : ventaEstadoFromJson(json['estado'] as String?),
);

Map<String, dynamic> _$VentaToJson(_Venta instance) => <String, dynamic>{
  'id_venta': instance.idVenta,
  'id_cliente': instance.idCliente,
  'fecha': instance.fecha.toIso8601String(),
  'detalles': instance.detalles,
  'pagado': const BoolToIntConverter().toJson(instance.pagado),
  'estado': ventaEstadoToJson(instance.estado),
};
