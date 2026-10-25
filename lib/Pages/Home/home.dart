import 'package:cafe_valdivia/Pages/Compras/agregar_compra_page.dart';
import 'package:cafe_valdivia/Pages/Home/almacen.dart';
import 'package:cafe_valdivia/Pages/Home/listHome.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/agregar_orden_produccion_page.dart';
import 'package:cafe_valdivia/Pages/Venta/agregar_venta_page.dart';
import 'package:flutter/material.dart';
import 'package:material_3_expressive/material_3_expressive.dart';
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
    return Scaffold(
      floatingActionButton: M3EFabMenu(
        expandIcon: const Icon(M3EIcons.add),
        collapseIcon: const Icon(M3EIcons.close),
        size: M3EFabSize.regular,
        color: M3EFabColor.primaryFilled,
        items: [
          M3EFabMenuItem(
            icon: Icon(Icons.precision_manufacturing_rounded),
            label: "Orden",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AgregarOrdenProduccionPage(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          M3EFabMenuItem(
            icon: Icon(Icons.point_of_sale_rounded),
            label: "Compras",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AgregarCompraPage(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          M3EFabMenuItem(
            icon: Icon(Icons.add_shopping_cart_rounded),
            label: "Ventas",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AgregarVentaPage(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18),
        children: const [Listhome(), SizedBox(height: 24), Almacen()],
      ),
    );
  }
}
