import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/producto.dart';

class DetalleVenta implements BaseModel {
  @override
  int? id;
  int? idVenta;
  final int idProducto;
  final int cantidad;
  final double precioUnitarioVenta;
  Producto? producto;

  DetalleVenta({
    this.id,
    this.idVenta,
    required this.idProducto,
    required this.cantidad,
    required this.precioUnitarioVenta,
    this.producto,
  });

  double get subtotal => cantidad * precioUnitarioVenta;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_detalle_venta': id,
      'id_venta': idVenta,
      'id_producto': idProducto,
      'cantidad': cantidad,
      'precio_unitario_venta': precioUnitarioVenta,
    };
  }

  factory DetalleVenta.fromMap(Map<String, dynamic> map) {
    return DetalleVenta(
      id: map['id_detalle_venta'],
      idVenta: map['id_venta'],
      idProducto: map['id_producto'],
      cantidad: map['cantidad'],
      precioUnitarioVenta: map['precio_unitario_venta']?.toDouble() ?? 0.0,
    );
  }

  DetalleVenta copyWith({
    int? id,
    int? idVenta,
    int? idProducto,
    int? cantidad,
    double? precioUnitarioVenta,
  }) {
    return DetalleVenta(
      id: id ?? this.id,
      idVenta: idVenta ?? this.idVenta,
      idProducto: idProducto ?? this.idProducto,
      cantidad: cantidad ?? this.cantidad,
      precioUnitarioVenta: precioUnitarioVenta ?? this.precioUnitarioVenta,
    );
  }

  //@override
  //String toString() {
  //  return 'DetalleVenta(idDetalleVenta: $idDetalleVenta, idVenta: $idVenta, idProducto: $idProducto, cantidad: $cantidad, precioUnitarioVenta: $precioUnitarioVenta)';
  //}
}
