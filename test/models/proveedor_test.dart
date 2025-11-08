import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Proveedor', () {
    final proveedor = Proveedor(
      idProveedor: 1,
      nombre: 'Proveedor de Café',
      telefono: '123456789',
      email: 'contacto@proveedor.com',
      direccion: 'Calle Falsa 123',
    );

    final proveedorJson = {
      'id_proveedor': 1,
      'nombre': 'Proveedor de Café',
      'telefono': '123456789',
      'email': 'contacto@proveedor.com',
      'direccion': 'Calle Falsa 123',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = Proveedor.fromJson(proveedorJson);
      expect(fromJson, proveedor);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = proveedor.toJson();
      expect(toJson, proveedorJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = proveedor.copyWith(nombre: 'Nuevo Proveedor');

      expect(copia.nombre, 'Nuevo Proveedor');
      expect(copia.idProveedor, proveedor.idProveedor);
      expect(copia.telefono, proveedor.telefono);
      expect(copia.email, proveedor.email);
      expect(copia.direccion, proveedor.direccion);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final p1 = Proveedor(
        idProveedor: 1,
        nombre: 'Proveedor de Café',
        telefono: '123456789',
        email: 'contacto@proveedor.com',
        direccion: 'Calle Falsa 123',
      );
      final p2 = Proveedor(
        idProveedor: 1,
        nombre: 'Proveedor de Café',
        telefono: '123456789',
        email: 'contacto@proveedor.com',
        direccion: 'Calle Falsa 123',
      );

      expect(p1, p2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final p1 = Proveedor(
        idProveedor: 1,
        nombre: 'Proveedor de Café',
        telefono: '123456789',
        email: 'contacto@proveedor.com',
        direccion: 'Calle Falsa 123',
      );
      final p2 = Proveedor(
        idProveedor: 1,
        nombre: 'Proveedor de Café',
        telefono: '123456789',
        email: 'contacto@proveedor.com',
        direccion: 'Calle Falsa 123',
      );

      expect(p1.hashCode, p2.hashCode);
    });

    test('El modelo funciona con campos nulos', () {
      final proveedorNulo = Proveedor(
        nombre: 'Otro Proveedor',
        telefono: '987654321',
      );
      final proveedorNuloJson = {
        'id_proveedor': null,
        'nombre': 'Otro Proveedor',
        'telefono': '987654321',
        'email': null,
        'direccion': null,
      };

      expect(proveedorNulo.idProveedor, isNull);
      expect(proveedorNulo.email, isNull);
      expect(proveedorNulo.toJson(), proveedorNuloJson);
      expect(Proveedor.fromJson(proveedorNuloJson), proveedorNulo);
    });
  });
}
