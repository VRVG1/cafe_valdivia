import 'package:cafe_valdivia/Pages/Insumos/editar_insumo_page.dart';
import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/providers/insumo_providers.dart';
import 'package:cafe_valdivia/providers/unidad_medida_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsumoDetalladoPage extends ConsumerWidget {
  final int insumoId;

  const InsumoDetalladoPage({super.key, required this.insumoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncInsumo = ref.watch(insumoDetailProvider(insumoId));

    return asyncInsumo.when(
      data:
          (insumo) => Scaffold(
            appBar: AppBar(
              title: Text(
                "Insumo",
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
                        builder: (context) => EditarInsumoPage(insumo: insumo),
                      ),
                    ).then(
                      (_) => ref.invalidate(insumoDetailProvider(insumoId)),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert_rounded),
                  onSelected: (String result) {
                    if (result == 'eliminar') {
                      _mostrarDialogoConfirmacion(context, ref, insumo);
                    }
                  },
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'eliminar',
                          child: Row(children: [Text('Eliminar')]),
                        ),
                      ],
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh:
                  () async => ref.invalidate(insumoDetailProvider(insumoId)),
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
                        insumo.nombre[0].toUpperCase(),
                        style: theme.textTheme.displayMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    insumo.nombre,
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  _buildInfoSection(
                    context: context,
                    title: "Detalles",
                    children: [
                      _buildDataTile(
                        context: context,
                        icon: Icons.label_rounded,
                        label: "Nombre",
                        value: insumo.nombre,
                      ),
                      const SizedBox(height: 16),
                      _buildDataTile(
                        context: context,
                        icon: Icons.description_rounded,
                        label: "Descripcion",
                        value: insumo.descripcion ?? 'No especificado',
                      ),
                      const SizedBox(height: 16),
                      _buildDataTile(
                        context: context,
                        icon:
                            Icons
                                .straight_rounded, // o el ícono que mejor represente unidades
                        label: "Unidad de Medida",
                        value: 'No especificada',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      error:
          (err, stack) => Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Error al cargar el insumo",
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Error: $err",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:
                        () => ref.invalidate(insumoDetailProvider(insumoId)),
                    child: const Text("Reintentar"),
                  ),
                ],
              ),
            ),
          ),
      loading:
          () => Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}

void _mostrarDialogoConfirmacion(
  BuildContext context,
  WidgetRef ref,
  Insumos insumo,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Eliminar Insumo"),
        content: Text("¿Estás seguro de eliminar ${insumo.nombre}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              ref.read(insumoDetailProvider(insumo.id!).future).then((_) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              });
            },
            child: const Text("Eliminar"),
          ),
        ],
      );
    },
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
    crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ],
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
