import 'package:cafe_valdivia/models/cliente.dart';

extension ClienteExtension on Cliente {
  String get iniciales {
    if (apellido == null || apellido!.isEmpty) {
      return nombre[0].toUpperCase();
    }
    return nombre[0].toUpperCase() + apellido![0].toUpperCase();
  }

  String get nombreYApellido {
    if (apellido == null || apellido!.isEmpty) {
      return nombre;
    }
    return "$nombre  $apellido";
  }
}
