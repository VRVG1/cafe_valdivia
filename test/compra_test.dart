import 'package:cafe_valdivia/models/compra.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test del modelo Compra', () {
    test('toMap() retorna un mapa válido con todos los campos', () {
      final compra = Compra(
        idCompra: 1,
        idInsumo: 100,
        cantidad: 5.5,
        fecha: DateTime.parse('2023-10-01T12:00:00'),
        detalles: 'Compra de prueba',
        pagado: true,
      );

      final map = compra.toMap();

      expect(map['id_compra'], 1);
      expect(map['id_insumo'], 100);
      expect(map['cantidad'], 5.5);
      expect(map['fecha'], '2023-10-01T12:00:00.000');
      expect(map['detalles'], 'Compra de prueba');
      expect(map['pagado'], 1); // Verifica conversión a entero para SQLite
    });

    test('fromMap() crea una instancia válida desde un mapa', () {
      final map = {
        'id_compra': 2,
        'id_insumo': 200,
        'cantidad': 10.0,
        'fecha': '2023-12-06T12:30:00.000',
        'detalles': 'Insumo de prueba',
        'pagado': 0, // 0 = false
      };

      final compra = Compra.fromMap(map);

      expect(compra.idCompra, 2);
      expect(compra.idInsumo, 200);
      expect(compra.cantidad, 10.0);
      expect(compra.fecha, DateTime.parse('2023-12-06T12:30:00.000'));
      expect(compra.detalles, 'Insumo de prueba');
      expect(compra.pagado, false); // Verifica conversión de 0 a false
    });

    test('toMap() maneja valores nulos y por defecto correctamente', () {
      final compra = Compra(
        idInsumo: 300,
        cantidad: 7.0,
        fecha: DateTime.parse('2023-10-01T12:00:00.000'),
        // idCompra: omitido (será null)
        // detalles: omitido (será null)
        // pagado: omitido (por defecto false)
      );

      final map = compra.toMap();

      expect(map['id_compra'], isNull);
      expect(map['id_insumo'], 300);
      expect(map['cantidad'], 7.0);
      expect(map['fecha'], '2023-10-01T12:00:00.000');
      expect(map['detalles'], isNull);
      expect(map['pagado'], 0); // false convertido a 0
    });
  });
}
