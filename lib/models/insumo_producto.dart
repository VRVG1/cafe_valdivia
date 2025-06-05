class InsumoProducto {
  int? idInsumoProducto;
  int idInsumo;
  int idProducto;
  double cantidadRequerida;

  InsumoProducto({
    this.idInsumoProducto,
    required this.idInsumo,
    required this.idProducto,
    this.cantidadRequerida = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_insumo_producto': idInsumoProducto,
      'id_insumo': idInsumo,
      'id_producto': idProducto,
      'cantidad_requerida': cantidadRequerida,
    };
  }

  factory InsumoProducto.fromMap(Map<String, dynamic> map) {
    return InsumoProducto(
      idInsumoProducto: map['id_insumo_producto'],
      idInsumo: map['id_insumo'],
      idProducto: map['id_producto'],
      cantidadRequerida: map['cantidad_requerida'] as double,
    );
  }
}
