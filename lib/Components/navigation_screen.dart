import 'package:cafe_valdivia/Pages/Clientes/agregar_cliente.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_lista.dart';
import 'package:cafe_valdivia/Pages/Insumos/inusmo_lista_page.dart';
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

  void addButton() {
    if (currentPageIndex == 1) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return const Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Agregarcliente()],
            ),
          );
        },
      );
    } else if (currentPageIndex == 2) {
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secodaryAnimation,
        ) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Agregarcliente()],
            ),
          );
        },
        transitionBuilder: (context, a1, a2, child) {
          final curvedAnimation = CurvedAnimation(
            parent: a1,
            curve: Curves.easeOutBack,
          );
          return ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          );
        },
      );
    } else {
      print("Almacen");
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
        selectedIcon: Icon(Icons.account_circle),
        icon: Icon(Icons.account_circle_outlined),
        label: Text("Proveedor"),
      ),
      NavigationDrawerDestination(
        selectedIcon: Icon(Icons.account_circle),
        icon: Icon(Icons.account_circle_outlined),
        label: Text("Insumos"),
      ),
    ];
    return Scaffold(
      floatingActionButton:
          currentPageIndex != 0
              ? FloatingActionButton(
                onPressed: addButton,
                child: const Icon(Icons.add),
              )
              : null,
      appBar: AppBar(
        title: const Text("Cafe Valdivia"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
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

