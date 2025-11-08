import 'package:cafe_valdivia/models/venta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Venta', () {
    final fecha = DateTime.parse('2025-10-01T14:30:00.000Z');
    final venta = Venta(
      idVenta: 1,
      idCliente: 1,
      fecha: fecha,
      detalles: 'Venta de prueba',
      pagado: false,
      estado: VentaEstado.pendiente,
    );

    final ventaJson = {
      'id_venta': 1,
      'id_cliente': 1,
      'fecha': '2025-10-01T14:30:00.000Z',
      'detalles': 'Venta de prueba',
      'pagado': false,
      'estado': 'pendiente',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = Venta.fromJson(ventaJson);
      expect(fromJson, venta);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = venta.toJson();
      expect(toJson, ventaJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final ventaCopia = venta.copyWith(
        pagado: true,
        estado: VentaEstado.completa,
      );

      expect(ventaCopia.pagado, true);
      expect(ventaCopia.estado, VentaEstado.completa);
      // Los demás valores deben permanecer iguales
      expect(ventaCopia.idVenta, venta.idVenta);
      expect(ventaCopia.idCliente, venta.idCliente);
      expect(ventaCopia.fecha, venta.fecha);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final venta1 = Venta(
        idVenta: 1,
        idCliente: 1,
        fecha: fecha,
        detalles: 'Venta de prueba',
        pagado: false,
        estado: VentaEstado.pendiente,
      );
      final venta2 = Venta(
        idVenta: 1,
        idCliente: 1,
        fecha: fecha,
        detalles: 'Venta de prueba',
        pagado: false,
        estado: VentaEstado.pendiente,
      );

      expect(venta1, venta2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final venta1 = Venta(
        idVenta: 1,
        idCliente: 1,
        fecha: fecha,
        detalles: 'Venta de prueba',
        pagado: false,
        estado: VentaEstado.pendiente,
      );
      final venta2 = Venta(
        idVenta: 1,
        idCliente: 1,
        fecha: fecha,
        detalles: 'Venta de prueba',
        pagado: false,
        estado: VentaEstado.pendiente,
      );

      expect(venta1.hashCode, venta2.hashCode);
    });
  });

  group('VentaEstado Enum', () {
    test('fromValue retorna el enum correcto', () {
      expect(VentaEstado.fromValue('pendiente'), VentaEstado.pendiente);
      expect(VentaEstado.fromValue('completado'), VentaEstado.completa);
      expect(VentaEstado.fromValue('cancelado'), VentaEstado.cancelado);
    });

    test('fromValue lanza un error para un valor desconocido', () {
      expect(() => VentaEstado.fromValue('desconocido'), throwsArgumentError);
    });

    test('value retorna el string correcto', () {
      expect(VentaEstado.pendiente.value, 'pendiente');
      expect(VentaEstado.completa.value, 'completado');
      expect(VentaEstado.cancelado.value, 'cancelado');
    });
  });
}
