import 'package:cafe_valdivia/core/utils/semana_actual.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('rangoSemanaActual', () {
    test('devuelve de lunes a domingo', () {
      // Domingo 25 de octubre de 2026.
      final rango = rangoSemanaActual(DateTime(2026, 10, 25));

      expect(rango.fechaInicio, '2026-10-19');
      expect(rango.fechaFin, '2026-10-25');
    });

    test('cruza el cambio de mes', () {
      // Martes 1 de septiembre de 2026.
      final rango = rangoSemanaActual(DateTime(2026, 9, 1));

      expect(rango.fechaInicio, '2026-08-31');
      expect(rango.fechaFin, '2026-09-06');
    });

    test('cruza el cambio de año', () {
      // Jueves 1 de enero de 2026.
      final rango = rangoSemanaActual(DateTime(2026, 1, 1));

      expect(rango.fechaInicio, '2025-12-29');
      expect(rango.fechaFin, '2026-01-04');
    });
  });
}
