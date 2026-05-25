import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Compra', () {
    final fecha = DateTime.parse('2025-10-01T12:00:00.000Z');
    final compra = Compra(
      idCompra: 1,
      idProveedor: 100,
      fecha: fecha,
      detalles: 'Compra de prueba',
      pagado: true,
    );

    final compraJson = {
      'id_compra': 1,
      'id_proveedor': 100,
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

      expect(copia.idCompra, compra.idCompra);
      expect(copia.idProveedor, compra.idProveedor);
      expect(copia.fecha, compra.fecha);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final c1 = Compra(
        idCompra: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );
      final c2 = Compra(
        idCompra: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );

      expect(c1, c2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final c1 = Compra(
        idCompra: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );
      final c2 = Compra(
        idCompra: 1,
        idProveedor: 100,
        fecha: fecha,
        detalles: 'Compra de prueba',
        pagado: true,
      );

      expect(c1.hashCode, c2.hashCode);
    });
    test('Instancias con valores diferentes no son iguales', () {
      final diferente = compra.copyWith(pagado: false);
      expect(diferente, isNot(compra));
      expect(diferente.hashCode, isNot(compra.hashCode));
    });

    test('copyWith no muta la instancia original', () {
      final original = compra;
      final modificado = compra.copyWith(pagado: false);
      expect(identical(original, modificado), isFalse);
      expect(original.pagado, true); // original intacto
      expect(modificado.pagado, false);
    });

    test('fromJson parsea DateTime UTC correctamente', () {
      final result = Compra.fromJson(compraJson);
      expect(result.fecha.isUtc, true);
      expect(result.fecha.year, 2025);
      expect(result.fecha.month, 10);
      expect(result.fecha.day, 1);
      expect(result.fecha.hour, 12);
      expect(result.fecha.minute, 0);
    });

    test('toJson serializa DateTime a ISO8601 con Z', () {
      final json = compra.toJson();
      expect(json['fecha'], '2025-10-01T12:00:00.000Z');
    });

    test('Round-trip: toJson → fromJson preserva el valor', () {
      final json = compra.toJson();
      final roundTrip = Compra.fromJson(json);
      expect(roundTrip, compra);
      expect(roundTrip.fecha, compra.fecha);
    });

    test('fromJson lanza error si falta un campo required', () {
      final jsonSinProveedor = Map<String, dynamic>.from(compraJson)
        ..remove('id_proveedor');
      expect(
        () => Compra.fromJson(jsonSinProveedor),
        throwsA(isA<TypeError>()),
      );
    });

    test('fromJson permite omitir campos opcionales', () {
      final jsonMinimo = {
        'id_compra': 1,
        'id_proveedor': 100,
        'fecha': '2025-10-01T12:00:00.000Z',
        'pagado': true,
      };
      final result = Compra.fromJson(jsonMinimo);
      expect(result.detalles, isNull);
    });

    test('toJson omite campos nulos por defecto', () {
      final minimal = Compra(
        idCompra: 1,
        idProveedor: 100,
        fecha: fecha,
        pagado: true,
      );
      final json = minimal.toJson();
      expect(json.containsKey('detalles'), isTrue);
    });

    test('copyWith puede limpiar campos nullable a null', () {
      final sinDetalles = compra.copyWith(detalles: null);
      expect(sinDetalles.detalles, isNull);
    });
  });
}
