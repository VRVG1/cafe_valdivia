import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Pages/Articulos/editar_articulo_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/unidad_medida_nombre.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoDetallePage extends ConsumerWidget {
  final int id;
  const ProductoDetallePage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncValue = debugOverride(
      ref,
      'productos_detalles',
      ref.watch(articuloDetailProvider(id)),
    );

    void onEditPressed(Articulo producto) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditarArticuloPage(articulo: producto),
          ),
        ).then((_) => ref.invalidate(articuloDetailProvider(id)));
      }
    }

    void onDeletePressed() {
      mostrarDialogoConfirmacion(
        context: context,
        titulo: 'Eliminar el Producto',
        contenido: 'Esta accion no se puede deshacer',
        textoBotonConfirmacion: "Eliminar",
        onConfirm: () => delete(
          context: context,
          ref: ref,
          provider: articuloProviderProvider,
          id: id,
          mensajeExito: "El Producto se elimino con exito",
          mensajeError: "Error al eliminar el producto",
        ),
      );
    }

    return asyncValue.when(
      data: (producto) => Scaffold(
        appBar: AppBarDetalles<Articulo>(
          title: "Producto",
          model: producto,
          onEditPressed: () => onEditPressed(producto),
          onDeletePressed: () => onDeletePressed(),
        ),
        body: RefreshIndicator(
          onRefresh: () async => ref.invalidate(articuloDetailProvider(id)),
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
                    producto.nombre[0].toUpperCase(),
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                producto.nombre,
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
                    icon: Icon(Icons.attach_money_rounded),
                    title: Text("Precio de Venta"),
                    description: Text(
                      "\$${producto.precioVenta.toStringAsFixed(2)}",
                    ),
                  ),
                  DetailElement(
                    icon: Icon(Icons.inventory_rounded),
                    title: Text("Stock"),
                    description: Text(producto.stock.toString()),
                  ),
                  DetailElement(
                    icon: Icon(Icons.balance_rounded),
                    title: Text("Unidad de Medida"),
                    description: UnidadMedidaNombre(
                      unidadMedidaId: producto.idUnidad,
                    ),
                  ),
                  DetailElement(
                    icon: Icon(Icons.description_rounded),
                    title: Text("Descripcion"),
                    description: Text(
                      producto.descripcion ?? "No especificado",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      error: (err, stack) => ErrorView(message: 'Error al cargar el producto'),
      loading: () =>
          SkeletonProductoDetalle(detalleName: "Productos", rowDetails: 4),
    );
  }
}
