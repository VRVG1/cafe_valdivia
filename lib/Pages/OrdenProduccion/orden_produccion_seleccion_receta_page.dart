import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/providers/Receta/receta_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdenProduccionSeleccionRecetaPage extends ConsumerWidget {
  const OrdenProduccionSeleccionRecetaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecetas = debugOverride(
      ref,
      'seleccion_receta',
      ref.watch(recetaProviderProvider),
    );
    final theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Seleccionar Receta")),
      body: asyncRecetas.when(
        data: (recetas) {
          if (recetas.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu_book_outlined, size: 80, color: cs.outline),
                  const SizedBox(height: 16),
                  Text(
                    "No hay recetas registradas",
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            );
          }
          return ListviewCustom<Receta>(
            data: recetas,
            keyBuilder: (receta) => ValueKey(receta.idReceta),
            titleBuilder: (receta) => Text(receta.nombre),
            subtitleBuilder: (receta) =>
                Text('Cantidad base: ${receta.cantidad_base}'),
            trailingBuilder: (receta) =>
                Icon(Icons.chevron_right_rounded, color: cs.onSurfaceVariant),
            onTapCallback: (receta) => Navigator.pop(context, receta),
          );
        },
        error: (err, stack) =>
            ErrorView(message: 'Error al cargar las recetas'),
        loading: () => SkeletonListTiles(),
      ),
    );
  }
}
