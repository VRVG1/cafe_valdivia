class Compra {
  int? idCompra;
  int idInsumo;
  double cantidad;
  double montoTotal = 0.0;
  DateTime fecha;
  String? detalles;
  bool pagado;

  Compra({
    this.idCompra,
    required this.idInsumo,
    required this.cantidad,
    required this.fecha,
    this.montoTotal = 0.0,
    this.detalles,
    this.pagado = false,
  });

  //
  Map<String, dynamic> toMap() {
    return {
      'id_compra': idCompra,
      'id_insumo': idInsumo,
      'cantidad': cantidad,
      'fecha': fecha.toIso8601String(),
      'monto_total': montoTotal,
      'detalles': detalles,
      'pagado': pagado ? 1 : 0,
    };
  }

  // Factory para crear una Compra desde un Map (resultado de la BD)
  factory Compra.fromMap(Map<String, dynamic> map) {
    return Compra(
      idCompra: map['id_compra'],
      idInsumo: map['id_insumo'],
      cantidad: map['cantidad'].toDouble(),
      fecha: DateTime.parse(map['fecha']),
      montoTotal: map['monto_total']?.toDouble() ?? 0.0,
      detalles: map['detalles'],
      pagado: map['pagado'] == 1,
    );
  }
}
