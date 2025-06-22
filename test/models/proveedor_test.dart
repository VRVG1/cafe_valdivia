import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Proveedor Model Test", () {
    final testMap = {
      'id_proveedor': 1,
      'nombre': 'Cocacola',
      'telefono': '1231231231',
      'email': 'cocacola@cocacola.com',
      'direccion': 'Avenida las garzas',
    };

    final proveedorObject = Proveedor(
      id: 10,
      nombre: 'Ventus',
      telefono: '1291291290',
      email: 'ejemplo@ejemplo.com',
      direccion: 'Su casa',
    );
    test('FromMap crea una instancia correcta', () {
      final proveedor = Proveedor.fromMap(testMap);

      expect(proveedor.id, 1);
      expect(proveedor.nombre, 'Cocacola');
      expect(proveedor.telefono, '1231231231');
      expect(proveedor.email, 'cocacola@cocacola.com');
      expect(proveedor.direccion, 'Avenida las garzas');
    });

    test('toMap regresa un mapa correcto', () {
      final proveedorMap = proveedorObject.toMap();

      expect(proveedorMap['id_proveedor'], proveedorObject.id);
      expect(proveedorMap['nombre'], proveedorObject.nombre);
      expect(proveedorMap['telefono'], proveedorObject.telefono);
      expect(proveedorMap['email'], proveedorObject.email);
      expect(proveedorMap['direccion'], proveedorObject.direccion);
    });

    test('Crear un proveiedor sin los valores obligatorios si funciona', () {
      final proveedorIncompleto = Proveedor(nombre: "Pene");

      expect(proveedorIncompleto.id, isNull);
      expect(proveedorIncompleto.nombre, 'Pene');
      expect(proveedorIncompleto.telefono, isNull);
      expect(proveedorIncompleto.email, isNull);
      expect(proveedorIncompleto.direccion, isNull);
    });

    test(
      'Crear  un provvedor sin los valores obligatorios y hacerlo un map funciona',
      () {
        final proveedorIncompleto = Proveedor(nombre: "Pene");
        final proveedorIncompletoMap = proveedorIncompleto.toMap();

        expect(proveedorIncompletoMap['id_proveedor'], isNull);
        expect(proveedorIncompletoMap['nombre'], 'Pene');
        expect(proveedorIncompletoMap['telefono'], isNull);
        expect(proveedorIncompletoMap['email'], isNull);
        expect(proveedorIncompletoMap['direccion'], isNull);
      },
    );
  });
}
