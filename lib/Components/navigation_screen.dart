import 'package:cafe_valdivia/Pages/Clientes/agregar_cliente.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_lista.dart';
import 'package:cafe_valdivia/Pages/Insumo/agregar_insumos_page.dart';
import 'package:cafe_valdivia/Pages/Insumo/inusmo_lista_page.dart';
import 'package:cafe_valdivia/Pages/Options/options_list.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_agregar_page.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_lista_page.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_agregar.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_lista.dart';
import 'package:flutter/material.dart';

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
                  builder: (context) => Agregarcliente(),
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
                  builder: (context) => ProveedorAgregar(),
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
                  builder: (context) => AgregarInsumoPage(),
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
                  builder: (context) => ProductoAgregarPage(),
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
      Card(
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(
            child: Text('Home page', style: theme.textTheme.titleLarge),
          ),
        ),
      ),

      Clientelista(),
      ProveedorLista(),
      InusmoListaPage(),
      ProductoListaPage(),
    ];

    final List<Widget> destinos = [
      Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Text('Menú Principal'),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: Text("Home"),
      ),
      // NavigationDrawerDestination(
      //   selectedIcon: Icon(Icons.list_alt_outlined),
      //   icon: Icon(Icons.list),
      //   label: Text("Ventas"),
      // ),
      // NavigationDrawerDestination(
      //   selectedIcon: Icon(Icons.warehouse),
      //   icon: Icon(Icons.warehouse_outlined),
      //   label: Text("Almacen"),
      // ),
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
        label: Text("Insumo"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.coffee_rounded),
        icon: Icon(Icons.coffee_outlined),
        label: Text("Producto"),
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
        title: const Text("Cafe Valdivia"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              openOptions();
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          Navigator.pop(context);
        },
        children: destinos,
      ),
      body: pages[currentPageIndex],
    );
  }
}
