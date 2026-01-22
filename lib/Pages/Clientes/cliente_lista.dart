import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_detallado.dart';
import 'package:cafe_valdivia/Pages/Clientes/editarClienteDetallada.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/models/cliente_extension.dart';
import 'package:cafe_valdivia/providers/cliente_notifier.dart';
import 'package:cafe_valdivia/providers/cliente_provider.dart';
import 'package:cafe_valdivia/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Clientelista extends ConsumerWidget {
  const Clientelista({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncClientes = ref.watch(clienteProvider);

    return asyncClientes.when(
      data: (clientes) {
        if (clientes.isEmpty) {
          return const Center(child: Text('No hay clientes para mostrar.'));
        } else {
          appLogger.i(clientes);
        }

        return ListviewCustom<Cliente>(
          data: clientes,
          keyBuilder: (cliente) {
            return ValueKey(
              cliente.idCliente != null
                  ? 'proveedor-${cliente.idCliente}'
                  : cliente.hashCode,
            );
          },
          titleBuilder: (cliente) =>
              cliente.nombre.isEmpty ? Text('Jonh Doe') : Text(cliente.nombre),
          subtitleBuilder: (cliente) => cliente.telefono.toString().isEmpty
              ? Text('xxxxxxxxxx')
              : Text(cliente.telefono.toString()),
          leadingBuilder: (cliente) => CircleAvatar(
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              cliente.iniciales.isNotEmpty ? cliente.iniciales : "JD",
              style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
          trailingBuilder: (cliente) => Text(
            //TODO: Aqui se tiene que poner los kilos
            cliente.idCliente != null ? '${cliente.idCliente} KG' : '0 KG',
          ),
          onTapCallback: (cliente) => {
            if (cliente.idCliente != null)
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ClienteDetallado(clienteId: cliente.idCliente!),
                  ),
                ),
              },
          },
          onEditDismissed: (cliente) async {
            if (cliente.idCliente != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditarClienteDetallado(cliente: cliente),
                ),
              ).then(
                (_) =>
                    ref.invalidate(clienteDetailProvider(cliente.idCliente!)),
              );
            }
            return null;
          },
          onDeleteDismissed: (cliente) async {
            final bool confirmacion =
                await mostrarDialogoConfirmacion(
                  context: context,
                  titulo: "Seguro que quiere eliminar este cliente?",
                  contenido: "Esta accion no se puede deshacer",
                  textoBotonConfirmacion: "Eliminar",
                  onConfirm: () => {
                    delete(
                      context: context,
                      ref: ref,
                      provider: clienteProvider,
                      id: cliente.idCliente!,
                      mensajeExito: "El cliente se ha borrado con exito",
                      detalle: false,
                      mensajeError:
                          "Error al eliminar el cliente,Por favor, intente de nuevo",
                    ),
                  },
                ) ??
                false;
            if (confirmacion == true) {
              return true;
            }
            return false;
          },
        );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
