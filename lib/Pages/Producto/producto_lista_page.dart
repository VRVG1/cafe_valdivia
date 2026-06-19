import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_detalle_page.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_editar_page.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoListaPage extends ConsumerWidget {
  const ProductoListaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProductos = debugOverride(
      ref,
      'productos',
      ref.watch(productosProviderProvider),
    );

    return asyncProductos.when(
      data: (productos) {
        if (productos.isEmpty) {
          return const Center(child: Text('No hay Productos para mostrar.'));
        }
        return ListviewCustom<Articulo>(
          data: productos,
          keyBuilder: (producto) {
            return ValueKey(
              producto.idArticulo != null
                  ? 'producto-${producto.idArticulo}'
                  : producto.hashCode,
            );
          },
          leadingBuilder: (producto) => const Icon(Icons.coffee_rounded),
          titleBuilder: (producto) => Text(producto.nombre),
          subtitleBuilder: (producto) =>
              producto.descripcion != null ? Text(producto.descripcion!) : null,
          trailingBuilder: (producto) => Text(
            "\$${producto.precioVenta.toStringAsFixed(2)}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTapCallback: (producto) {
            if (producto.idArticulo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductoDetallePage(id: producto.idArticulo!),
                ),
              );
            }
          },
          onEditDismissed: (producto) async {
            if (producto.idArticulo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductoEditarPage(producto: producto),
                ),
              );
            }
            return false;
          },
          onDeleteDismissed: (producto) async {
            final bool confirmacion =
                await mostrarDialogoConfirmacion(
                  context: context,
                  titulo: "Seguro que quiere eliminar este Producto?",
                  contenido: "Esta accion no se puede deshacer",
                  textoBotonConfirmacion: "Eliminar",
                  onConfirm: () => {
                    delete(
                      context: context,
                      ref: ref,
                      provider: articuloProviderProvider,
                      id: producto.idArticulo!,
                      mensajeExito: "El producto se ha borrado con exito",
                      mensajeError:
                          "Error al eliminar el producto, Por favor, intente de nuevo",
                      detalle: false,
                    ),
                  },
                ) ??
                false;
            if (confirmacion == true) {
              return true;
            }
            return false;
          },
        );
      },
      error: (err, stack) =>
          const ErrorView(message: 'Error al cargar los productos'),
      loading: () => SkeletonListTiles(n: 10),
    );
  }
}
