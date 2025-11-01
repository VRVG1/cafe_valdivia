import 'package:cafe_valdivia/models/venta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Venta models unit test", () {
    final objetoVenta = Venta(
      id: 2,
      idCliente: 1,
      fecha: DateTime.parse('2025-10-01T14:30:00.000Z'),
      detalles: 'Pinche jodida',
      pagado: false,
    );

    final mapaVenta = {
      'id': 10,
      'idCliente': 90,
      'fecha': '2025-10-01T14:30:00.000Z',
      'detalles': 'Para llevar',
      'pagado': true,
    };

    test("fromJson creates correct instance", () {
      final venta = Venta.fromJson(mapaVenta);

      expect(venta.id, 10);
      expect(venta.idCliente, 90);
      expect(venta.fecha, DateTime.parse('2025-10-01T14:30:00.000Z'));
      expect(venta.detalles, 'Para llevar');
      expect(venta.pagado, true);
    });

    test("toJson creates correct map", () {
      final mapa = objetoVenta.toJson();

      expect(mapa['id'], 2);
      expect(mapa['idCliente'], 1);
      expect(mapa['fecha'], '2025-10-01T14:30:00.000Z');
      expect(mapa['detalles'], "Pinche jodida");
      expect(mapa['pagado'], false);
    });

    // test("Total calculate correctly", () {
    //   final venta = Venta(
    //     detallesVenta: [ventaDetallada1, ventaDetallada2],
    //     idCliente: 1,
    //     fecha: DateTime.now(),
    //   );

    //   expect(venta.total, 120.0);
    // });

    test('Venta.fromJson handles estado correctly', () {
      final ventaMapConEstado = {
        ...mapaVenta,
        'estado': VentaEstado.cancelado.value,
      };
      final venta = Venta.fromJson(ventaMapConEstado);
      expect(venta.estado, VentaEstado.cancelado);
    });

    test('Venta.fromJson uses default estado when null', () {
      final venta = Venta.fromJson(mapaVenta);
      expect(venta.estado, VentaEstado.pendiente);
    });

    test('Venta.toJson handles estado correctly', () {
      final venta = Venta(
        idCliente: 1,
        fecha: DateTime.now(),
        estado: VentaEstado.cancelado,
      );
      final mapa = venta.toJson();
      expect(mapa['estado'], 'cancelado');
    });

    test('VentaEstado.fromValue throws ArgumentError for invalid value', () {
      expect(
        () => VentaEstado.fromValue('Invalido'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
