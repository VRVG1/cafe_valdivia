import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_valdivia/models/cliente.dart';

void main() {
  group('Cliente Model', () {
    test('Cliente.toMap() regresa un map valido', () {
      final cliente = Cliente(
        idCliente: 1,
        nombre: 'Juan',
        apellido: 'Perez',
        telefono: '1234567890',
        email: 'juan.perez@example.com',
        kilosComprados: 10.5,
        ventasTotales: 150.75,
      );

      final map = cliente.toMap();

      expect(map['id_cliente'], 1);
      expect(map['nombre'], 'Juan');
      expect(map['apellido'], 'Perez');
      expect(map['telefono'], '1234567890');
      expect(map['email'], 'juan.perez@example.com');
      expect(map['kilos_comprados'], 10.5);
      expect(map['ventas_totales'], 150.75);
    });

    test('Cliente.fromMap() deberia crear un objeto cliente de un mapa', () {
      final map = {
        'id_cliente': 2,
        'nombre': 'Mole',
        'apellido': 'Femat',
        'telefono': '1231231231',
        'email': 'ejemplo@ejemplo.com',
        'kilos_comprados': 5.0,
        'ventas_totales': 75.25,
      };

      final cliente = Cliente.fromMap(map);

      expect(cliente.idCliente, 2);
      expect(cliente.nombre, 'Mole');
      expect(cliente.apellido, 'Femat');
      expect(cliente.telefono, '1231231231');
      expect(cliente.email, 'ejemplo@ejemplo.com');
      expect(cliente.kilosComprados, 5.0);
      expect(cliente.ventasTotales, 75.25);
    });

    test(
      'Cliente.fromMap() deberia manejar los valores nulos y por defecto de forma correcta',
      () {
        final map = {
          'id_cliente': 3,
          'nombre': 'Adrian',
          //'apellido': 'Marcelo',
          'telefono': '1111111111',
          //'email': 'adrian@marcelo.com',
          'kilos_comprados': 0.0,
          'ventas_totales': 0.0,
        };

        final cliente = Cliente.fromMap(map);

        expect(cliente.idCliente, 3);
        expect(cliente.nombre, 'Adrian');
        expect(cliente.apellido, isNull);
        expect(cliente.telefono, '1111111111');
        expect(cliente.email, isNull);
        expect(cliente.kilosComprados, 0.0);
        expect(cliente.ventasTotales, 0.0);
      },
    );
  });
}
