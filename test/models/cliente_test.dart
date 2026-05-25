import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cliente', () {
    final cliente = Cliente(
      idCliente: 1,
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
      expect(copia.idCliente, cliente.idCliente);
      expect(copia.apellido, cliente.apellido);
      expect(copia.telefono, cliente.telefono);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final c1 = Cliente(
        idCliente: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );
      final c2 = Cliente(
        idCliente: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );

      expect(c1, c2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final c1 = Cliente(
        idCliente: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );
      final c2 = Cliente(
        idCliente: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        telefono: '123456789',
        email: 'juan.perez@example.com',
      );

      expect(c1.hashCode, c2.hashCode);
    });

    test('El modelo funciona con campos nulos', () {
      final clienteNulo = Cliente(nombre: 'Solo Nombre', apellido: '');

      expect(clienteNulo.idCliente, isNull);
      expect(clienteNulo.telefono, isNull);
      expect(clienteNulo.email, isNull);

      // toJson omite las claves nulas por defecto
      final json = clienteNulo.toJson();
      expect(json['nombre'], 'Solo Nombre');
      expect(json.containsKey('telefono'), isTrue);

      // fromJson con claves explícitas en null también debe funcionar
      final fromJson = Cliente.fromJson({
        'id_cliente': null,
        'nombre': 'Solo Nombre',
        'apellido': '',
        'telefono': null,
        'email': null,
      });
      expect(fromJson, clienteNulo);
    });
    test('Instancias con valores diferentes no son iguales', () {
      final diferente = cliente.copyWith(nombre: 'Pedro');
      expect(diferente, isNot(cliente));
      expect(diferente.hashCode, isNot(cliente.hashCode));
    });

    test('copyWith mantiene la instancia original intacta', () {
      final original = cliente;
      final modificado = cliente.copyWith(nombre: 'Otro');
      expect(identical(original, modificado), isFalse);
      expect(original.nombre, 'Juan');
      expect(modificado.nombre, 'Otro');
    });

    test('copyWith puede limpiar campos nullable a null', () {
      final conEmail = cliente.copyWith(email: 'nuevo@mail.com');
      final sinEmail = conEmail.copyWith(email: null);
      expect(sinEmail.email, isNull);
    });

    test('fromJson lanza error si falta un campo required', () {
      final jsonSinNombre = Map<String, dynamic>.from(clienteJson)
        ..remove('nombre');
      expect(() => Cliente.fromJson(jsonSinNombre), throwsA(isA<TypeError>()));
    });

    test('fromJson permite omitir claves de campos opcionales', () {
      final jsonMinimo = {'nombre': 'Juan', 'apellido': 'Pérez'};
      final result = Cliente.fromJson(jsonMinimo);
      expect(result.idCliente, isNull);
      expect(result.telefono, isNull);
      expect(result.email, isNull);
    });

    test('toJson omite campos nulos por defecto', () {
      final minimal = Cliente(nombre: 'Juan', apellido: 'Pérez');
      final json = minimal.toJson();
      expect(json.containsKey('id_cliente'), isTrue);
      expect(json.containsKey('telefono'), isTrue);
      expect(json.containsKey('email'), isTrue);
    });
  });
}
