import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/models/detalle_compra_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleCompra', () {
    final detalleCompra = DetalleCompra(
      id: 1,
      idCompra: 10,
      idInsumo: 20,
      cantidad: 5,
      precioUnitarioCompra: '10.50',
    );

    final detalleCompraJson = {
      'id': 1,
      'idCompra': 10,
      'idInsumo': 20,
      'cantidad': 5,
      'precioUnitarioCompra': '10.50',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = DetalleCompra.fromJson(detalleCompraJson);
      expect(fromJson, detalleCompra);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = detalleCompra.toJson();
      expect(toJson, detalleCompraJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final copia = detalleCompra.copyWith(cantidad: 8);

      expect(copia.cantidad, 8);
      // Los demás valores deben permanecer iguales
      expect(copia.id, detalleCompra.id);
      expect(copia.idCompra, detalleCompra.idCompra);
      expect(copia.idInsumo, detalleCompra.idInsumo);
      expect(copia.precioUnitarioCompra, detalleCompra.precioUnitarioCompra);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final dc1 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idInsumo: 20,
        cantidad: 5,
        precioUnitarioCompra: '10.50',
      );
      final dc2 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idInsumo: 20,
        cantidad: 5,
        precioUnitarioCompra: '10.50',
      );

      expect(dc1, dc2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final dc1 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idInsumo: 20,
        cantidad: 5,
        precioUnitarioCompra: '10.50',
      );
      final dc2 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idInsumo: 20,
        cantidad: 5,
        precioUnitarioCompra: '10.50',
      );

      expect(dc1.hashCode, dc2.hashCode);
    });

    group('Extension', () {
      test('subTotal calcula el valor correcto en centavos', () {
        // 5 * 10.50 = 52.50 -> 5250 centavos
        expect(detalleCompra.subTotal, 5250);
      });

      test('subTotalFormateado retorna el string correcto', () {
        expect(detalleCompra.subTotalFormateado, '52.50');
      });

      test('subTotal con precio inválido retorna 0', () {
        final detalleInvalido = detalleCompra.copyWith(precioUnitarioCompra: 'invalido');
        expect(detalleInvalido.subTotal, 0);
        expect(detalleInvalido.subTotalFormateado, '0.00');
      });
    });
  });
}