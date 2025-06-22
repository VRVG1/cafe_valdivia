import 'package:cafe_valdivia/models/inventario.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Inventario model Test", () {
    final inventarioObjeto = Inventario(idInsumo: 29, stock: 222);
    final inventarioMapa = {'id_insumo': 9, 'stock': 10};

    test('Id is null', () {
      expect(inventarioObjeto.id, isNull);
    });

    test("fromMap works correctly?", () {
      final objeto = Inventario.fromMap(inventarioMapa);

      expect(objeto.id, isNull);
      expect(objeto.idInsumo, 9);
      expect(objeto.stock, 10);
    });

    test('toMap works correctly?', () {
      final mapa = inventarioObjeto.toMap();

      expect(mapa['id_insumo'], 29);
      expect(mapa['stock'], 222);
    });

    test('setting id thwors error', () {
      expect(() => inventarioObjeto.id = 20, throwsUnimplementedError);
    });
  });
}
