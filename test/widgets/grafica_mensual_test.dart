import 'package:cafe_valdivia/Pages/Home/grafica_mensual.dart';
import 'package:cafe_valdivia/providers/Movimiento/movimiento_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('la grafica mensual renderiza las barras de ventas y compras',
      (WidgetTester tester) async {
    final datos = <Map<String, dynamic>>[
      {
        'periodo': '2026-08',
        'anio': 2026,
        'mes': 8,
        'nombre_mes': 'Ago',
        'num_ventas': 55,
        'total_ventas': 51720.0,
        'num_compras': 6,
        'total_compras': 15790.32,
      },
      {
        'periodo': '2026-09',
        'anio': 2026,
        'mes': 9,
        'nombre_mes': 'Sep',
        'num_ventas': 40,
        'total_ventas': 54610.0,
        'num_compras': 9,
        'total_compras': 12527.30,
      },
      {
        'periodo': '2026-10',
        'anio': 2026,
        'mes': 10,
        'nombre_mes': 'Oct',
        'num_ventas': 43,
        'total_ventas': 39225.0,
        'num_compras': 1,
        'total_compras': 9876.0,
      },
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          movimientoMensualProvider(3)
              .overrideWith((ref) async => datos),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: GraficaMensual(meses: 3),
            ),
          ),
        ),
      ),
    );

    // pump en pasos: el provider es async y la grafica tiene animacion.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Ventas y compras por mes'), findsOneWidget);
    expect(find.text('Ventas'), findsOneWidget);
    expect(find.text('Compras'), findsOneWidget);
    expect(find.text('Ago'), findsOneWidget);
    expect(find.text('Sep'), findsOneWidget);
    expect(find.text('Oct'), findsOneWidget);
  });
}
