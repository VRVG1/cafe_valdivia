import 'package:cafe_valdivia/models/insumos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Insumo model Test", () {
    final insumoObjeto = Insumos(
      nombre: "CafeValdivia",
      idUnidad: 1,
      descripcion: 'El mejor',
    );
    final insumoMapa = {
      'nombre': 'Caca',
      'id_unidad': 10,
      'descripcion': 'El peor',
    };

    test('fromMap works correctly?', () {
      final objeto = Insumos.fromMap(insumoMapa);

      expect(objeto.nombre, 'Caca');
      expect(objeto.idUnidad, 10);
      expect(objeto.descripcion, 'El peor');
    });

    test('toMap works correctly?', () {
      final mapa = insumoObjeto.toMap();

      expect(mapa['nombre'], 'CafeValdivia');
      expect(mapa['id_unidad'], 1);
      expect(mapa['descripcion'], 'El mejor');
    });
  });
}
