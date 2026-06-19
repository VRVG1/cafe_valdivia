import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Articulos/editar_articulo_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/unidad_medida_nombre.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticuloDetalladoPage extends ConsumerWidget {
  final int articuloId;

  const ArticuloDetalladoPage({super.key, required this.articuloId});

  Future<void> _eliminar(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(articuloProviderProvider.notifier).delete(articuloId);
      if (context.mounted) {
        showCustomSnackBar(
          context: context,
          mensaje: 'Articulo eliminado con éxito',
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (context.mounted) {
        showCustomSnackBar(
          context: context,
          mensaje: 'Error al eliminar el articulo: $e',
          isError: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncArticulo = debugOverride(
      ref,
      'articulo_detalle',
      ref.watch(articuloDetailProvider(articuloId)),
    );

    return asyncArticulo.when(
      data: (articulo) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Articulo",
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
                        EditarArticuloPage(articulo: articulo),
                  ),
                ).then(
                  (_) => ref.invalidate(articuloDetailProvider(articuloId)),
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
                        "¿Estás seguro de que deseas eliminar este Articulo? "
                        "Esta acción no se puede deshacer.",
                    textoBotonConfirmacion: "Eliminar",
                    onConfirm: () => _eliminar(context, ref),
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
          onRefresh: () async =>
              ref.invalidate(articuloDetailProvider(articuloId)),
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
                    articulo.nombre[0].toUpperCase(),
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                articulo.nombre,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              DetailsContainer(
                title: "Detalles",
                elements: [
                  DetailElement(
                    icon: Icon(Icons.label_rounded),
                    title: Text("Nombre"),
                    description: Text(articulo.nombre),
                  ),
                  DetailElement(
                    icon: Icon(Icons.attach_money),
                    title: Text("Costo Unitario"),
                    description: Text(articulo.costoUnitario.toString()),
                  ),
                  DetailElement(
                    icon: Icon(Icons.balance_rounded),
                    title: Text("Unidad de Medida"),
                    description: UnidadMedidaNombre(
                      unidadMedidaId: articulo.idUnidad,
                    ),
                  ),
                  DetailElement(
                    icon: Icon(Icons.description_rounded),
                    title: Text("Descripcion"),
                    description: Text(
                      articulo.descripcion ?? "No especificado",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: ErrorView(
          message: 'Error al cargar el artículo',
          description: err.toString(),
          onRetry: () => ref.invalidate(articuloDetailProvider(articuloId)),
        ),
      ),
      loading: () =>
          SkeletonProductoDetalle(detalleName: "Articulo", rowDetails: 4),
    );
  }
}
