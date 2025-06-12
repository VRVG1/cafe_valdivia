import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumo_producto.dart';

class Producto implements BaseModel {
  @override
  int? id;
  final String nombre;
  final String? descripcion;
  final double precioVenta;
  List<InsumoProducto>? insumos; // Relacion cargada

  Producto({
    this.id,
    required this.nombre,
    this.descripcion,
    this.precioVenta = 0.0,
    this.insumos,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_producto': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio_venta': precioVenta,
    };
  }

  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id_producto'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      precioVenta: map['precio_venta']?.toDouble() ?? 0.0,
    );
  }
}
