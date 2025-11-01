import 'package:cafe_valdivia/models/compra.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Compra', () {
    final fecha = DateTime.parse('2025-10-01T12:00:00.000Z');
    final compra = Compra(
      id: 1,
      idProveedor: 100,
      fecha: fecha,
      detalles: 'Compra de prueba',
      pagado: true,
    );

    final compraJson = {
      'id': 1,
      'idProveedor': 100,
      'fecha': '2025-10-01T12:00:00.000Z',
      'detalles': 'Compra de prueba',
      'pagado': true,
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = Compra.fromJson(compraJson);
      expect(fromJson, compra);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = compra.toJson();
      expect(toJson, compraJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = compra.copyWith(pagado: false, detalles: 'Pagado después');

      expect(copia.pagado, false);
      expect(copia.detalles, 'Pagado después');
      // Los demás valores deben permanecer iguales
      expect(copia.id, compra.id);
      expect(copia.idProveedor, compra.idProveedor);
      expect(copia.fecha, compra.fecha);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final c1 = Compra(
        id: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );
      final c2 = Compra(
        id: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );

      expect(c1, c2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final c1 = Compra(
        id: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );
      final c2 = Compra(
        id: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );

      expect(c1.hashCode, c2.hashCode);
    });
  });
}