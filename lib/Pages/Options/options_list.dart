import 'package:cafe_valdivia/Pages/Options/unidad_medida_lista.dart';
import 'package:flutter/material.dart';

class OptionsList extends StatefulWidget {
  const OptionsList({super.key});

  @override
  OptionsListState createState() => OptionsListState();
}

class OptionsListState extends State<OptionsList> {
  @override
  Widget build(BuildContext context) {
    final BorderRadius all = BorderRadius.circular(14.0);
    final BorderRadius middle = BorderRadius.circular(4.0);
    final BorderRadius top = BorderRadius.only(
      topLeft: Radius.circular(14.0),
      topRight: Radius.circular(14.0),
    );
    final BorderRadius buttom = BorderRadius.only(
      bottomLeft: Radius.circular(14.0),
      bottomRight: Radius.circular(14.0),
    );
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Configuracion"))),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        physics: const ClampingScrollPhysics(),
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 1),
            elevation: 0,
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: all),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              tileColor: theme.colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.scale_rounded),
              title: Text('Unidad de Medida'),
              subtitle: Text("Tipos de medidas en los productos"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UnidadMedidaLista(),
                  ),
                );
              },
            ),
          ),
        ],

        //  itemBuilder: (BuildContext context, int index) {
        //    // elemento
        //    final bool isFirst = index == 0;
        //    final bool isLast = index == 9;
      ),
    );
  }
}
