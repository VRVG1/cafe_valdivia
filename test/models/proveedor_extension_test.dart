import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/core/models/proveedor_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProveedorExtension', () {
    test('iniciales debe retornar la primera letra del nombre', () {
      final proveedor = Proveedor(
        idProveedor: 1,
        nombre: 'Proveedor de Cafe',
      );

      expect(proveedor.iniciales, 'P');
    });

    test('iniciales debe funcionar con nombres cortos', () {
      final proveedor = Proveedor(
        idProveedor: 2,
        nombre: 'A',
      );

      expect(proveedor.iniciales, 'A');
    });
  });
}
