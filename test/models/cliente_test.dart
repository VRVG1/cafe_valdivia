import 'package:cafe_valdivia/models/cliente.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cliente', () {
    final cliente = Cliente(
      id: 1,
      nombre: 'Juan',
      apellido: 'Pérez',
      telefono: '123456789',
      email: 'juan.perez@example.com',
    );

    final clienteJson = {
      'id_cliente': 1,
      'nombre': 'Juan',
      'apellido': 'Pérez',
      'telefono': '123456789',
      'email': 'juan.perez@example.com',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = Cliente.fromJson(clienteJson);
      expect(fromJson, cliente);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = cliente.toJson();
      expect(toJson, clienteJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = cliente.copyWith(
        nombre: 'Juanito',
        email: 'juanito@example.com',
      );

      expect(copia.nombre, 'Juanito');
      expect(copia.email, 'juanito@example.com');
      // Los demás valores deben permanecer iguales
      expect(copia.id, cliente.id);
      expect(copia.apellido, cliente.apellido);
      expect(copia.telefono, cliente.telefono);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final c1 = Cliente(
        id: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );
      final c2 = Cliente(
        id: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );

      expect(c1, c2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final c1 = Cliente(
        id: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );
      final c2 = Cliente(
        id: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );

      expect(c1.hashCode, c2.hashCode);
    });

    test('El modelo funciona con campos nulos', () {
      final clienteNulo = Cliente(nombre: 'Solo Nombre');
      final clienteNuloJson = {
        'id_cliente': null,
        'nombre': 'Solo Nombre',
        'apellido': null,
        'telefono': null,
        'email': null,
      };

      expect(clienteNulo.id, isNull);
      expect(clienteNulo.apellido, isNull);
      expect(clienteNulo.toJson(), clienteNuloJson);
      expect(Cliente.fromJson(clienteNuloJson), clienteNulo);
    });
  });
}