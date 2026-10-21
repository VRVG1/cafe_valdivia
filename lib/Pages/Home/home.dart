import 'package:cafe_valdivia/Pages/Home/almacen.dart';
import 'package:cafe_valdivia/Pages/Home/listHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Pantalla principal del panel.
///
/// Muestra el resumen general de la aplicación (cartas de Ventas, Compras,
/// Órdenes y Artículos) y, debajo, la tabla de artículos seleccionados del
/// almacén.
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 18),
      children: const [Listhome(), SizedBox(height: 24), Almacen()],
    );
  }
}
