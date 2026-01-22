import 'package:cafe_valdivia/models/proveedor.dart';

extension ProveedorExtension on Proveedor {
  String get iniciales {
    return nombre[0].toUpperCase();
  }
}
