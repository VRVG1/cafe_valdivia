import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Proveedor/editar_proveedor.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_agregar.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_detallado.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/core/models/proveedor_extension.dart';
import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/providers/Proveedor/proveedor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProveedorLista extends ConsumerStatefulWidget {
  const ProveedorLista({super.key});

  @override
  ProveedorListaState createState() => ProveedorListaState();
}

class ProveedorListaState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final asyncProveedor = debugOverride(
      ref,
      'proveedores',
      ref.watch(proveedoresFiltradosProvider),
    );

    return Scaffold(
      appBar: AppbarChips(
        extraFilters: [
          TipoBusqueda.email,
          TipoBusqueda.telefono,
          TipoBusqueda.direccion,
        ],
        labelText: "Buscar proveedor...",
        backOption: false,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Agregar Proveedor",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProveedorAgregar(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: asyncProveedor.when(
        data: (proveedores) {
          if (proveedores.isEmpty) {
            return ErrorView(message: 'No hay proveedors para mostrar.');
          }

          return ListviewCustom<Proveedor>(
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
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProveedorDetallado(
                        proveedorId: proveedor.idProveedor!,
                      ),
                    ),
                  ),
                },
            },
            onEditDismissed: (proveedor) async {
              if (proveedor.idProveedor != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditarProveedor(proveedor: proveedor),
                  ),
                ).then(
                  (_) => ref.invalidate(
                    proveedorDetailProvider(proveedor.idProveedor!),
                  ),
                );
              }
              return null;
            },
            onDeleteDismissed: (proveedor) async {
              final confirmacion =
                  await mostrarDialogoConfirmacion(
                    context: context,
                    titulo: "Seguro que quiere elminar este proveedor?",
                    contenido: "Esta accion no se puede deshacer",
                    textoBotonConfirmacion: "Eliminar",
                    onConfirm: () => {
                      delete(
                        context: context,
                        ref: ref,
                        provider: proveedorListProvider,
                        id: proveedor.idProveedor!,
                        mensajeExito: "Proveedor eliminado correctamente",
                        mensajeError:
                            "Error al eliminar el cliente, intente de nuevo",
                        detalle: false,
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
          message: 'Error al cargar los proveedores',
          onRetry: () => ref.invalidate(proveedorListProvider),
        ),
        loading: () => SkeletonListTiles(n: 10),
      ),
    );
  }
}
