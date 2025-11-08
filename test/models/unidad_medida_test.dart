import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnidadMedida', () {
    final unidadMedida = UnidadMedida(idUnidadMedida: 1, nombre: 'Kilogramo');

    final unidadMedidaJson = {'id_unidad': 1, 'nombre': 'Kilogramo'};

    test('fromJson crea una instancia correcta', () {
      final fromJson = UnidadMedida.fromJson(unidadMedidaJson);
      expect(fromJson, unidadMedida);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = unidadMedida.toJson();
      expect(toJson, unidadMedidaJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = unidadMedida.copyWith(nombre: 'Gramo');

      expect(copia.nombre, 'Gramo');
      expect(copia.idUnidadMedida, unidadMedida.idUnidadMedida);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final um1 = UnidadMedida(idUnidadMedida: 1, nombre: 'Kilogramo');
      final um2 = UnidadMedida(idUnidadMedida: 1, nombre: 'Kilogramo');

      expect(um1, um2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final um1 = UnidadMedida(idUnidadMedida: 1, nombre: 'Kilogramo');
      final um2 = UnidadMedida(idUnidadMedida: 1, nombre: 'Kilogramo');

      expect(um1.hashCode, um2.hashCode);
    });

    test('El modelo funciona con id nulo', () {
      final unidadNula = UnidadMedida(nombre: 'Litro');
      final unidadNulaJson = {'id_unidad': null, 'nombre': 'Litro'};

      expect(unidadNula.idUnidadMedida, isNull);
      expect(unidadNula.toJson(), unidadNulaJson);
      expect(UnidadMedida.fromJson(unidadNulaJson), unidadNula);
    });
  });
}
