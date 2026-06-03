import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/Receta/receta_provider.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecetaDetallePage extends ConsumerWidget {
  final int recetaId;

  const RecetaDetallePage({super.key, required this.recetaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final asyncReceta = ref.watch(recetaDetailProvider(recetaId));
    final asyncDetalles = ref.watch(recetaDetallesProvider(recetaId));
    final asyncProductos = ref.watch(productosProviderProvider);

    return Scaffold(
      appBar: AppBarDetalles<Receta>(
        title: "Detalle Receta",
        onDeletePressed: () {
          mostrarDialogoConfirmacion(
            context: context,
            titulo: "Eliminar receta",
            contenido:
                "Esta accion no se puede deshacer.\n"
                "Se eliminara la receta y sus componentes.",
            textoBotonConfirmacion: "Eliminar",
            onConfirm: () => delete(
              context: context,
              ref: ref,
              provider: recetaProviderProvider,
              id: recetaId,
              mensajeExito: "Receta eliminada con exito",
              mensajeError:
                  "Error al eliminar la receta. Por favor, intente de nuevo.",
            ),
          );
        },
      ),
      body: asyncReceta.when(
        data: (receta) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailsContainer<Receta>(
                  title: "Informacion general",
                  elements: [
                    DetailElement(
                      icon: const Icon(Icons.menu_book_rounded),
                      title: const Text("Nombre"),
                      description: Text(receta.nombre),
                    ),
                    DetailElement(
                      icon: const Icon(Icons.category_rounded),
                      title: const Text("Producto final"),
                      description: asyncProductos.when(
                        data: (productos) {
                          final match = productos.where(
                            (p) =>
                                p.idArticulo == receta.idArticuloProducto,
                          );
                          return Text(
                            match.isNotEmpty
                                ? match.first.nombre
                                : "ID: ${receta.idArticuloProducto}",
                          );
                        },
                        loading: () => const Text("..."),
                        error: (_, __) => Text(
                          "ID: ${receta.idArticuloProducto}",
                        ),
                      ),
                    ),
                    DetailElement(
                      icon:
                          const Icon(Icons.production_quantity_limits_rounded),
                      title: const Text("Cantidad base"),
                      description:
                          Text("${receta.cantidad_base} unidades"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DetailsContainer<Receta>(
                  title: "Componentes",
                  elements: [
                    asyncDetalles.when(
                      data: (detalles) {
                        if (detalles.isEmpty) {
                          return const Text(
                            "No hay componentes registrados",
                          );
                        }
                        return _buildComponentesList(
                          context,
                          ref,
                          detalles,
                          cs,
                          tt,
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, _) => Text("Error: $e"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }

  Widget _buildComponentesList(
    BuildContext context,
    WidgetRef ref,
    List<RecetaDetalle> detalles,
    ColorScheme cs,
    TextTheme tt,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Componente",
                style: tt.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurfaceVariant,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Cant.",
                style: tt.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Unidad",
                style: tt.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurfaceVariant,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const Divider(),
        ...detalles.map((d) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _ArticuloNombre(
                    articuloId: d.idArticulo,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    d.cantidad.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: tt.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: _UnidadNombre(
                    unidadId: d.idUnidad,
                    textAlign: TextAlign.right,
                    style: tt.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _ArticuloNombre extends ConsumerWidget {
  final int articuloId;

  const _ArticuloNombre({required this.articuloId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncArticulos = ref.watch(articuloProviderProvider);
    return asyncArticulos.when(
      data: (articulos) {
        final match = articulos.where(
          (a) => a.idArticulo == articuloId,
        );
        return Text(
          match.isNotEmpty ? match.first.nombre : "ID: $articuloId",
        );
      },
      loading: () => const Text("..."),
      error: (_, __) => Text("ID: $articuloId"),
    );
  }
}

class _UnidadNombre extends ConsumerWidget {
  final int unidadId;
  final TextAlign textAlign;
  final TextStyle? style;

  const _UnidadNombre({
    required this.unidadId,
    required this.textAlign,
    this.style,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUnidad = ref.watch(unidadMedidaDetailProvider(unidadId));
    return asyncUnidad.when(
      data: (unidad) => Text(
        unidad.nombre,
        textAlign: textAlign,
        style: style,
      ),
      loading: () => Text("...", textAlign: textAlign),
      error: (_, __) => Text(
        "ID: $unidadId",
        textAlign: textAlign,
      ),
    );
  }
}
