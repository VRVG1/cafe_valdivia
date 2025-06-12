class MovimientoInsumo {
  final int? idMovimiento;
  final int idInsumo;
  final String tipo; // "Entrada" o "Salida"
  final double cantidad;
  final DateTime fecha;
  final int? idCompra;
  final int? idVenta;

  MovimientoInsumo({
    this.idMovimiento,
    required this.idInsumo,
    required this.tipo,
    required this.cantidad,
    required this.fecha,
    this.idCompra,
    this.idVenta,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_movimiento': idMovimiento,
      'id_insumo': idInsumo,
      'tipo': tipo,
      'cantidad': cantidad,
      'fecha': fecha.toIso8601String(),
      'id_compra': idCompra,
      'id_venta': idVenta,
    };
  }

  factory MovimientoInsumo.fromMap(Map<String, dynamic> map) {
    return MovimientoInsumo(
      idMovimiento: map['id_movimiento'],
      idInsumo: map['id_insumo'],
      tipo: map['tipo'],
      cantidad: map['cantidad']?.toDouble() ?? 0.0,
      fecha: DateTime.parse(map['fecha']),
      idCompra: map['id_compra'],
      idVenta: map['id_venta'],
    );
  }
}
