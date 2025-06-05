import 'package:cafe_valdivia/models/insumos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Insumo Model', () {
    test('Insumo.toMap() regresa un map valido', () {
      final insumo = Insumos(
        idInsumo: 1,
        nombre: "Cafe",
        descripcion: "Cafe verde no limpio",
        unidadMedida: "Kilos",
        stockActual: 250.0,
        costoUnitario: 120.0,
      );

      final map = insumo.toMap();

      expect(map['id_insumo'], 1);
      expect(map['nombre'], "Cafe");
      expect(map['descripcion'], 'Cafe verde no limpio');
      expect(map['stock_actual'], 250.0);
      expect(map['costo_unitario'], 120.0);
    });

    test("El insumo.fromMap() regresa un objeto de tipo insumo valido", () {
      final map = {
        'id_insumo': 2,
        'nombre': "Bolita",
        'descripcion': "Bolita que en realidad es garbanzo",
        'unidad_medida': "Kilos",
        'stock_actual': 150.0,
        'costo_unitario': 35.0,
      };

      final insumo = Insumos.fromMap(map);

      expect(insumo.idInsumo, 2);
      expect(insumo.nombre, "Bolita");
      expect(insumo.descripcion, "Bolita que en realidad es garbanzo");
      expect(insumo.unidadMedida, "Kilos");
      expect(insumo.stockActual, 150.0);
      expect(insumo.costoUnitario, 35.0);
    });

    test(
      "La creacion de un mapa con valores nullos/defaul es manejado correctamente",
      () {
        final map = {
          'id_insumo': 3,
          'nombre': "Azucar",
          //'descripcion': "Azucar blanca",
          'unidad_medida': "Kilos",
          'stock_actual': 0.0,
          'costo_unitario': 0.0,
        };

        final insumo = Insumos.fromMap(map);

        expect(insumo.idInsumo, 3);
        expect(insumo.nombre, "Azucar");
        expect(insumo.descripcion, isNull);
        expect(insumo.unidadMedida, "Kilos");
        expect(insumo.stockActual, 0.0);
        expect(insumo.costoUnitario, 0.0);
      },
    );
  });
}
