import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumos.dart';

class DetalleCompra implements BaseModel {
  @override
  int? id;
  int? idCompra;
  final int idInsumo;
  final double cantidad;
  final double precioUnitarioCompra;
  Insumos? insumo;

  DetalleCompra({
    this.id,
    this.idCompra,
    required this.idInsumo,
    required this.cantidad,
    required this.precioUnitarioCompra,
    this.insumo,
  });

  double get subtotal => cantidad * precioUnitarioCompra;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_detalle_compra': id,
      'id_compra': idCompra,
      'id_insumo': idInsumo,
      'cantidad': cantidad,
      'precio_unitario_compra': precioUnitarioCompra,
    };
  }

  factory DetalleCompra.fromMap(Map<String, dynamic> map) {
    return DetalleCompra(
      id: map['id_detalle_compra'],
      idCompra: map['id_compra'],
      idInsumo: map['id_insumo'],
      cantidad: map['cantidad']?.toDouble() ?? 0.0,
      precioUnitarioCompra: map['precio_unitario_compra']?.toDouble() ?? 0.0,
    );
  }
}
