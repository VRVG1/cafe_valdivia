import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:test/test.dart';

void main() {
  group('Compra Model Test', () {
    final testMap = {
      'id_compra': 1,
      'id_proveedor': 100,
      'fecha': '2023-10-01T12:00:00.000Z',
      'detalles': 'Compra de insumos',
      'pagado': 1,
    };
    final compra = Compra(
      id: 1,
      idProveedor: 100,
      fecha: DateTime.parse('2023-10-01T12:00:00.000Z'),
      detalles: 'Compra de insumos',
      pagado: true,
    );
    test('fromMap creates correct instance', () {
      final compra = Compra.fromMap(testMap);

      expect(compra.id, 1);
      expect(compra.idProveedor, 100);
      expect(compra.fecha, DateTime.parse('2023-10-01T12:00:00.000Z'));
      expect(compra.detalles, 'Compra de insumos');
      expect(compra.pagado, true);
    });

    test('toMap returns correct structure', () {
      final map = compra.toMap();

      expect(map['id_compra'], 1);
      expect(map['id_proveedor'], 100);
      expect(map['fecha'], '2023-10-01T12:00:00.000Z');
      expect(map['detalles'], 'Compra de insumos');
      expect(map['pagado'], 1);
    });

    test('total calculates correctly', () {
      final compra = Compra(
        detallesCompra: [
          DetalleCompra(
            cantidad: 2,
            costoUnitario: 10,
            idCompra: 1,
            idInsumo: 1,
          ),
          DetalleCompra(
            cantidad: 3,
            costoUnitario: 5,
            idCompra: 1,
            idInsumo: 2,
          ),
        ],
        idProveedor: 100,
        fecha: DateTime.now(),
      );

      expect(compra.total, 35.0); // (2*10) + (3*5) = 35
    });

    test('copyWith works correctly', () {
      final original = Compra(
        id: 1,
        idProveedor: 100,
        fecha: DateTime.now(),
        pagado: false,
      );

      final copy = original.copyWith(pagado: true);

      expect(copy.id, 1);
      expect(copy.pagado, true);
      expect(identical(original, copy), false);
    });
  });
}
