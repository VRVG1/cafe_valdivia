import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Articulos/editar_articulo_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/unidad_medida_nombre.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticuloDetalladoPage extends ConsumerWidget {
  final int articuloId;

  const ArticuloDetalladoPage({super.key, required this.articuloId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncArticulo = debugOverride(
      ref,
      'articulo_detalle',
      ref.watch(articuloDetailProvider(articuloId)),
    );

    return Scaffold(
      appBar: AppBarDetalles<Articulo>(
        title: "Articulo",
        hasMenu: true,
        onPrimaryPressed: () {
          final articulo = asyncArticulo.asData?.value;
          if (articulo != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditarArticuloPage(articulo: articulo),
              ),
            ).then((_) => ref.invalidate(articuloDetailProvider(articuloId)));
          }
        },
        onDeletePressed: () {
          mostrarDialogoConfirmacion(
            context: context,
            titulo: "Confirmar eliminación",
            contenido:
                "¿Estás seguro de que deseas eliminar este Articulo? "
                "Esta acción no se puede deshacer.",
            textoBotonConfirmacion: "Eliminar",
            onConfirm: () => delete(
              context: context,
              ref: ref,
              provider: articuloProviderProvider,
              id: articuloId,
              mensajeExito: 'Articulo eliminado con éxito',
              mensajeError:
                  'Error al eliminar el articulo. Por favor, intente de nuevo.',
            ),
          );
        },
      ),
      body: asyncArticulo.when(
        data: (articulo) => RefreshIndicator(
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
                  DetailElement(
                    icon: Icon(Icons.inventory_2_rounded),
                    title: Text("Tipo de Articulo"),
                    description: Text(articulo.tipo.displayName),
                  ),
                ],
              ),
            ],
          ),
        ),
        error: (err, stack) => ErrorView(
          message: 'Error al cargar el artículo',
          description: err.toString(),
          onRetry: () => ref.invalidate(articuloDetailProvider(articuloId)),
        ),
        loading: () => const SkeletonProductoDetalle(rowDetails: 4),
      ),
    );
  }
}
