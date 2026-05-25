import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/models/cliente_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClienteExtension', () {
    test('iniciales debe retornar la primera letra del nombre y apellido', () {
      final cliente = Cliente(
        idCliente: 1,
        nombre: 'Juan',
        apellido: 'Perez',
      );

      expect(cliente.iniciales, 'JP');
    });

    test('iniciales debe retornar solo la inicial del nombre si no hay apellido', () {
      final cliente = Cliente(
        idCliente: 2,
        nombre: 'Maria',
        apellido: '',
      );

      expect(cliente.iniciales, 'M');
    });

    test('nombreYApellido debe retornar nombre y apellido separados', () {
      final cliente = Cliente(
        idCliente: 1,
        nombre: 'Juan',
        apellido: 'Perez',
      );

      expect(cliente.nombreYApellido, 'Juan  Perez');
    });

    test('nombreYApellido debe retornar solo el nombre si el apellido es vacio', () {
      final cliente = Cliente(
        idCliente: 2,
        nombre: 'Maria',
        apellido: '',
      );

      expect(cliente.nombreYApellido, 'Maria');
    });
  });
}
