import 'package:cafe_valdivia/Pages/agregar_cliente.dart';
import 'package:cafe_valdivia/Pages/agregar_venta.dart';
import 'package:cafe_valdivia/Pages/almacen.dart';
import 'package:cafe_valdivia/Pages/cliente_lista.dart';
import 'package:cafe_valdivia/Pages/lista.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.colorScheme});

  final ColorScheme colorScheme;
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

  final GlobalKey<ClientelistaState> clienteListKey = GlobalKey();

  addButton() => {
    if (currentPageIndex == 1)
      {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [const AgregarVenta()],
              ),
            );
          },
        ),
      }
    else if (currentPageIndex == 2)
      {
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
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(curvedAnimation),
              child: child,
            );
          },
        ),
      }
    else
      {print("Almacen")},
  };

  // Botones del NavigationBar
  static const List<Widget> _widgetOpt = <Widget>[
    NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: "Home",
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.list_alt_outlined),
      icon: Icon(Icons.list),
      label: "Ventas",
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.account_circle),
      icon: Icon(Icons.account_circle_outlined),
      label: "Clientes",
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.warehouse),
      icon: Icon(Icons.warehouse_outlined),
      label: "Almacen",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      floatingActionButton:
          currentPageIndex != 0
              ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => addButton(),
              )
              : null,
      appBar: AppBar(
        title: const Text("Cafe Valdivia"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: widget.colorScheme.primary,
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: _widgetOpt,
      ),
      body:
          <Widget>[
            Card(
              shadowColor: Colors.transparent,
              margin: const EdgeInsets.all(8.0),
              child: SizedBox.expand(
                child: Center(
                  child: Text('Home page', style: theme.textTheme.titleLarge),
                ),
              ),
            ),
            Lista(),
            Clientelista(key: clienteListKey),
            Almacen(),
          ][currentPageIndex],
    );
  }
}
