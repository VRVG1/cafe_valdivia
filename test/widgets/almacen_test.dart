import 'package:cafe_valdivia/Pages/Home/almacen.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/theme/stock_nivel.dart';
import 'package:cafe_valdivia/providers/providers.dart';

import 'fake_articulo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Articulo _articulo(String nombre, double stock) => Articulo(
      nombre: nombre,
      tipo: ArticuloTipo.producto,
      idUnidad: 1,
      costoUnitario: 10,
      precioVenta: 20,
      stock: stock,
    );

void main() {
  testWidgets('la tabla del almacen muestra solo las familias de cafe',
      (WidgetTester tester) async {
    final articulos = [
      _articulo('Cafe molido medio', 0),
      _articulo('Cafe molido oscuro', 15.342),
      _articulo('Cafe verde calidad buena', 1293),
      _articulo('Cafe verde calidad premium', 1262),
      _articulo('Cafe verde Calidad Basura', 481),
      _articulo('Cafe pergamino', 0),
      _articulo('Cafe bola pinto', 0),
      _articulo('Cafe tostado medio', 0),
      _articulo('cafe tostado oscuro', 0),
      // No deben aparecer:
      _articulo('Bolita', 1850),
      _articulo('Bolsas', 1717),
      _articulo('Cafe cereza', 3739),
      _articulo('Cordoba', 40681),
      _articulo('Salario', 132),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          articulosRepositoryProvider.overrideWithValue(
            FakeArticuloRepository(articulos),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Almacen(),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Las familias pedidas si aparecen.
    expect(find.text('Cafe molido medio'), findsOneWidget);
    expect(find.text('Cafe molido oscuro'), findsOneWidget);
    expect(find.text('Cafe verde calidad buena'), findsOneWidget);
    expect(find.text('Cafe verde calidad premium'), findsOneWidget);
    expect(find.text('Cafe verde Calidad Basura'), findsOneWidget);
    expect(find.text('Cafe pergamino'), findsOneWidget);
    expect(find.text('Cafe bola pinto'), findsOneWidget);
    expect(find.text('Cafe tostado medio'), findsOneWidget);
    expect(find.text('cafe tostado oscuro'), findsOneWidget);

    // Las demas familias no aparecen.
    expect(find.text('Bolita'), findsNothing);
    expect(find.text('Bolsas'), findsNothing);
    expect(find.text('Cafe cereza'), findsNothing);
    expect(find.text('Cordoba'), findsNothing);
    expect(find.text('Salario'), findsNothing);
  });

  testWidgets('el porcentaje se calcula contra el maximo de cada familia',
      (WidgetTester tester) async {
    final articulos = [
      _articulo('Cafe verde calidad buena', 1000), // 100% de la familia
      _articulo('Cafe verde calidad premium', 300), // 30% -> advertencia
      _articulo('Cafe verde Calidad Basura', 100), // 10% -> critico
      _articulo('Cafe molido oscuro', 500), // 100% de otra familia
      _articulo('Cafe molido medio', 0), // sin stock
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          articulosRepositoryProvider.overrideWithValue(
            FakeArticuloRepository(articulos),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Almacen(),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // "Cafe verde calidad buena" y "Cafe molido oscuro" son el maximo de su
    // familia, por lo que los dos quedan al 100%.
    expect(find.text('100% · Stock normal'), findsNWidgets(2));
    expect(find.text('30% · Poco stock'), findsOneWidget);
    expect(find.text('10% · Stock crítico'), findsOneWidget);
    expect(find.text('0% · Sin stock'), findsOneWidget);
  });

  testWidgets('los articulos sin stock van primero', (WidgetTester tester) async {
    final articulos = [
      _articulo('Cafe verde calidad buena', 1000),
      _articulo('Cafe verde Calidad Basura', 100),
      _articulo('Cafe molido medio', 0),
      _articulo('Cafe tostado medio', 0),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          articulosRepositoryProvider.overrideWithValue(
            FakeArticuloRepository(articulos),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Almacen(),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Los dos sin stock (0%) deben estar antes que el de 10%.
    final yPosSinStock1 = tester.getTopLeft(find.text('Cafe molido medio')).dy;
    final yPosSinStock2 =
        tester.getTopLeft(find.text('Cafe tostado medio')).dy;
    final yPosCritico =
        tester.getTopLeft(find.text('Cafe verde Calidad Basura')).dy;

    expect(yPosSinStock1, lessThan(yPosCritico));
    expect(yPosSinStock2, lessThan(yPosCritico));
  });

  test('los niveles de stock se clasifican bien', () {
    expect(NivelStock.normal.requiereAviso, isFalse);
    expect(NivelStock.advertencia.requiereAviso, isTrue);
    expect(NivelStock.critico.requiereAviso, isTrue);
    expect(NivelStock.sinStock.requiereAviso, isTrue);
  });
}
