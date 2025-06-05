class Producto {
  int? idProducto;
  String nombre;
  String? descripcion;
  double precioVenta;
  int stockDisponible;

  Producto({
    this.idProducto,
    required this.nombre,
    this.descripcion,
    this.precioVenta = 0.0,
    this.stockDisponible = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_producto': idProducto,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio_venta': precioVenta,
      'stock_disponible': stockDisponible,
    };
  }

  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      idProducto: map['id_producto'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      precioVenta: map['precio_venta'] as double,
      stockDisponible: map['stock_disponible'] as int,
    );
  }
}
