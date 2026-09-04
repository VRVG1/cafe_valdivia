import 'package:cafe_valdivia/Pages/Options/options_list.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:cafe_valdivia/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Drawer lateral compartido por todas las secciones del panel principal.
///
/// Antes este menú vivía únicamente en `NavigationScreen`. Al agregar el
/// drawer a cada página de listado (Compras, Clientes, etc.) se extrajo aquí
/// para reutilizarlo y mantener la navegación centralizada a través de
/// [navigationProvider].
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  /// Destinos del menú. El orden debe coincidir con el índice de
  /// [navigationProvider] y con la lista `pages` de `NavigationScreen`.
  static const List<NavigationDrawerDestination> _destinos = [
    NavigationDrawerDestination(
      icon: Icon(Icons.home_rounded),
      label: Text("Home"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.add_shopping_cart_rounded),
      label: Text("Compras"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.account_circle_rounded),
      label: Text("Clientes"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.local_shipping_rounded),
      label: Text("Proveedor"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.trolley),
      label: Text("Articulo"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.coffee_rounded),
      label: Text("Producto"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.receipt_rounded),
      label: Text("Recetas"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.point_of_sale_rounded),
      label: Text("Ventas"),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.precision_manufacturing_rounded),
      label: Text("Prod. Órdenes"),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationProvider);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: NavigationDrawer(
              selectedIndex: selectedIndex,
              onDestinationSelected: (int index) {
                ref.read(navigationProvider.notifier).goTo(index);
                ref.invalidate(filtroBusquedaProvider);
                Navigator.pop(context);
              },
              children: _destinos,
            ),
          ),
        ],
      ),
    );
  }
}

/// Botón de opciones (tres puntos) que abre el listado de configuración.
///
/// Extraído para compartir el mismo menú tanto en la AppBar del Home como en
/// las AppBars de búsqueda de cada sección.
class OptionsMenuButton extends StatelessWidget {
  const OptionsMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert_rounded),
      tooltip: "Opciones",
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OptionsList(),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
