import 'package:cafe_valdivia/models/base_model.dart';

class Proveedor implements BaseModel {
  @override
  int? id;
  final String nombre;
  final String? telefono;
  final String? email;
  final String? direccion;

  Proveedor({
    this.id,
    required this.nombre,
    this.telefono,
    this.email,
    this.direccion,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_proveedor': id,
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'direccion': direccion,
    };
  }

  factory Proveedor.fromMap(Map<String, dynamic> map) {
    return Proveedor(
      id: map['id_proveedor'],
      nombre: map['nombre'],
      telefono: map['telefono'],
      email: map['email'],
      direccion: map['direccion'],
    );
  }

  Proveedor copyWith({
    int? id,
    String? nombre,
    String? telefono,
    String? email,
    String? direccion,
  }) {
    return Proveedor(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      direccion: direccion ?? this.direccion,
    );
  }
}
