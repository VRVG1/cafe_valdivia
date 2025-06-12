import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumos.dart';

enum TipoMovimiento { entrada, salida, erorr }

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
      'idInsumo': idInsumo,
      'tipo': tipo.name,
      'cantidad': cantidad,
      'fecha': fecha.toIso8601String(),
      'motivo': motivo,
      'idDetalleCompra': idDetalleCompra,
      'idDetalleVenta': idDetalleVenta,
    };
  }

  factory MovimientoInvetario.fromMap(Map<String, dynamic> map) {
    return MovimientoInvetario(
      id: map['id_movimiento_invetario'],
      idInsumo: map['idInsumo'],
      tipo: TipoMovimiento.values.firstWhere(
        (e) => e.name == map['tipo'],
        orElse: () => TipoMovimiento.erorr,
      ),
      cantidad: map['cantidad']?.toDouble() ?? 0.0,
      fecha: DateTime.parse(map['fecha']),
      motivo: map['motivo'],
      idDetalleCompra: map['idDetalleCompra'],
      idDetalleVenta: map['idDetalleVenta'],
    );
  }
}
