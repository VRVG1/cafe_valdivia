class MovimientoProducto {
  final int? idMovimientoProducto;
  final int idProducto;
  final String tipo; // Entrada o Salida
  final int cantidad;
  final DateTime fecha;
  final int? idCompra;

  MovimientoProducto({
    this.idMovimientoProducto,
    required this.idProducto,
    required this.tipo,
    required this.cantidad,
    required this.fecha,
    this.idCompra,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_movimiento_producto': idMovimientoProducto,
      'id_producto': idProducto,
      'tipo': tipo,
      'cantidad': cantidad,
      'fecha': fecha.toIso8601String(),
      'id_compra': idCompra,
    };
  }

  factory MovimientoProducto.fromMap(Map<String, dynamic> map) {
    return MovimientoProducto(
      idMovimientoProducto: map['id_movimiento_producto'],
      idProducto: map['id_producto'],
      tipo: map['tipo'],
      cantidad: map['cantidad']?.toInt() ?? 0,
      fecha: DateTime.parse(map['fecha']),
      idCompra: map['id_compra'],
    );
  }
}
