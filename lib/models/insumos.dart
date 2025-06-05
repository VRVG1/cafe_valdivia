class Insumos {
  int? idInsumo;
  String nombre;
  String? descripcion;
  String unidadMedida;
  double stockActual;
  double costoUnitario;

  Insumos({
    this.idInsumo,
    required this.nombre,
    this.descripcion,
    required this.unidadMedida,
    this.stockActual = 0.0,
    this.costoUnitario = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_insumo': idInsumo,
      'nombre': nombre,
      'descripcion': descripcion,
      'unidad_medida': unidadMedida,
      'stock_actual': stockActual,
      'costo_unitario': costoUnitario,
    };
  }

  factory Insumos.fromMap(Map<String, dynamic> map) {
    return Insumos(
      idInsumo: map['id_insumo'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      unidadMedida: map['unidad_medida'],
      stockActual: map['stock_actual'] as double,
      costoUnitario: map['costo_unitario'] as double,
    );
  }
}
