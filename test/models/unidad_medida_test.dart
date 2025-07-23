import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit test UnidadMedida', () {
    final testMap = {'id_unidad': 1, 'nombre': 'Kilogramo'};

    final objeto = UnidadMedida(nombre: "Pieza");

    test('fromMap creates correct instance', () {
      final frommap = UnidadMedida.fromMap(testMap);

      expect(frommap.nombre, 'Kilogramo');
      expect(frommap.id, 1);
    });

    test('toMap creates correct map', () {
      final toMap = objeto.toMap();

      expect(toMap['nombre'], 'Pieza');
    });
  });
}
