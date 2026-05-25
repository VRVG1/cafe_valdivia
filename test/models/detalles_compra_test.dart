import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleCompra', () {
    final detalleCompra = DetalleCompra(
      id: 1,
      idCompra: 10,
      idArticulo: 20,
      cantidad: 5.0,
      precioUnitarioCompra: 10.50,
    );

    final detalleCompraJson = {
      'id_detalle_compra': 1,
      'id_compra': 10,
      'id_articulo': 20,
      'cantidad': 5.0,
      'precio_unitario_compra': 10.50,
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
      final copia = detalleCompra.copyWith(cantidad: 8.0);

      expect(copia.cantidad, 8.0);

      expect(copia.id, detalleCompra.id);
      expect(copia.idCompra, detalleCompra.idCompra);
      expect(copia.idArticulo, detalleCompra.idArticulo);
      expect(copia.precioUnitarioCompra, detalleCompra.precioUnitarioCompra);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final dc1 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idArticulo: 20,
        cantidad: 5.0,
        precioUnitarioCompra: 10.50,
      );
      final dc2 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idArticulo: 20,
        cantidad: 5.0,
        precioUnitarioCompra: 10.50,
      );

      expect(dc1, dc2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final dc1 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idArticulo: 20,
        cantidad: 5.0,
        precioUnitarioCompra: 10.50,
      );
      final dc2 = DetalleCompra(
        id: 1,
        idCompra: 10,
        idArticulo: 20,
        cantidad: 5.0,
        precioUnitarioCompra: 10.50,
      );

      expect(dc1.hashCode, dc2.hashCode);
    });

    group('Extension', () {
      test('subTotal calcula el valor correcto en centavos', () {
        expect(detalleCompra.subTotal, 52.50);
      });

      test('subTotalFormateado retorna el string correcto', () {
        expect(detalleCompra.subTotalFormateado, '52.50');
      });

    });
  });
}
