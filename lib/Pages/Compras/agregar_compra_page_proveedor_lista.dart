import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/core/models/proveedor_extension.dart';
import 'package:cafe_valdivia/providers/Proveedor/proveedor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCompraPageProveedorLista extends ConsumerStatefulWidget {
  const AgregarCompraPageProveedorLista({super.key});

  @override
  AgregarCompraPageProveedorListaState createState() =>
      AgregarCompraPageProveedorListaState();
}

class AgregarCompraPageProveedorListaState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;
    final asyncProveedorFiltrado = ref.watch(proveedoresFiltradosProvider);

    return asyncProveedorFiltrado.when(
      skipLoadingOnReload: true,
      skipLoadingOnRefresh: true,
      data: (proveedores) {
        if (proveedores.isEmpty) {
          return Scaffold(
            appBar: AppbarChips(),
            body: const Center(child: Text('No hay proveedors para mostrar.')),
          );
        }

        return Scaffold(
          appBar: AppbarChips(),
          body: ListviewCustom<Proveedor>(
            data: proveedores,
            keyBuilder: (proveedor) {
              return ValueKey(
                proveedor.idProveedor != null
                    ? 'proveedor-${proveedor.idProveedor}'
                    : proveedor.hashCode,
              );
            },
            titleBuilder: (proveedor) => Text(
              proveedor.nombre.isNotEmpty ? proveedor.nombre : 'Jonh Doe',
            ),
            leadingBuilder: (proveedor) => CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                proveedor.iniciales.isNotEmpty ? proveedor.iniciales : "JD",
                style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
              ),
            ),
            subtitleBuilder: (proveedor) => Text(
              proveedor.telefono.toString().isNotEmpty
                  ? proveedor.telefono.toString()
                  : "xxxxxxxxxx",
            ),
            onTapCallback: (proveedor) => {
              if (proveedor.idProveedor != null)
                {Navigator.pop(context, proveedor.nombre)},
            },
            onEditDismissed: null,
            onDeleteDismissed: null,
          ),
        );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () {
        final previos = asyncProveedorFiltrado.value;
        if (previos != null) return Text("Hola");
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
