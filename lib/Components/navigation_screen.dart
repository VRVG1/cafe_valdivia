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
    Widget? addButton() {
      switch (currentPageIndex) {
        case 1:
          return FloatingActionButton(
            tooltip: "Agregar Compra",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarCompraPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        case 2:
          return FloatingActionButton(
            tooltip: "Agregar Cliente",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Agregarcliente(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        case 3:
          return FloatingActionButton(
            tooltip: "Agregar Proveedor",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProveedorAgregar(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        case 4:
          return FloatingActionButton(
            tooltip: "Agregar Articulo",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarArticuloPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        case 5:
          return FloatingActionButton(
            tooltip: "Agregar Producto",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductoAgregarPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        case 6:
          return FloatingActionButton(
            tooltip: "Agregar Receta",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarRecetaPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        case 7:
          return FloatingActionButton(
            tooltip: "Agregar Venta",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarVentaPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        case 8:
          return FloatingActionButton(
            tooltip: "Agregar Produccion",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AgregarOrdenProduccionPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_rounded),
          );
        default:
          return null;
      }
    }

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

    final List<Widget> destinos = [
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
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            tooltip: "Opciones",
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
