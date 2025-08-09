import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/models/proveedor.dart';

class Compra implements BaseModel {
  @override
  int? id;
  //final int idInsumo;
  final int idProveedor;
  final DateTime fecha;
  final String? detalles;
  final bool pagado;
  Proveedor? proveedor;
  List<DetalleCompra> detallesCompra = [];
  //final double cantidad;
  //final double costoUnitario;

  Compra({
    this.id,
    required this.idProveedor,
    required this.fecha,
    this.detalles,
    this.pagado = false,
    this.proveedor,
    List<DetalleCompra>? detallesCompra,
    //required this.idInsumo,
    //required this.cantidad,
    //required this.costoUnitario,
  }) : detallesCompra = detallesCompra ?? [];

  double get total => detallesCompra.fold(
    0,
    (sum, detalle) => sum + (detalle.cantidad * detalle.precioUnitarioCompra),
  );
  //
  @override
  Map<String, dynamic> toMap() {
    return {
      'id_compra': id,
      'id_proveedor': idProveedor,
      'fecha': fecha.toIso8601String(),
      'detalles': detalles,
      'pagado': pagado ? 1 : 0,
      //'id_insumo': idInsumo,
      //'cantidad': cantidad,
      //'costo_unitario': costoUnitario,
    };
  }

  // Factory para crear una Compra desde un Map (resultado de la BD)
  factory Compra.fromMap(Map<String, dynamic> map) {
    return Compra(
      id: map['id_compra'],
      idProveedor: map['id_proveedor'],
      fecha: DateTime.parse(map['fecha']),
      detalles: map['detalles'],
      pagado: map['pagado'] == 1,
      //idInsumo: map['id_insumo'],
      //cantidad: map['cantidad']?.toDouble() ?? 0.0,
      //costoUnitario: map['costo_unitario']?.toDouble() ?? 0.0,
    );
  }

  Compra copyWith({
    int? id,
    int? idProveedor,
    DateTime? fecha,
    String? detalles,
    bool? pagado,
    //int? idInsumo,
    //double? cantidad,
    //double? costoUnitario,
  }) {
    return Compra(
      id: id ?? this.id,
      idProveedor: idProveedor ?? this.idProveedor,
      fecha: fecha ?? this.fecha,
      detalles: detalles ?? this.detalles,
      pagado: pagado ?? this.pagado,
      //idInsumo: idInsumo ?? this.idInsumo,
      //cantidad: cantidad ?? this.cantidad,
      //costoUnitario: costoUnitario ?? this.costoUnitario,
    );
  }
}
