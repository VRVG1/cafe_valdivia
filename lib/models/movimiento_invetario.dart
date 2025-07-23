import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumos.dart';

enum TipoMovimiento {
  entrada,
  salida,
  ajusteEntrada,
  ajusteSalida,
  invalid;

  static TipoMovimiento fromDbValue(String value) {
    return tipoMovimientoFromDb(value);
  }
}

extension TipoMovimientoExtension on TipoMovimiento {
  String get dbValue {
    switch (this) {
      case TipoMovimiento.entrada:
        return 'Entrada';
      case TipoMovimiento.salida:
        return 'Salida';
      case TipoMovimiento.ajusteEntrada:
        return 'Ajuste Entrada';
      case TipoMovimiento.ajusteSalida:
        return 'Ajuste Salida';
      case TipoMovimiento.invalid:
        return 'invalid';
    }
  }
}

TipoMovimiento tipoMovimientoFromDb(String value) {
  switch (value) {
    case 'Entrada':
      return TipoMovimiento.entrada;
    case 'Salida':
      return TipoMovimiento.salida;
    case 'Ajuste Entrada':
      return TipoMovimiento.ajusteEntrada;
    case 'Ajuste Salida':
      return TipoMovimiento.ajusteSalida;
    default:
      throw TipoMovimiento.invalid;
  }
}

class MovimientoInvetario implements BaseModel {
  @override
  int? id;
  final int idInsumo;
  final TipoMovimiento tipo;
  final double cantidad;
  final DateTime fecha;
  final String? motivo;
  final int? idDetalleCompra;
  final int? idDetalleVenta;
  Insumos? insumo;

  MovimientoInvetario({
    this.id,
    required this.idInsumo,
    required this.tipo,
    required this.cantidad,
    required this.fecha,
    this.motivo,
    this.idDetalleCompra,
    this.idDetalleVenta,
    this.insumo,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_movimiento_invetario': id,
      'id_insumo': idInsumo,
      'tipo': tipo.dbValue,
      'cantidad': cantidad,
      'fecha': fecha.toIso8601String(),
      'motivo': motivo,
      'id_detalle_compra': idDetalleCompra,
      'id_detalle_venta': idDetalleVenta,
    };
  }

  factory MovimientoInvetario.fromMap(Map<String, dynamic> map) {
    return MovimientoInvetario(
      id: map['id_movimiento_invetario'],
      idInsumo: map['id_insumo'],
      // tipo: TipoMovimiento.values.firstWhere(
      //   (e) => e.name == map['tipo'],
      //   orElse: () => TipoMovimiento.ajusteSalida,
      // ),
      //tipo: TipoMovimiento.values.firstWhere(
      //  (e) => e == map['tipo'],
      //  orElse: () => TipoMovimiento.invalid,
      //),
      tipo: tipoMovimientoFromDb(map['tipo']),
      cantidad: map['cantidad']?.toDouble() ?? 0.0,
      fecha: DateTime.parse(map['fecha']),
      motivo: map['motivo'],
      idDetalleCompra: map['id_detalle_compra'],
      idDetalleVenta: map['id_detalle_venta'],
    );
  }
}
