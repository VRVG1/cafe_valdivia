import "package:cafe_valdivia/models/insumo_producto.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Teste de insumo_producto", () {
    test("El metodo toMap() regresa un mapa valido", () {
      final insumoProducto = InsumoProducto(
        idInsumoProducto: 1,
        idInsumo: 2,
        idProducto: 3,
        cantidadRequerida: 4.5,
      );

      final map = insumoProducto.toMap();

      expect(map['id_insumo_producto'], 1);
      expect(map['id_insumo'], 2);
      expect(map['id_producto'], 3);
      expect(map['cantidad_requerida'], 4.5);
    });

    test("El metodo fromMap() crea un objeto valido", () {
      final map = {
        'id_insumo_producto': 1,
        'id_insumo': 2,
        'id_producto': 3,
        'cantidad_requerida': 4.5,
      };

      final insumoProducto = InsumoProducto.fromMap(map);

      expect(insumoProducto.idInsumoProducto, 1);
      expect(insumoProducto.idInsumo, 2);
      expect(insumoProducto.idProducto, 3);
      expect(insumoProducto.cantidadRequerida, 4.5);
    });
  });
}
