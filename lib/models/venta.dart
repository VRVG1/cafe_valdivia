class Venta {
  int? idVenta;
  int idCliente;
  DateTime fecha;
  double kilosVendidos;
  double montoTotal;
  String? detalles;
  bool pagado;

  Venta({
    this.idVenta,
    required this.idCliente,
    required this.fecha,
    this.kilosVendidos = 0.0,
    this.montoTotal = 0.0,
    this.detalles,
    this.pagado = false,
  });

  // Convertir un Cliente a un Map para insertarlo en la BD.
  Map<String, dynamic> toMap() {
    return {
      'id_venta': idVenta,
      'id_cliente': idCliente,
      'fecha': fecha.toIso8601String(),
      'kilos_vendidos': kilosVendidos,
      'monto_total': montoTotal,
      'detalles': detalles,
      'pagado': pagado ? 1 : 0,
    };
  }

  factory Venta.fromMap(Map<String, dynamic> map) {
    return Venta(
      idVenta: map['id_venta'],
      idCliente: map['id_cliente'],
      fecha: DateTime.parse(map['fecha']), // Parsear String a DateTime
      kilosVendidos: map['kilos_vendidos'] as double,
      montoTotal: map['monto_total'] as double,
      detalles: map['detalles'],
      pagado: map['pagado'] == 1, // Convertir int a bool
    );
  }
}
