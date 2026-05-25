import 'package:cafe_valdivia/core/models/orden_produccion_consumo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrdenProduccionConsumo', () {
    final opc = OrdenProduccionConsumo(
      idConsumo: 1,
      idOrdenProduccion: 10,
      idArticulo: 20,
      cantidadUsada: 5.5,
      costoArticuloMomento: 15.75,
    );

    final opcJson = {
      'id_consumo': 1,
      'id_orden_produccion': 10,
      'id_articulo': 20,
      'cantidad_usada': 5.5,
      'costo_articulo_momento': 15.75,
    };

    test('debe crearse correctamente con todos los campos', () {
      expect(opc.idConsumo, 1);
      expect(opc.idOrdenProduccion, 10);
      expect(opc.idArticulo, 20);
      expect(opc.cantidadUsada, 5.5);
      expect(opc.costoArticuloMomento, 15.75);
    });

    test('fromJson crea una instancia correcta', () {
      final fromJson = OrdenProduccionConsumo.fromJson(opcJson);
      expect(fromJson, opc);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = opc.toJson();
      expect(toJson, opcJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = opc.copyWith(
        cantidadUsada: 10.0,
        costoArticuloMomento: 20.00,
      );

      expect(copia.cantidadUsada, 10.0);
      expect(copia.costoArticuloMomento, 20.00);
      expect(copia.idConsumo, opc.idConsumo);
      expect(copia.idOrdenProduccion, opc.idOrdenProduccion);
      expect(copia.idArticulo, opc.idArticulo);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final opc1 = OrdenProduccionConsumo(
        idConsumo: 1,
        idOrdenProduccion: 10,
        idArticulo: 20,
        cantidadUsada: 5.5,
        costoArticuloMomento: 15.75,
      );
      final opc2 = OrdenProduccionConsumo(
        idConsumo: 1,
        idOrdenProduccion: 10,
        idArticulo: 20,
        cantidadUsada: 5.5,
        costoArticuloMomento: 15.75,
      );

      expect(opc1, opc2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final opc1 = OrdenProduccionConsumo(
        idConsumo: 1,
        idOrdenProduccion: 10,
        idArticulo: 20,
        cantidadUsada: 5.5,
        costoArticuloMomento: 15.75,
      );
      final opc2 = OrdenProduccionConsumo(
        idConsumo: 1,
        idOrdenProduccion: 10,
        idArticulo: 20,
        cantidadUsada: 5.5,
        costoArticuloMomento: 15.75,
      );

      expect(opc1.hashCode, opc2.hashCode);
    });

    test('El modelo funciona con id nulo', () {
      final opcNulo = OrdenProduccionConsumo(
        idOrdenProduccion: 10,
        idArticulo: 20,
        cantidadUsada: 5.5,
        costoArticuloMomento: 15.75,
      );
      final opcNuloJson = {
        'id_consumo': null,
        'id_orden_produccion': 10,
        'id_articulo': 20,
        'cantidad_usada': 5.5,
        'costo_articulo_momento': 15.75,
      };

      expect(opcNulo.idConsumo, isNull);
      expect(opcNulo.toJson(), opcNuloJson);
      expect(OrdenProduccionConsumo.fromJson(opcNuloJson), opcNulo);
    });

    test('fromJson lanza error si falta un campo required', () {
      final jsonIncompleto = Map<String, dynamic>.from(opcJson)
        ..remove('id_orden_produccion');

      expect(
        () => OrdenProduccionConsumo.fromJson(jsonIncompleto),
        throwsA(isA<TypeError>()),
      );
    });

    test('Instancias con valores diferentes no son iguales', () {
      final diferente = opc.copyWith(cantidadUsada: 99.9);
      expect(diferente, isNot(opc));
      expect(diferente.hashCode, isNot(opc.hashCode));
    });

    test('copyWith no muta la instancia original', () {
      final original = opc;
      final modificado = opc.copyWith(cantidadUsada: 50.0);
      expect(identical(original, modificado), isFalse);
      expect(original.cantidadUsada, 5.5);
      expect(modificado.cantidadUsada, 50.0);
    });
  });
}
