import 'package:cafe_valdivia/models/producto.dart';

extension ProductoExtension on Producto {
  String get iniciales {
    return nombre[0].toUpperCase();
  }
}
