import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Components/entity_header.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Proveedor/editar_proveedor.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/core/models/proveedor_extension.dart';
import 'package:cafe_valdivia/providers/Proveedor/proveedor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProveedorDetallado extends ConsumerWidget {
  final int proveedorId;

  const ProveedorDetallado({super.key, required this.proveedorId});

  bool _esVacioONulo(String? text) {
    return text == null || text.trim().isEmpty;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncProveedor = debugOverride(
      ref,
      'proveedor_detalle',
      ref.watch(proveedorDetailProvider(proveedorId)),
    );

    return Scaffold(
      appBar: AppBarDetalles<Proveedor>(
        title: "Proveedor",
        hasMenu: true,
        onPrimaryPressed: () {
          final proveedor = asyncProveedor.asData?.value;
          if (proveedor != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditarProveedor(proveedor: proveedor),
              ),
            ).then((_) => ref.invalidate(proveedorDetailProvider(proveedorId)));
          }
        },
        onDeletePressed: () {
          mostrarDialogoConfirmacion(
            context: context,
            titulo: "Confirmar eliminación",
            contenido:
                "¿Estás seguro de que deseas eliminar este proveedor? "
                "Esta acción no se puede deshacer.",
            textoBotonConfirmacion: "Eliminar",
            onConfirm: () => delete(
              context: context,
              ref: ref,
              provider: proveedorListProvider,
              id: proveedorId,
              mensajeExito: 'Proveedor eliminado con éxito',
            ),
          );
        },
      ),
      body: asyncProveedor.when(
        loading: () => const SkeletonProductoDetalle(rowDetails: 3),
        error: (err, stack) => ErrorView(
          message: 'Error al cargar el proveedor',
          description: err.toString(),
        ),
        data: (proveedor) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(proveedorDetailProvider(proveedorId));
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              children: [
                EntityHeader(
                  initials: proveedor.iniciales,
                  name: proveedor.nombre,
                ),
                const SizedBox(height: 48),
                DetailsContainer(
                  title: "Datos de Contacto",
                  elements: [
                    DetailElement(
                      icon: Icon(Icons.phone_android_rounded),
                      title: Text("Teléfono"),
                      description: Text(proveedor.telefono.toString()),
                    ),
                    DetailElement(
                      icon: Icon(Icons.email_rounded),
                      title: Text("Email"),
                      description: Text(
                        _esVacioONulo(proveedor.email)
                            ? "No especificado"
                            : proveedor.email!,
                      ),
                    ),
                    DetailElement(
                      icon: Icon(Icons.map_rounded),
                      title: Text("Direccion"),
                      description: Text(
                        _esVacioONulo(proveedor.direccion)
                            ? "No especificado"
                            : proveedor.direccion!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
