import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Proveedor/editar_proveedor.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_detallado.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/models/proveedor_extension.dart';
import 'package:cafe_valdivia/providers/proveedor_notifier.dart';
import 'package:cafe_valdivia/providers/proveedor_providers.dart';
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
    final asyncProveedor = ref.watch(proveedorProvider);

    return asyncProveedor.when(
      data: (proveedores) {
        if (proveedores.isEmpty) {
          return const Center(child: Text('No hay proveedors para mostrar.'));
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: theme.colorScheme.surface,
            toolbarHeight: 120,
            title: Container(
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: theme.colorScheme.surfaceContainerHighest.withAlpha(200),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: "Buscar Proveedor",
                  labelStyle: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsetsGeometry.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
        ListviewCustom<Proveedor>(
          data: proveedores,
          keyBuilder: (proveedor) {
            return ValueKey(
              proveedor.idProveedor != null
                  ? 'proveedor-${proveedor.idProveedor}'
                  : proveedor.hashCode,
            );
          },
          titleBuilder: (proveedor) =>
              Text(proveedor.nombre.isNotEmpty ? proveedor.nombre : 'Jonh Doe'),
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
                    builder: (context) =>
                        ProveedorDetallado(proveedorId: proveedor.idProveedor!),
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
                      provider: proveedorProvider,
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
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
