import 'package:cafe_valdivia/models/cliente.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Cliente Model Test", () {
    final testMap = {
      'id_cliente': 1,
      'nombre': 'Alonso',
      'apellido': 'Perez',
      'telefono': '9203651780',
      'email': 'alonsoPerez@correo.com',
    };

    test("FromMap crea un instancia correcta", () {
      final cliente = Cliente.fromJson(testMap);

      expect(cliente.id, 1);
      expect(cliente.nombre, 'Alonso');
      expect(cliente.apellido, 'Perez');
      expect(cliente.telefono, '9203651780');
      expect(cliente.email, 'alonsoPerez@correo.com');
    });

    test('toMap regresa un mapa correcto', () {
      final cliente = Cliente(
        id: 2,
        nombre: 'Manito',
        apellido: 'Panzas',
        telefono: '1212121212',
        email: 'manito@panzas.com',
      );

      final map = cliente.toJson();

      expect(map['id_cliente'], cliente.id);
      expect(map['nombre'], cliente.nombre);
      expect(map['apellido'], cliente.apellido);
      expect(map['telefono'], cliente.telefono);
      expect(map['email'], cliente.email);
    });

    test('Crear un cliente con valores no requidos funciona', () {
      final cliente = Cliente(
        nombre: 'Pinto',
        apellido: 'Panzas',
        telefono: '1212121212',
      );

      expect(cliente.id, isNull);
      expect(cliente.nombre, 'Pinto');
      expect(cliente.apellido, 'Panzas');
      expect(cliente.telefono, '1212121212');
      expect(cliente.email, isNull);
    });

    test(
      'Crear un cliente con valores no requidos y convertirlo a un mapa funciona',
      () {
        final cliente = Cliente(
          nombre: 'Pinto',
          apellido: 'Panzas',
          telefono: '1212121212',
        );

        final map = cliente.toJson();

        expect(map['id_cliente'], isNull);
        expect(map['nombre'], cliente.nombre);
        expect(map['apellido'], cliente.apellido);
        expect(map['telefono'], cliente.telefono);
        expect(map['email'], isNull);
      },
    );
  });
}
