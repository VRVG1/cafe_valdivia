import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';

void main() {
  group('Articulo', () {

    final articuloJson = <String, dynamic>{
      'id_articulo': 1,
      'nombre': 'Harina de trigo',
      'descripcion': 'Harina refinada 1kg',
      'tipo': 'INSUMO',
      'id_unidad': 2,
      'costo_unitario': 12.50,
      'precio_venta': 18.00,
      'stock': 150.0,
    };

    final articulo = Articulo(
      idArticulo: 1,
      nombre: 'Harina de trigo',
      descripcion: 'Harina refinada 1kg',
      tipo: ArticuloTipo.insumo,
      idUnidad: 2,
      costoUnitario: 12.50,
      precioVenta: 18.00,
      stock: 150.0,
    );


    test('debe crearse correctamente con todos los campos', () {
      expect(articulo.idArticulo, 1);
      expect(articulo.nombre, 'Harina de trigo');
      expect(articulo.descripcion, 'Harina refinada 1kg');
      expect(articulo.tipo, ArticuloTipo.insumo);
      expect(articulo.idUnidad, 2);
      expect(articulo.costoUnitario, 12.50);
      expect(articulo.precioVenta, 18.00);
      expect(articulo.stock, 150.0);
    });

    test('debe permitir descripcion nula', () {
      const articuloSinDesc = Articulo(
        nombre: 'Azúcar',
        tipo: ArticuloTipo.insumo,
        idUnidad: 1,
        costoUnitario: 10.0,
        precioVenta: 15.0,
        stock: 0.0,
      );
      expect(articuloSinDesc.descripcion, isNull);
    });


    test('debe deserializarse correctamente desde JSON', () {
      final result = Articulo.fromJson(articuloJson);

      expect(result, articulo);
    });

    test('debe deserializar sin id_articulo (nullable)', () {
      final jsonSinId = Map<String, dynamic>.from(articuloJson)
        ..remove('id_articulo');

      final result = Articulo.fromJson(jsonSinId);

      expect(result.idArticulo, isNull);
      expect(result.nombre, 'Harina de trigo');
    });

    test('debe deserializar sin descripcion (nullable)', () {
      final jsonSinDesc = Map<String, dynamic>.from(articuloJson)
        ..remove('descripcion');

      final result = Articulo.fromJson(jsonSinDesc);

      expect(result.descripcion, isNull);
    });

    test('debe lanzar error si falta un campo required', () {
      final jsonIncompleto = Map<String, dynamic>.from(articuloJson)
        ..remove('nombre');

      expect(
        () => Articulo.fromJson(jsonIncompleto),
        throwsA(isA<TypeError>()),
      );
    });


    test('debe serializarse correctamente a JSON', () {
      final json = articulo.toJson();

      expect(json['id_articulo'], 1);
      expect(json['nombre'], 'Harina de trigo');
      expect(json['tipo'], 'INSUMO');
      expect(json['id_unidad'], 2);
      expect(json['costo_unitario'], 12.50);
      expect(json['precio_venta'], 18.00);
      expect(json['stock'], 150.0);
    });

    test('debe crear claves nulas en JSON (comportamiento por defecto)', () {
      const articuloSinId = Articulo(
        nombre: 'Sal',
        tipo: ArticuloTipo.insumo,
        idUnidad: 1,
        costoUnitario: 5.0,
        precioVenta: 8.0,
        stock: 20.0,
      );

      final json = articuloSinId.toJson();

      expect(json.containsKey('id_articulo'), isTrue);
      expect(json.containsKey('descripcion'), isTrue);
    });


    test('dos instancias con mismos valores deben ser iguales', () {
      final otro = Articulo.fromJson(articuloJson);
      expect(articulo, otro);
      expect(articulo.hashCode, otro.hashCode);
    });

    test('instancias con valores distintos no deben ser iguales', () {
      final distinto = articulo.copyWith(nombre: 'Otro nombre');
      expect(articulo, isNot(distinto));
    });


    test('copyWith debe crear una copia modificada sin mutar el original', () {
      final modificado = articulo.copyWith(
        nombre: 'Harina integral',
        stock: 200.0,
      );

      expect(modificado.nombre, 'Harina integral');
      expect(modificado.stock, 200.0);


      expect(articulo.nombre, 'Harina de trigo');
      expect(articulo.stock, 150.0);
    });

    test(
      'copyWith con valores nulos debe respetar el null (para campos nullable)',
      () {
        final conDesc = articulo.copyWith(descripcion: 'Con descripción');
        final sinDesc = conDesc.copyWith(descripcion: null);

        expect(sinDesc.descripcion, isNull);
      },
    );


    group('ArticuloTipo', () {
      test('debe tener los 3 valores correctos', () {
        expect(ArticuloTipo.values.length, 3);
        expect(ArticuloTipo.insumo.value, 'INSUMO');
        expect(ArticuloTipo.producto.value, 'PRODUCTO');
        expect(ArticuloTipo.productoIntermedio.value, 'PRODUCTO_INTERMEDIO');
      });

      test('fromValue debe devolver el enum correcto', () {
        expect(ArticuloTipo.fromValue('INSUMO'), ArticuloTipo.insumo);
        expect(ArticuloTipo.fromValue('PRODUCTO'), ArticuloTipo.producto);
        expect(
          ArticuloTipo.fromValue('PRODUCTO_INTERMEDIO'),
          ArticuloTipo.productoIntermedio,
        );
      });

      test('fromValue debe lanzar ArgumentError con valor desconocido', () {
        expect(
          () => ArticuloTipo.fromValue('DESCONOCIDO'),
          throwsA(
            isA<ArgumentError>().having(
              (e) => e.message,
              'message',
              contains('DESCONOCIDO'),
            ),
          ),
        );
      });

      test('debe deserializar cada tipo de artículo correctamente', () {
        for (final tipo in ArticuloTipo.values) {
          final json = Map<String, dynamic>.from(articuloJson)
            ..['tipo'] = tipo.value;

          final result = Articulo.fromJson(json);
          expect(result.tipo, tipo, reason: 'Falló para ${tipo.value}');
        }
      });
    });
  });
}
