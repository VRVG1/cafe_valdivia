import 'package:cafe_valdivia/models/compra.dart';
import 'package:test/test.dart';

void main() {
  group('Compra Model Test', () {
    final testMap = {
      'id_compra': 1,
      'idProveedor': 100,
      'fecha': '2023-10-01T12:00:00.000Z',
      'detalles': 'Compra de insumos',
      'pagado': true,
    };
    final compra = Compra(
      id: 1,
      idProveedor: 100,
      fecha: DateTime.parse('2023-10-01T12:00:00.000Z'),
      detalles: 'Compra de insumos',
      pagado: true,
    );
    test('fromJson creates correct instance', () {
      final compra = Compra.fromJson(testMap);

      expect(compra.id, 1);
      expect(compra.idProveedor, 100);
      expect(compra.fecha, DateTime.parse('2023-10-01T12:00:00.000Z'));
      expect(compra.detalles, 'Compra de insumos');
      expect(compra.pagado, true);
    });

    test('toJson returns correct structure', () {
      final map = compra.toJson();

      expect(map['id_compra'], 1);
      expect(map['idProveedor'], 100);
      expect(map['fecha'], '2023-10-01T12:00:00.000Z');
      expect(map['detalles'], 'Compra de insumos');
      expect(map['pagado'], true);
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
