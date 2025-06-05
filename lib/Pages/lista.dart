import 'package:cafe_valdivia/Pages/ventaDetallada.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor:
                index % 2 == 0
                    ? theme.colorScheme.tertiaryContainer
                    : theme.colorScheme.errorContainer,
            child: Text(
              "V",
              style: TextStyle(
                color:
                    index % 2 == 0
                        ? theme.colorScheme.onTertiaryContainer
                        : theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          title: Text("14/06/2000"),
          subtitle: Text("Cafe vendido a la frontera de Tapalpa"),
          trailing: Text(
            "5"
            "KG",
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ventadetallada()),
            );
          },
        );
      },
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Route")),
      body: const Center(child: Text("Contenido de la segunda ruta")),
    );
  }
}
