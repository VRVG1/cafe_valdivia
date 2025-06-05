class DetalleVenta {
  int? idDetalleVenta;
  int idVenta;
  int idProducto;
  int cantidad;
  double precioUnitarioVenta;
  double subtotal;

  DetalleVenta({
    this.idDetalleVenta,
    required this.idVenta,
    required this.idProducto,
    required this.cantidad,
    this.precioUnitarioVenta = 0.0,
    this.subtotal = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_detalle_venta': idDetalleVenta,
      'id_venta': idVenta,
      'id_producto': idProducto,
      'cantidad': cantidad,
      'precio_unitario_venta': precioUnitarioVenta,
      'subtotal': subtotal,
    };
  }

  factory DetalleVenta.fromMap(Map<String, dynamic> map) {
    return DetalleVenta(
      idDetalleVenta: map['id_detalle_venta'],
      idVenta: map['id_venta'],
      idProducto: map['id_producto'],
      cantidad: map['cantidad'] as int,
      precioUnitarioVenta: map['precio_unitario_venta'] as double,
      subtotal: map['subtotal'] as double,
    );
  }
}
