import 'package:cafe_valdivia/models/movimiento_inventario_insumo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovimientoInventarioInsumo', () {
    final fecha = DateTime.parse('2025-11-01T10:00:00.000Z');
    final mii = MovimientoInventarioInsumo(
      id: 1,
      idInsumo: 10,
      tipo: 'entrada',
      cantidad: 100,
      fecha: fecha,
      idDetalleCompra: 20,
      idDetalleProduccion: 30,
      motivo: 'Compra inicial',
    );

    final miiJson = {
      'id': 1,
      'idInsumo': 10,
      'tipo': 'entrada',
      'cantidad': 100,
      'fecha': '2025-11-01T10:00:00.000Z',
      'idDetalleCompra': 20,
      'idDetalleProduccion': 30,
      'motivo': 'Compra inicial',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = MovimientoInventarioInsumo.fromJson(miiJson);
      expect(fromJson, mii);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = mii.toJson();
      expect(toJson, miiJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final miiCopia = mii.copyWith(
        cantidad: 150,
        tipo: 'salida',
        motivo: 'Uso en producción',
      );

      expect(miiCopia.cantidad, 150);
      expect(miiCopia.tipo, 'salida');
      expect(miiCopia.motivo, 'Uso en producción');
      // Los demás valores deben permanecer iguales
      expect(miiCopia.id, mii.id);
      expect(miiCopia.idInsumo, mii.idInsumo);
      expect(miiCopia.fecha, mii.fecha);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final mii1 = MovimientoInventarioInsumo(
        id: 1,
        idInsumo: 10,
        tipo: 'entrada',
        cantidad: 100,
        fecha: fecha,
        idDetalleCompra: 20,
        idDetalleProduccion: 30,
        motivo: 'Compra inicial',
      );
      final mii2 = MovimientoInventarioInsumo(
        id: 1,
        idInsumo: 10,
        tipo: 'entrada',
        cantidad: 100,
        fecha: fecha,
        idDetalleCompra: 20,
        idDetalleProduccion: 30,
        motivo: 'Compra inicial',
      );

      expect(mii1, mii2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final mii1 = MovimientoInventarioInsumo(
        id: 1,
        idInsumo: 10,
        tipo: 'entrada',
        cantidad: 100,
        fecha: fecha,
        idDetalleCompra: 20,
        idDetalleProduccion: 30,
        motivo: 'Compra inicial',
      );
      final mii2 = MovimientoInventarioInsumo(
        id: 1,
        idInsumo: 10,
        tipo: 'entrada',
        cantidad: 100,
        fecha: fecha,
        idDetalleCompra: 20,
        idDetalleProduccion: 30,
        motivo: 'Compra inicial',
      );

      expect(mii1.hashCode, mii2.hashCode);
    });
  });
}
