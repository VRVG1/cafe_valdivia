import 'package:cafe_valdivia/Components/card_almacen.dart';
import 'package:cafe_valdivia/Pages/Clientes/agregar_cliente.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_lista.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_page.dart';
import 'package:cafe_valdivia/Pages/Compras/compra_list_page.dart';
import 'package:cafe_valdivia/Pages/Venta/agregar_venta_page.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_lista_page.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/agregar_orden_produccion_page.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/orden_produccion_lista_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/agregar_articulo_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/articulo_lista_page.dart';
import 'package:cafe_valdivia/Pages/Options/options_list.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_agregar_page.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_lista_page.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_agregar.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_lista.dart';
import 'package:cafe_valdivia/Pages/Receta/receta_agregar_page.dart';
import 'package:cafe_valdivia/Pages/Receta/receta_lista_page.dart';
import 'package:cafe_valdivia/Debug/debug_panel.dart';
import 'package:cafe_valdivia/Debug/debug_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.colorScheme});

  final ColorScheme colorScheme;
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Widget? addButton() {
      switch (currentPageIndex) {
        case 1:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarCompraPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        case 2:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Agregarcliente(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        case 3:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProveedorAgregar(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        case 4:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarArticuloPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        case 5:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductoAgregarPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        case 6:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarRecetaPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        case 7:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarVentaPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        case 8:
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarOrdenProduccionPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        default:
          return null;
      }
    }

    final List<Widget> pages = [
      // Card(
      //   shadowColor: Colors.transparent,
      //   margin: const EdgeInsets.all(8.0),
      //   child: SizedBox.expand(
      //     child: Center(
      //       child: Text('Home page', style: theme.textTheme.titleLarge),
      //     ),
      //   ),
      // ),
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

    final List<Widget> destinos = [
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: Text("Home"),
      ),
      NavigationDrawerDestination(
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Compras"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.account_circle),
        icon: Icon(Icons.account_circle_outlined),
        label: Text("Clientes"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.local_shipping_rounded),
        icon: Icon(Icons.local_shipping_outlined),
        label: Text("Proveedor"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.trolley),
        icon: Icon(Icons.trolley),
        label: Text("Articulo"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.coffee_rounded),
        icon: Icon(Icons.coffee_outlined),
        label: Text("Producto"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.receipt_rounded),
        icon: Icon(Icons.receipt_outlined),
        label: Text("Recetas"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.point_of_sale),
        icon: Icon(Icons.point_of_sale_outlined),
        label: Text("Ventas"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.precision_manufacturing_rounded),
        icon: Icon(Icons.precision_manufacturing_outlined),
        label: Text("Prod. Órdenes"),
      ),
    ];

    void openOptions() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OptionsList(),
          fullscreenDialog: true,
        ),
      );
    }

    return Scaffold(
      floatingActionButton: addButton(),
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: () {
            ProviderScope.containerOf(context)
                .read(debugStateProvider.notifier)
                .toggle();
          },
          child: const Text("Cafe Valdivia"),
        ),
        centerTitle: true,
        actions: <Widget>[
          if (ProviderScope.containerOf(context)
              .read(debugStateProvider)
              .enabled)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => const DebugPanel(),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              openOptions();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(28, 16, 16, 10),
                child: Text("Menu Principal"),
              ),
              Expanded(
                child: NavigationDrawer(
                  selectedIndex: currentPageIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                    Navigator.pop(context);
                  },
                  children: destinos,
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[currentPageIndex],
    );
  }
}
