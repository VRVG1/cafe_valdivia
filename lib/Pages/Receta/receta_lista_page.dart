import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Receta/receta_detalle_page.dart';
import 'package:cafe_valdivia/Pages/Receta/receta_editar_page.dart';
import 'package:cafe_valdivia/providers/Receta/receta_provider.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecetaListaPage extends ConsumerWidget {
  const RecetaListaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecetas = ref.watch(recetaProviderProvider);

    return asyncRecetas.when(
      data: (recetas) {
        if (recetas.isEmpty) {
          return const Center(child: Text('No hay recetas para mostrar.'));
        }
        return ListviewCustom<Receta>(
          data: recetas,
          keyBuilder: (receta) {
            return ValueKey(
              receta.idReceta != null
                  ? 'receta-${receta.idReceta}'
                  : receta.hashCode,
            );
          },
          leadingBuilder: (receta) =>
              const Icon(Icons.menu_book_rounded),
          titleBuilder: (receta) => Text(receta.nombre),
          subtitleBuilder: (receta) => Text(
            'Cantidad base: ${receta.cantidad_base}',
          ),
          onTapCallback: (receta) {
            if (receta.idReceta != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecetaDetallePage(recetaId: receta.idReceta!),
                ),
              );
            }
          },
          onEditDismissed: (receta) async {
            if (receta.idReceta != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarRecetaPage(receta: receta),
                ),
              );
            }
            return false;
          },
          onDeleteDismissed: (receta) async {
            final bool confirmar =
                await mostrarDialogoConfirmacion(
                  context: context,
                  titulo: "Eliminar receta",
                  contenido:
                      "Esta accion no se puede deshacer",
                  textoBotonConfirmacion: "Eliminar",
                  onConfirm: () => {
                    delete(
                      context: context,
                      ref: ref,
                      provider: recetaProviderProvider,
                      id: receta.idReceta!,
                      mensajeExito: "Receta eliminada con exito",
                      detalle: false,
                      mensajeError:
                          "Error al eliminar la receta",
                    ),
                  },
                ) ??
                false;

            if (confirmar) {
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
