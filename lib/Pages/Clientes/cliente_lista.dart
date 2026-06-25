import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Clientes/cliente_detallado.dart';
import 'package:cafe_valdivia/Pages/Clientes/editarClienteDetallada.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/providers/Cliente/cliente_notifier.dart';
import 'package:cafe_valdivia/providers/Cliente/cliente_provider.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Clientelista extends ConsumerWidget {
  const Clientelista({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncClientesKilos = debugOverride(
      ref,
      'clientes_kilos',
      ref.watch(clientesKilosListProvider),
    );

    return asyncClientesKilos.when(
      data: (clientes) {
        if (clientes.isEmpty) {
          return ErrorView(
            message: 'No hay clientes para mostrar',
            onRetry: () => ref.invalidate(clientesKilosListProvider),
          );
        } else {
          appLogger.i(clientes);
        }

        return ListviewCustom<Map<String, dynamic>>(
          data: clientes,
          keyBuilder: (cliente) {
            final id = cliente['id_cliente'] as int?;
            return ValueKey(id != null ? 'cliente-$id' : cliente.hashCode);
          },
          titleBuilder: (cliente) {
            final nombre = cliente['nombre'] as String? ?? '';
            final apellido = cliente['apellido'] as String? ?? '';
            final nombreCompleto = '$nombre $apellido'.trim();
            return Text(
              nombreCompleto.isNotEmpty ? nombreCompleto : 'John Doe',
            );
          },
          subtitleBuilder: (cliente) {
            final telefono = cliente['telefono'] as String? ?? '';
            return Text(telefono.isNotEmpty ? telefono : 'xxxxxxxxxx');
          },
          leadingBuilder: (cliente) {
            final nombre = cliente['nombre'] as String? ?? '';
            final apellido = cliente['apellido'] as String? ?? '';
            final iniciales =
                '${nombre.isNotEmpty ? nombre[0] : ''}${apellido.isNotEmpty ? apellido[0] : ''}';
            return CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                iniciales.isNotEmpty ? iniciales : 'JD',
                style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
              ),
            );
          },
          trailingBuilder: (cliente) {
            final kilos = (cliente['kilos'] as num?) ?? 0;
            return Text('${kilos.toStringAsFixed(1)} KG');
          },
          onTapCallback: (cliente) {
            final id = cliente['id_cliente'] as int?;
            if (id != null) {
              appLogger.w(id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClienteDetallado(clienteId: id),
                ),
              );
            }
          },
          onEditDismissed: (cliente) async {
            final id = cliente['id_cliente'] as int?;
            if (id != null) {
              final clienteObj = Cliente.fromJson(cliente);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditarClienteDetallado(cliente: clienteObj),
                ),
              ).then((_) => ref.invalidate(clienteDetailProvider(id)));
            }
            return null;
          },
          onDeleteDismissed: (cliente) async {
            final id = cliente['id_cliente'] as int?;
            if (id == null) return false;
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
                      id: id,
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
      error: (err, stack) => ErrorView(
        message: 'Error al cargar los clientes',
        onRetry: () => ref.invalidate(clientesKilosListProvider),
      ),
      loading: () => SkeletonListTiles(n: 10),
    );
  }
}
