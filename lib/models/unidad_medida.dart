import 'package:cafe_valdivia/models/base_model.dart';

class UnidadMedida implements BaseModel {
  @override
  int? id;
  final String nombre;

  UnidadMedida({this.id, required this.nombre});

  @override
  Map<String, dynamic> toMap() {
    return {'id_unidad': id, 'nombre': nombre};
  }

  factory UnidadMedida.fromMap(Map<String, dynamic> map) {
    return UnidadMedida(id: map['id_unidad'], nombre: map['nombre']);
  }

  UnidadMedida copyWith({int? id, String? nombre}) {
    return UnidadMedida(id: id ?? this.id, nombre: nombre ?? this.nombre);
  }
}
