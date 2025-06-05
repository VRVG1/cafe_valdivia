import 'package:cafe_valdivia/models/venta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test del modelo Venta', () {
    test('Verificar que el metodo toMap() regrese un map valido', () {
      final venta = Venta(
        idVenta: 1,
        idCliente: 123,
        fecha: DateTime.parse('2023-10-01T12:00:00'),
        kilosVendidos: 10.5,
        montoTotal: 150.0,
        detalles: 'Venta de prueba',
        pagado: true,
      );

      final map = venta.toMap();

      expect(map['id_venta'], 1);
      expect(map['id_cliente'], 123);
      expect(map['fecha'], '2023-10-01T12:00:00.000');
      expect(map['kilos_vendidos'], 10.5);
      expect(map['monto_total'], 150.0);
      expect(map['detalles'], 'Venta de prueba');
      expect(map['pagado'], 1); // 1 para true
    });

    test(
      "Verificar que el metodo fromMap() cree una intancia de venta valido",
      () {
        final map = {
          'id_venta': 3,
          'id_cliente': 221,
          'fecha': '2023-12-06T12:30:00',
          'kilos_vendidos': 20.0,
          'monto_total': 400.0,
          'detalles': 'Venta de prueba',
          'pagado': 0, // 0 para false
        };

        final venta = Venta.fromMap(map);

        expect(venta.idVenta, 3);
        expect(venta.idCliente, 221);
        expect(venta.fecha, DateTime.parse('2023-12-06T12:30:00.000'));
        expect(venta.kilosVendidos, 20.0);
        expect(venta.montoTotal, 400.0);
        expect(venta.detalles, 'Venta de prueba');
        expect(venta.pagado, false); // 0 se convierte a false
      },
    );

    test(
      "Veri ficar que la funcion toMap() puede manejar los valores por defecto y nulos",
      () {
        final venta = Venta(
          idVenta: 5,
          idCliente: 10,
          fecha: DateTime.parse('2023-10-01T12:00:00.000'),
          kilosVendidos: 0.0,
          montoTotal: 0.0,
          detalles: null,
          pagado: false,
        );

        final map = venta.toMap();
        expect(map['id_venta'], 5);
        expect(map['id_cliente'], 10);
        expect(map['fecha'], '2023-10-01T12:00:00.000');
        expect(map['kilos_vendidos'], 0.0);
        expect(map['monto_total'], 0.0);
        expect(map['detalles'], isNull);
        expect(map['pagado'], 0); // 0 para false
      },
    );
  });
}
