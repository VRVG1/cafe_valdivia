import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecetaDetalle', () {
    final rd = RecetaDetalle(
      idRecetaDetalle: 1,
      idReceta: 5,
      idArticulo: 100,
      cantidad: 2.0,
      idUnidad: 3,
    );

    final rdJson = {
      'id_receta_detalle': 1,
      'id_receta': 5,
      'id_articulo_componente': 100,
      'cantidad': 2.0,
      'id_unidad': 3,
    };

    test('debe crearse correctamente con todos los campos', () {
      expect(rd.idRecetaDetalle, 1);
      expect(rd.idReceta, 5);
      expect(rd.idArticulo, 100);
      expect(rd.cantidad, 2.0);
      expect(rd.idUnidad, 3);
    });

    test('fromJson crea una instancia correcta', () {
      final fromJson = RecetaDetalle.fromJson(rdJson);
      expect(fromJson, rd);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = rd.toJson();
      expect(toJson, rdJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = rd.copyWith(cantidad: 5.0, idUnidad: 2);

      expect(copia.cantidad, 5.0);
      expect(copia.idUnidad, 2);
      expect(copia.idRecetaDetalle, rd.idRecetaDetalle);
      expect(copia.idReceta, rd.idReceta);
      expect(copia.idArticulo, rd.idArticulo);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final rd1 = RecetaDetalle(
        idRecetaDetalle: 1,
        idReceta: 5,
        idArticulo: 100,
        cantidad: 2.0,
        idUnidad: 3,
      );
      final rd2 = RecetaDetalle(
        idRecetaDetalle: 1,
        idReceta: 5,
        idArticulo: 100,
        cantidad: 2.0,
        idUnidad: 3,
      );

      expect(rd1, rd2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final rd1 = RecetaDetalle(
        idRecetaDetalle: 1,
        idReceta: 5,
        idArticulo: 100,
        cantidad: 2.0,
        idUnidad: 3,
      );
      final rd2 = RecetaDetalle(
        idRecetaDetalle: 1,
        idReceta: 5,
        idArticulo: 100,
        cantidad: 2.0,
        idUnidad: 3,
      );

      expect(rd1.hashCode, rd2.hashCode);
    });

    test('El modelo funciona con id nulo', () {
      final rdNulo = RecetaDetalle(
        idReceta: 5,
        idArticulo: 100,
        cantidad: 2.0,
        idUnidad: 3,
      );
      final rdNuloJson = {
        'id_receta_detalle': null,
        'id_receta': 5,
        'id_articulo_componente': 100,
        'cantidad': 2.0,
        'id_unidad': 3,
      };

      expect(rdNulo.idRecetaDetalle, isNull);
      expect(rdNulo.toJson(), rdNuloJson);
      expect(RecetaDetalle.fromJson(rdNuloJson), rdNulo);
    });

    test('fromJson lanza error si falta un campo required', () {
      final jsonIncompleto = Map<String, dynamic>.from(rdJson)
        ..remove('id_receta');

      expect(
        () => RecetaDetalle.fromJson(jsonIncompleto),
        throwsA(isA<TypeError>()),
      );
    });

    test('Instancias con valores diferentes no son iguales', () {
      final diferente = rd.copyWith(cantidad: 99.0);
      expect(diferente, isNot(rd));
      expect(diferente.hashCode, isNot(rd.hashCode));
    });

    test('copyWith no muta la instancia original', () {
      final original = rd;
      final modificado = rd.copyWith(cantidad: 10.0);
      expect(identical(original, modificado), isFalse);
      expect(original.cantidad, 2.0);
      expect(modificado.cantidad, 10.0);
    });
  });
}
