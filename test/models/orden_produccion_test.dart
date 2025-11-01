import 'package:cafe_valdivia/models/orden_produccion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrdenProduccion', () {
    final fecha = DateTime.parse('2025-11-01T12:00:00.000Z');
    final op = OrdenProduccion(
      id: 1,
      idProducto: 5,
      cantidadProducida: 50,
      fecha: fecha,
      costoTotalProduccion: '1250.50',
      notas: 'Producción para stock',
    );

    final opJson = {
      'id': 1,
      'idProducto': 5,
      'cantidadProducida': 50,
      'fecha': '2025-11-01T12:00:00.000Z',
      'costoTotalProduccion': '1250.50',
      'notas': 'Producción para stock',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = OrdenProduccion.fromJson(opJson);
      expect(fromJson, op);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = op.toJson();
      expect(toJson, opJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final opCopia = op.copyWith(
        cantidadProducida: 60,
        notas: 'Producción urgente',
      );

      expect(opCopia.cantidadProducida, 60);
      expect(opCopia.notas, 'Producción urgente');
      // Los demás valores deben permanecer iguales
      expect(opCopia.id, op.id);
      expect(opCopia.idProducto, op.idProducto);
      expect(opCopia.fecha, op.fecha);
      expect(opCopia.costoTotalProduccion, op.costoTotalProduccion);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final op1 = OrdenProduccion(
        id: 1,
        idProducto: 5,
        cantidadProducida: 50,
        fecha: fecha,
        costoTotalProduccion: '1250.50',
        notas: 'Producción para stock',
      );
      final op2 = OrdenProduccion(
        id: 1,
        idProducto: 5,
        cantidadProducida: 50,
        fecha: fecha,
        costoTotalProduccion: '1250.50',
        notas: 'Producción para stock',
      );

      expect(op1, op2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final op1 = OrdenProduccion(
        id: 1,
        idProducto: 5,
        cantidadProducida: 50,
        fecha: fecha,
        costoTotalProduccion: '1250.50',
        notas: 'Producción para stock',
      );
      final op2 = OrdenProduccion(
        id: 1,
        idProducto: 5,
        cantidadProducida: 50,
        fecha: fecha,
        costoTotalProduccion: '1250.50',
        notas: 'Producción para stock',
      );

      expect(op1.hashCode, op2.hashCode);
    });
  });
}
