import 'package:cafe_valdivia/Pages/clienteDetallado.dart';
import 'package:flutter/material.dart';

class Clientelista extends StatelessWidget {
  const Clientelista({super.key}) : super();

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
              "R",
              style: TextStyle(
                color:
                    index % 2 == 0
                        ? theme.colorScheme.onTertiaryContainer
                        : theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          title: Text("Rafael Valdivia"),
          subtitle: Text("No se que poner"),
          trailing: Text(
            "5"
            "KG",
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClienteDetallado()),
            );
          },
        );
      },
    );
  }
}
