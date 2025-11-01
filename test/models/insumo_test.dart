import 'package:cafe_valdivia/models/insumo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Insumo model Test", () {
    final insumoObjeto = Insumo(
      nombre: "CafeValdivia",
      idUnidad: 1,
      descripcion: 'El mejor',
      costoUnitario: "20.00",
    );
    final insumoMapa = {
      'nombre': 'Caca',
      'idUnidad': 10,
      'descripcion': 'El peor',
      'costoUnitario': "20.00",
    };

    test('fromJson works correctly?', () {
      final objeto = Insumo.fromJson(insumoMapa);

      expect(objeto.nombre, 'Caca');
      expect(objeto.idUnidad, 10);
      expect(objeto.descripcion, 'El peor');
      expect(objeto.costoUnitario, "20.00");
    });

    test('toJson works correctly?', () {
      final mapa = insumoObjeto.toJson();

      expect(mapa['nombre'], 'CafeValdivia');
      expect(mapa['idUnidad'], 1);
      expect(mapa['descripcion'], 'El mejor');
      expect(mapa['costoUnitario'], "20.00");
    });
  });
}
