import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/entity_header.dart';
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
        ),
      );
    }

    return Scaffold(
      appBar: AppBarDetalles<Articulo>(
        title: "Producto",
        hasMenu: true,
        onPrimaryPressed: () {
          final producto = asyncValue.asData?.value;
          if (producto != null) onEditPressed(producto);
        },
        onDeletePressed: onDeletePressed,
      ),
      body: asyncValue.when(
        data: (producto) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(articuloDetailProvider(id)),
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            children: [
              EntityHeader(
                initials: producto.nombre[0].toUpperCase(),
                name: producto.nombre,
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
        error: (err, stack) =>
            ErrorView(message: 'Error al cargar el producto'),
        loading: () => const SkeletonProductoDetalle(rowDetails: 4),
      ),
    );
  }
}
