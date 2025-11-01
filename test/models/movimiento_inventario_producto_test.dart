import 'package:cafe_valdivia/models/movimiento_inventario_producto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovimientoInventarioProducto', () {
    final fecha = DateTime.parse('2025-10-01T14:30:00.000Z');
    final mip = MovimientoInventarioProducto(
      id: 1,
      cantidad: 10,
      fecha: fecha,
      idDetalleVenta: 1,
      tipo: TipoMovimiento.entrada,
      idDetalleProduccion: 10,
      idProducto: 10,
      motivo: 'Compra a proveedor',
    );

    final mipJson = {
      'id': 1,
      'idProducto': 10,
      'cantidad': 10,
      'fecha': '2025-10-01T14:30:00.000Z',
      'idDetalleVenta': 1,
      'idDetalleProduccion': 10,
      'tipo': 'entrada',
      'motivo': 'Compra a proveedor',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = MovimientoInventarioProducto.fromJson(mipJson);
      expect(fromJson, mip);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = mip.toJson();
      expect(toJson, mipJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final mipCopia = mip.copyWith(
        cantidad: 20,
        tipo: TipoMovimiento.salida,
        motivo: 'Venta a cliente',
      );

      expect(mipCopia.cantidad, 20);
      expect(mipCopia.tipo, TipoMovimiento.salida);
      expect(mipCopia.motivo, 'Venta a cliente');
      // Los demás valores deben permanecer iguales
      expect(mipCopia.id, mip.id);
      expect(mipCopia.idProducto, mip.idProducto);
      expect(mipCopia.fecha, mip.fecha);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final mip1 = MovimientoInventarioProducto(
        id: 1,
        cantidad: 10,
        fecha: fecha,
        idDetalleVenta: 1,
        tipo: TipoMovimiento.entrada,
        idDetalleProduccion: 10,
        idProducto: 10,
        motivo: 'Compra a proveedor',
      );
      final mip2 = MovimientoInventarioProducto(
        id: 1,
        cantidad: 10,
        fecha: fecha,
        idDetalleVenta: 1,
        tipo: TipoMovimiento.entrada,
        idDetalleProduccion: 10,
        idProducto: 10,
        motivo: 'Compra a proveedor',
      );

      expect(mip1, mip2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final mip1 = MovimientoInventarioProducto(
        id: 1,
        cantidad: 10,
        fecha: fecha,
        idDetalleVenta: 1,
        tipo: TipoMovimiento.entrada,
        idDetalleProduccion: 10,
        idProducto: 10,
        motivo: 'Compra a proveedor',
      );
      final mip2 = MovimientoInventarioProducto(
        id: 1,
        cantidad: 10,
        fecha: fecha,
        idDetalleVenta: 1,
        tipo: TipoMovimiento.entrada,
        idDetalleProduccion: 10,
        idProducto: 10,
        motivo: 'Compra a proveedor',
      );

      expect(mip1.hashCode, mip2.hashCode);
    });
  });

  group('TipoMovimiento Enum', () {
    test('fromValue retorna el enum correcto', () {
      expect(TipoMovimiento.fromValue('entrada'), TipoMovimiento.entrada);
      expect(TipoMovimiento.fromValue('salida'), TipoMovimiento.salida);
      expect(TipoMovimiento.fromValue('ajuste'), TipoMovimiento.ajuste);
    });

    test('fromValue lanza un error para un valor desconocido', () {
      expect(() => TipoMovimiento.fromValue('desconocido'),
          throwsArgumentError);
    });

    test('value retorna el string correcto', () {
      expect(TipoMovimiento.entrada.value, 'entrada');
      expect(TipoMovimiento.salida.value, 'salida');
      expect(TipoMovimiento.ajuste.value, 'ajuste');
    });
  });
}