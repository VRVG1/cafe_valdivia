import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_detallado.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/providers/cliente_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Clientelista extends ConsumerWidget {
  const Clientelista({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncClientes = ref.watch(clienteNotifierProvider);

    return asyncClientes.when(
      data: (clientes) {
        if (clientes.isEmpty) {
          return const Center(child: Text('No hay clientes para mostrar.'));
        }

        return ListviewCustom<Cliente>(
          data: clientes,
          keyBuilder: (cliente) {
            return ValueKey(
              cliente.id != null ? 'proveedor-${cliente.id}' : cliente.hashCode,
            );
          },
          titleBuilder:
              (cliente) =>
                  cliente.nombre.isEmpty
                      ? Text('Jonh Doe')
                      : Text(cliente.nombre),
          subtitleBuilder:
              (cliente) =>
                  cliente.telefono.toString().isEmpty
                      ? Text('xxxxxxxxxx')
                      : Text(cliente.telefono.toString()),
          leadingBuilder:
              (cliente) => CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text(
                  cliente.getIniciales().isNotEmpty
                      ? cliente.getIniciales()
                      : "JD",
                  style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
                ),
              ),
          trailingBuilder:
              (cliente) => Text(
                //TODO: Aqui se tiene que poner los kilos
                cliente.id != null ? '${cliente.id} KG' : '0 KG',
              ),
          onTapCallback:
              (cliente) => {
                if (cliente.id != null)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ClienteDetallado(clienteId: cliente.id!),
                      ),
                    ),
                  },
              },
        );

        // return ListView.builder(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        //   physics: const ClampingScrollPhysics(),
        //   itemCount: clientes.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final Cliente cliente = clientes[index];

        //     // determinar los indices para saber cual es el primero y el ultimo
        //     // elemento
        //     final bool isFirst = index == 0;
        //     final bool isLast = index == clientes.length - 1;

        //     final BorderRadius borderRadius;
        //     if (isFirst && isLast) {
        //       borderRadius = BorderRadius.circular(12.0);
        //     } else if (isFirst) {
        //       borderRadius = const BorderRadius.only(
        //         topLeft: Radius.circular(12.0),
        //         topRight: Radius.circular(12.0),
        //       );
        //     } else if (isLast) {
        //       borderRadius = const BorderRadius.only(
        //         bottomLeft: Radius.circular(12.0),
        //         bottomRight: Radius.circular(12.0),
        //       );
        //     } else {
        //       borderRadius = BorderRadius.all(Radius.circular(4.0));
        //     }

        //     return Card(
        //       margin: EdgeInsets.symmetric(vertical: 1),
        //       elevation: 0,
        //       child: ListTile(
        //         shape: RoundedRectangleBorder(borderRadius: borderRadius),
        //         contentPadding: const EdgeInsets.symmetric(
        //           horizontal: 16.0,
        //           vertical: 8.0,
        //         ),
        //         tileColor: theme.colorScheme.surfaceContainerLowest,
        //         leading: CircleAvatar(
        //           backgroundColor: theme.colorScheme.primaryContainer,
        //           child: Text(
        //             cliente.getIniciales().isNotEmpty
        //                 ? cliente.getIniciales()
        //                 : "JD",
        //             style: TextStyle(
        //               color: theme.colorScheme.onPrimaryContainer,
        //             ),
        //           ),
        //         ),
        //         title: Text(
        //           cliente.nombre.isNotEmpty &&
        //                   (cliente.apellido ?? '').isNotEmpty
        //               ? cliente.toString()
        //               : 'Jonh Doe',
        //         ),
        //         subtitle: Text(
        //           cliente.telefono.toString().isNotEmpty
        //               ? cliente.telefono.toString()
        //               : "xxxxxxxxxx",
        //         ),
        //         trailing: Text(
        //           //TODO: Aqui se tiene que poner los kilos
        //           cliente.id != null ? '${cliente.id} KG' : '0 KG',
        //         ),
        //         onTap:
        //             cliente.id != null
        //                 ? () {
        //                   Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder:
        //                           (context) =>
        //                               ClienteDetallado(clienteId: cliente.id!),
        //                     ),
        //                   );
        //                 }
        //                 : null,
        //       ),
        //     );
        //   },
        // );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
