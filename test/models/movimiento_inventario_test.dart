import 'package:cafe_valdivia/models/movimiento_invetario.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Movimiento inventario models', () {
    final objeto = MovimientoInvetario(
      idInsumo: 10,
      tipo: TipoMovimiento.entrada,
      cantidad: 99,
      fecha: DateTime.parse('2023-10-01T12:00:00.000Z'),
      id: 999,
      motivo: 'Prueba sale bien',
      idDetalleVenta: 10,
    );

    final mapa = {
      'id_insumo': 9,
      'tipo': 'Salida',
      'cantidad': 88,
      'fecha': '2023-10-01T12:00:00.000Z',
      'id_movimiento_invetario': 777,
      'motivo': 'Quiero un cafe',
      'id_detalle_compra': 1,
      'id_detalle_venta': null,
    };

    test('fromMap works correctly?', () {
      final fromMap = MovimientoInvetario.fromMap(mapa);

      expect(fromMap.idInsumo, 9);
      expect(fromMap.tipo, TipoMovimiento.salida);
      expect(fromMap.cantidad, 88);
      expect(fromMap.fecha, DateTime.parse('2023-10-01T12:00:00.000Z'));
      expect(fromMap.id, 777);
      expect(fromMap.motivo, 'Quiero un cafe');
      expect(fromMap.idDetalleCompra, 1);
      expect(fromMap.idDetalleVenta, isNull);
    });

    test('toMap worls correctly?', () {
      final toMap = objeto.toMap();

      expect(toMap['id_insumo'], 10);
      expect(toMap['tipo'], TipoMovimiento.entrada.dbValue);
      expect(toMap['cantidad'], 99);
      expect(toMap['id_movimiento_invetario'], 999);
      expect(toMap['motivo'], 'Prueba sale bien');
      expect(toMap['id_detalle_venta'], 10);
      expect(toMap['id_detalle_compra'], isNull);
    });

    test('handles unknow tipo correctly', () {
      final invalidMap = Map<String, dynamic>.from(mapa)..['tipo'] = 'invalid';

      final movimiento = MovimientoInvetario.fromMap(invalidMap);
      expect(movimiento.tipo, TipoMovimiento.invalid);
    });
  });
}
