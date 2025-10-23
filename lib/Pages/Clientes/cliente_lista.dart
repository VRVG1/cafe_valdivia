import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_detallado.dart';
import 'package:cafe_valdivia/Pages/Clientes/editarClienteDetallada.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/providers/cliente_notifier.dart';
import 'package:cafe_valdivia/providers/cliente_provider.dart';
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
          onEditDismissed: (cliente) async {
            if (cliente.id != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => EditarClienteDetallado(cliente: cliente),
                ),
              ).then((_) => ref.invalidate(clienteDetailProvider(cliente.id!)));
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
                  onConfirm:
                      () => {
                        delete(
                          context: context,
                          ref: ref,
                          provider: clienteProvider,
                          id: cliente.id!,
                          mensajeExito: "El cliente se ha borrado con exito",
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
