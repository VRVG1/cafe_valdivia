import 'package:cafe_valdivia/core/models/detalle_produccion_articulo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetalleProduccionArticulo', () {
    final dpi = DetalleProduccionArticulo(
      idDetalleProduccionArticulo: 1,
      idOrdenProduccion: 100,
      idArticulo: 200,
      cantidadUsada: "5.0",
      costoArticuloMomento: '15.75',
    );

    final dpiJson = {
      'id_detalle_produccion': 1,
      'id_orden_produccion': 100,
      'id_articulo': 200,
      'cantidad_usada': "5.0",
      'costo_articulo_momento': '15.75',
    };

    test('fromJson crea una instancia correcta', () {
      final fromJson = DetalleProduccionArticulo.fromJson(dpiJson);
      expect(fromJson, dpi);
    });

    test('toJson crea el mapa correcto', () {
      final toJson = dpi.toJson();
      expect(toJson, dpiJson);
    });

    test('copyWith crea una copia con valores actualizados', () {
      final dpiCopia = dpi.copyWith(costoArticuloMomento: '20.00');

      expect(dpiCopia.costoArticuloMomento, '20.00');
      // Los demás valores deben permanecer iguales
      expect(dpiCopia.idOrdenProduccion, dpi.idOrdenProduccion);
      expect(dpiCopia.idArticulo, dpi.idArticulo);
      expect(dpiCopia.cantidadUsada, dpi.cantidadUsada);
    });

    test('Las instancias con los mismos valores son iguales', () {
      final dpi1 = DetalleProduccionArticulo(
        idDetalleProduccionArticulo: 1,
        idOrdenProduccion: 100,
        idArticulo: 200,
        cantidadUsada: "5.0",
        costoArticuloMomento: '15.75',
      );
      final dpi2 = DetalleProduccionArticulo(
        idDetalleProduccionArticulo: 1,
        idOrdenProduccion: 100,
        idArticulo: 200,
        cantidadUsada: "5.0",
        costoArticuloMomento: '15.75',
      );

      expect(dpi1, dpi2);
    });

    test('El hashCode es el mismo para instancias iguales', () {
      final dpi1 = DetalleProduccionArticulo(
        idDetalleProduccionArticulo: 1,
        idOrdenProduccion: 100,
        idArticulo: 200,
        cantidadUsada: "5.0",
        costoArticuloMomento: '15.75',
      );
      final dpi2 = DetalleProduccionArticulo(
        idDetalleProduccionArticulo: 1,
        idOrdenProduccion: 100,
        idArticulo: 200,
        cantidadUsada: "5.0",
        costoArticuloMomento: '15.75',
      );

      expect(dpi1.hashCode, dpi2.hashCode);
    });
  });
}
