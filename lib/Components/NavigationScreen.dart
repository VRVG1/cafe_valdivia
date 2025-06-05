import 'package:cafe_valdivia/Pages/almacen.dart';
import 'package:cafe_valdivia/Pages/clienteLista.dart';
import 'package:cafe_valdivia/Pages/home.dart';
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
                onPressed: () => {},
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
            Clientelista(),
            Almacen(),
          ][currentPageIndex],
    );
  }
}
