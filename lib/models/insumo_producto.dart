import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/models/producto.dart';

class InsumoProducto implements BaseModel {
  @override
  int? id;
  final int idInsumo;
  final int idProducto;
  final double cantidadRequerida;
  Insumos? insumo; //Relacion cargada
  Producto? producto; //Relacion cargada

  InsumoProducto({
    this.id,
    required this.idInsumo,
    required this.idProducto,
    required this.cantidadRequerida,
    this.insumo,
    this.producto,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_insumo_producto': id,
      'id_insumo': idInsumo,
      'id_producto': idProducto,
      'cantidad_requerida': cantidadRequerida,
    };
  }

  factory InsumoProducto.fromMap(Map<String, dynamic> map) {
    return InsumoProducto(
      id: map['id_insumo_producto'],
      idInsumo: map['id_insumo'],
      idProducto: map['id_producto'],
      cantidadRequerida: map['cantidad_requerida']?.toDouble() ?? 0.0,
    );
  }

  InsumoProducto copyWith({
    int? id,
    int? idInsumo,
    int? idProducto,
    double? cantidadRequerida,
  }) {
    return InsumoProducto(
      id: id ?? this.id,
      idInsumo: idInsumo ?? this.idInsumo,
      idProducto: idProducto ?? this.idProducto,
      cantidadRequerida: cantidadRequerida ?? this.cantidadRequerida,
    );
  }
}
