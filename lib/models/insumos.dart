import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';

class Insumos implements BaseModel {
  @override
  int? id;
  final String nombre;
  final String? descripcion;
  final int idUnidad;
  //final double costoUnitario;
  UnidadMedida? unidad; // relacion cargada

  Insumos({
    this.id,
    required this.nombre,
    this.descripcion,
    required this.idUnidad,
    // this.costoUnitario = 0.0,
    this.unidad,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_insumo': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'id_unidad': idUnidad,
      //'costo_unitario': costoUnitario,
    };
  }

  factory Insumos.fromMap(Map<String, dynamic> map) {
    return Insumos(
      id: map['id_insumo'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      idUnidad: map['id_unidad'],
      //costoUnitario: map['costo_unitario']?.toDouble() ?? 0.0,
    );
  }

  Insumos copyWith({
    int? id,
    String? nombre,
    String? descripcion,
    int? idUnidad,
  }) {
    return Insumos(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      idUnidad: idUnidad ?? this.idUnidad,
    );
  }
}
