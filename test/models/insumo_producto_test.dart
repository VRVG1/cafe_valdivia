import 'package:cafe_valdivia/models/insumo_producto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InsumoProducto', () {
    final insumoProducto = InsumoProducto(
      id: 1,
      idInsumo: 10,
      idProducto: 20,
      nombre: 'Azúcar',
      cantidadRequerida: 0.5,
    );

    final insumoProductoJson = {
      'id': 1,
      'idInsumo': 10,
      'idProducto': 20,
      'nombre': 'Azúcar',
      'cantidadRequerida': 0.5,
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = InsumoProducto.fromJson(insumoProductoJson);
      expect(fromJson, insumoProducto);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = insumoProducto.toJson();
      expect(toJson, insumoProductoJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = insumoProducto.copyWith(cantidadRequerida: 1.0);

      expect(copia.cantidadRequerida, 1.0);
      // Los demás valores deben permanecer iguales
      expect(copia.id, insumoProducto.id);
      expect(copia.idInsumo, insumoProducto.idInsumo);
      expect(copia.idProducto, insumoProducto.idProducto);
      expect(copia.nombre, insumoProducto.nombre);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final ip1 = InsumoProducto(
        id: 1,
        idInsumo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );
      final ip2 = InsumoProducto(
        id: 1,
        idInsumo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );

      expect(ip1, ip2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final ip1 = InsumoProducto(
        id: 1,
        idInsumo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );
      final ip2 = InsumoProducto(
        id: 1,
        idInsumo: 10,
        idProducto: 20,
        nombre: 'Azúcar',
        cantidadRequerida: 0.5,
      );

      expect(ip1.hashCode, ip2.hashCode);
    });
  });
}