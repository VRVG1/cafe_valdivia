import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Receta', () {
    final receta = Receta(
      idReceta: 1,
      idArticuloProducto: 10,
      nombre: 'Receta de Pan',
      cantidad_base: 2.5,
    );

    final recetaJson = {
      'id_receta': 1,
      'id_articulo_producto': 10,
      'nombre': 'Receta de Pan',
      'cantidad_base': 2.5,
    };

    test('debe crearse correctamente con todos los campos', () {
      expect(receta.idReceta, 1);
      expect(receta.idArticuloProducto, 10);
      expect(receta.nombre, 'Receta de Pan');
      expect(receta.cantidad_base, 2.5);
    });

    test('fromJson crea una instancia correcta', () {
      final fromJson = Receta.fromJson(recetaJson);
      expect(fromJson, receta);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = receta.toJson();
      expect(toJson, recetaJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = receta.copyWith(
        nombre: 'Receta de Pastel',
        cantidad_base: 3.0,
      );

      expect(copia.nombre, 'Receta de Pastel');
      expect(copia.cantidad_base, 3.0);
      expect(copia.idReceta, receta.idReceta);
      expect(copia.idArticuloProducto, receta.idArticuloProducto);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final r1 = Receta(
        idReceta: 1,
        idArticuloProducto: 10,
        nombre: 'Receta de Pan',
        cantidad_base: 2.5,
      );
      final r2 = Receta(
        idReceta: 1,
        idArticuloProducto: 10,
        nombre: 'Receta de Pan',
        cantidad_base: 2.5,
      );

      expect(r1, r2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final r1 = Receta(
        idReceta: 1,
        idArticuloProducto: 10,
        nombre: 'Receta de Pan',
        cantidad_base: 2.5,
      );
      final r2 = Receta(
        idReceta: 1,
        idArticuloProducto: 10,
        nombre: 'Receta de Pan',
        cantidad_base: 2.5,
      );

      expect(r1.hashCode, r2.hashCode);
    });

    test('El modelo funciona con id nulo', () {
      final recetaNula = Receta(
        idArticuloProducto: 10,
        nombre: 'Receta sin ID',
        cantidad_base: 1.0,
      );
      final recetaNulaJson = {
        'id_receta': null,
        'id_articulo_producto': 10,
        'nombre': 'Receta sin ID',
        'cantidad_base': 1.0,
      };

      expect(recetaNula.idReceta, isNull);
      expect(recetaNula.toJson(), recetaNulaJson);
      expect(Receta.fromJson(recetaNulaJson), recetaNula);
    });

    test('fromJson lanza error si falta un campo required', () {
      final jsonIncompleto = Map<String, dynamic>.from(recetaJson)
        ..remove('nombre');

      expect(
        () => Receta.fromJson(jsonIncompleto),
        throwsA(isA<TypeError>()),
      );
    });

    test('Instancias con valores diferentes no son iguales', () {
      final diferente = receta.copyWith(nombre: 'Otra Receta');
      expect(diferente, isNot(receta));
      expect(diferente.hashCode, isNot(receta.hashCode));
    });

    test('copyWith no muta la instancia original', () {
      final original = receta;
      final modificado = receta.copyWith(cantidad_base: 10.0);
      expect(identical(original, modificado), isFalse);
      expect(original.cantidad_base, 2.5);
      expect(modificado.cantidad_base, 10.0);
    });
  });
}
