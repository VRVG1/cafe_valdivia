import 'package:cafe_valdivia/models/detalle_venta.dart';
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
      'id_venta': 10,
      'id_cliente': 90,
      'fecha': '2025-10-01T14:30:00.000Z',
      'detalles': 'Para llevar',
      'pagado': 1,
    };

    final ventaDetallada1 = DetalleVenta(
      precioUnitarioVenta: 10,
      cantidad: 2,
      idProducto: 6,
      idVenta: 100,
      id: 9,
    );

    final ventaDetallada2 = DetalleVenta(
      precioUnitarioVenta: 20,
      cantidad: 5,
      idProducto: 9,
      idVenta: 125,
      id: 1,
    );
    test("fromMap creates correct instance", () {
      final venta = Venta.fromMap(mapaVenta);

      expect(venta.id, 10);
      expect(venta.idCliente, 90);
      expect(venta.fecha, DateTime.parse('2025-10-01T14:30:00.000Z'));
      expect(venta.detalles, 'Para llevar');
      expect(venta.pagado, true);
    });

    test("toMap creates correct map", () {
      final mapa = objetoVenta.toMap();

      expect(mapa['id_venta'], 2);
      expect(mapa['id_cliente'], 1);
      expect(mapa['fecha'], '2025-10-01T14:30:00.000Z');
      expect(mapa['detalles'], "Pinche jodida");
      expect(mapa['pagado'], 0);
    });

    test("Total calculate correctly", () {
      final venta = Venta(
        detallesVenta: [ventaDetallada1, ventaDetallada2],
        idCliente: 1,
        fecha: DateTime.now(),
      );

      expect(venta.total, 120.0);
    });
  });
}
