import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumos.dart';

class DetalleCompra implements BaseModel {
  @override
  int? id;
  final int idCompra;
  final int idInsumo;
  final double cantidad;
  final double costoUnitario;
  Insumos? insumo;

  DetalleCompra({
    this.id,
    required this.idCompra,
    required this.idInsumo,
    required this.cantidad,
    required this.costoUnitario,
    this.insumo,
  });

  double get subtotal => cantidad * costoUnitario;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_detalle_compra': id,
      'id_compra': idCompra,
      'id_insumo': idInsumo,
      'cantidad': cantidad,
      'costo_unitario': costoUnitario,
    };
  }

  factory DetalleCompra.fromMap(Map<String, dynamic> map) {
    return DetalleCompra(
      id: map['id_detalle_compra'],
      idCompra: map['id_compra'],
      idInsumo: map['id_insumo'],
      cantidad: map['cantidad']?.toDouble() ?? 0.0,
      costoUnitario: map['costo_unitario']?.toDouble() ?? 0.0,
    );
  }
}
