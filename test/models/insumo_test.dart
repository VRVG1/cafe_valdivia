import 'package:cafe_valdivia/models/insumo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Insumo', () {
    final insumo = Insumo(
      id: 1,
      nombre: 'Café en grano',
      descripcion: 'Grano de café de altura',
      idUnidad: 1,
      costoUnitario: '25.50',
    );

    final insumoJson = {
      'id': 1,
      'nombre': 'Café en grano',
      'descripcion': 'Grano de café de altura',
      'idUnidad': 1,
      'costoUnitario': '25.50',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = Insumo.fromJson(insumoJson);
      expect(fromJson, insumo);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = insumo.toJson();
      expect(toJson, insumoJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = insumo.copyWith(costoUnitario: '28.00');

      expect(copia.costoUnitario, '28.00');
      // Los demás valores deben permanecer iguales
      expect(copia.id, insumo.id);
      expect(copia.nombre, insumo.nombre);
      expect(copia.descripcion, insumo.descripcion);
      expect(copia.idUnidad, insumo.idUnidad);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final i1 = Insumo(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: '25.50',
      );
      final i2 = Insumo(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: '25.50',
      );

      expect(i1, i2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final i1 = Insumo(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: '25.50',
      );
      final i2 = Insumo(
        id: 1,
        nombre: 'Café en grano',
        descripcion: 'Grano de café de altura',
        idUnidad: 1,
        costoUnitario: '25.50',
      );

      expect(i1.hashCode, i2.hashCode);
    });
  });
}