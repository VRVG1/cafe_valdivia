import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Proveedor/editar_proveedor.dart';
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

    return asyncProveedor.when(
      loading: () =>
          SkeletonProductoDetalle(detalleName: "Proveedor", rowDetails: 3),
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: ErrorView(
          message: 'Error al cargar el proveedor',
          description: err.toString(),
        ),
      ),
      data: (proveedor) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Proveedor",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_rounded),
                color: theme.colorScheme.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditarProveedor(proveedor: proveedor),
                    ),
                  ).then(
                    (_) => ref.invalidate(proveedorDetailProvider(proveedorId)),
                  );
                },
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert_rounded),
                onSelected: (String result) {
                  if (result == 'eliminar') {
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
                      mensajeError:
                          'Error al eliminar el proveedor. Por favor, intente de nuevo.',
                    ),
                    );
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'eliminar',
                    child: Row(children: [Text('Eliminar')]),
                  ),
                ],
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(proveedorDetailProvider(proveedorId));
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    radius: 64,
                    child: Text(
                      proveedor.iniciales,
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  proveedor.nombre,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                _buildInfoSection(
                  context: context,
                  title: "Datos de Contacto",
                  children: [
                    _buildDataTile(
                      context: context,
                      icon: Icons.phone_android_rounded,
                      label: "Teléfono",
                      value: proveedor.telefono.toString(),
                    ),
                    const SizedBox(height: 16),
                    _buildDataTile(
                      context: context,
                      icon: Icons.email_rounded,
                      label: "Email",
                      value: _esVacioONulo(proveedor.email)
                          ? "No especificado"
                          : proveedor.email!,
                    ),
                    const SizedBox(height: 16),
                    _buildDataTile(
                      context: context,
                      icon: Icons.map_rounded,
                      label: "Direccion",
                      value: _esVacioONulo(proveedor.direccion)
                          ? "No especificado"
                          : proveedor.direccion!,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoSection({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.only(left: 8.0, right: 12.0),
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildDataTile({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
