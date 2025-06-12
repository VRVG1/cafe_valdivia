import 'package:cafe_valdivia/models/base_model.dart';

class Cliente implements BaseModel {
  @override
  int? id;
  final String nombre;
  final String? apellido;
  final String? telefono;
  final String? email;

  Cliente({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    this.email,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id_cliente': id,
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id_cliente'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      telefono: map['telefono'],
      email: map['email'],
    );
  }
}
