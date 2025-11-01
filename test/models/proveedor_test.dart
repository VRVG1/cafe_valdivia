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
      final proveedor = Proveedor.fromJson(testMap);

      expect(proveedor.id, 1);
      expect(proveedor.nombre, 'Cocacola');
      expect(proveedor.telefono, '1231231231');
      expect(proveedor.email, 'cocacola@cocacola.com');
      expect(proveedor.direccion, 'Avenida las garzas');
    });

    test('toJson regresa un mapa correcto', () {
      final proveedorMap = proveedorObject.toJson();

      expect(proveedorMap['id_proveedor'], proveedorObject.id);
      expect(proveedorMap['nombre'], proveedorObject.nombre);
      expect(proveedorMap['telefono'], proveedorObject.telefono);
      expect(proveedorMap['email'], proveedorObject.email);
      expect(proveedorMap['direccion'], proveedorObject.direccion);
    });

    test('Crear un proveiedor sin los valores obligatorios si funciona', () {
      final proveedorIncompleto = Proveedor(
        nombre: "Pene",
        telefono: "1231231231",
      );

      expect(proveedorIncompleto.id, isNull);
      expect(proveedorIncompleto.nombre, 'Pene');
      expect(proveedorIncompleto.telefono, "1231231231");
      expect(proveedorIncompleto.email, isNull);
      expect(proveedorIncompleto.direccion, isNull);
    });

    test(
      'Crear  un provvedor sin los valores obligatorios y hacerlo un map funciona',
      () {
        final proveedorIncompleto = Proveedor(
          nombre: "Pene",
          telefono: "09876543211",
        );
        final proveedorIncompletoJson = proveedorIncompleto.toJson();

        expect(proveedorIncompletoJson['idProveedor'], isNull);
        expect(proveedorIncompletoJson['nombre'], 'Pene');
        expect(proveedorIncompletoJson['telefono'], "09876543211");
        expect(proveedorIncompletoJson['email'], isNull);
        expect(proveedorIncompletoJson['direccion'], isNull);
      },
    );
  });
}
