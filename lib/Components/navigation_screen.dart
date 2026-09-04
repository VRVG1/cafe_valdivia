import 'package:cafe_valdivia/Components/app_navigation.dart';
import 'package:cafe_valdivia/Components/card_almacen.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_lista.dart';
import 'package:cafe_valdivia/Pages/Compras/compra_list_page.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_lista_page.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/orden_produccion_lista_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/articulo_lista_page.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_lista_page.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_lista.dart';
import 'package:cafe_valdivia/Pages/Receta/receta_lista_page.dart';
import 'package:cafe_valdivia/Debug/debug_panel.dart';
import 'package:cafe_valdivia/Debug/debug_state.dart';
import 'package:cafe_valdivia/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({super.key, required this.colorScheme});

  final ColorScheme colorScheme;
  @override
  ConsumerState<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  // Cada índice de esta lista se corresponde con un destino de [AppDrawer]
  // y con el valor de [navigationProvider].
  final List<Widget> pages = [
    Cardalmacen(titulo: "Pene", cuerpo: "Sexo"),
    CompraListPage(),
    Clientelista(),
    ProveedorLista(),
    InsumoListaPage(),
    ProductoListaPage(),
    RecetaListaPage(),
    VentaListaPage(),
    OrdenProduccionListaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = ref.watch(navigationProvider);

    return Scaffold(
      // La AppBar con el título "Cafe Valdivia" solo se muestra en el Home.
      // El resto de secciones usan su propia AppBar de búsqueda (AppbarChips),
      // que ya incorporan el drawer y el menú de opciones.
      appBar: currentPageIndex == 0
          ? AppBar(
              title: GestureDetector(
                onLongPress: () {
                  ProviderScope.containerOf(
                    context,
                  ).read(debugStateProvider.notifier).toggle();
                },
                child: const Text("Cafe Valdivia"),
              ),
              centerTitle: true,
              actions: <Widget>[
                if (ProviderScope.containerOf(
                  context,
                ).read(debugStateProvider).enabled)
                  IconButton(
                    tooltip: "Abrir panel de depuración",
                    icon: const Icon(Icons.bug_report_rounded),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (_) => const DebugPanel(),
                      );
                    },
                  ),
                const OptionsMenuButton(),
              ],
            )
          : null,
      drawer: const AppDrawer(),
      body: pages[currentPageIndex],
    );
  }
}
