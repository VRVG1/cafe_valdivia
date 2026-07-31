import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Options/eliminar_base_datos.dart';
import 'package:cafe_valdivia/Pages/Options/respaldo_base_datos.dart';
import 'package:cafe_valdivia/Pages/Options/unidad_medida_lista.dart';
import 'package:flutter/material.dart';

class _OptionItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;

  const _OptionItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.page,
  });
}

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    const options = [
      _OptionItem(
        title: 'Unidad de Medida',
        subtitle: 'Tipos de medidas en los productos',
        icon: Icons.scale_rounded,
        page: UnidadMedidaLista(),
      ),
      _OptionItem(
        title: "Eliminar Base de datos",
        subtitle: "Eliminara todos los datos",
        icon: Icons.delete,
        page: EliminarBaseDatos(),
      ),
      _OptionItem(
        title: "Respaldo de Base de datos",
        subtitle: "Exportar e importar la base de datos",
        icon: Icons.backup_rounded,
        page: RespaldoBaseDatos(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Configuracion"))),
      body: ListviewCustom<_OptionItem>(
        data: options,
        keyBuilder: (item) => ValueKey(item.title),
        titleBuilder: (item) => Text(item.title),
        subtitleBuilder: (item) => Text(item.subtitle),
        leadingBuilder: (item) => Icon(item.icon),
        onTapCallback: (item) => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => item.page)),
      ),
    );
  }
}
