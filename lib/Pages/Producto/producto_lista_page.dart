import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_detalle_page.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_editar_page.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/providers/producto_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoListaPage extends ConsumerWidget {
  const ProductoListaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final AsyncValue<List<Producto>> asyncProducto = ref.watch(
      productoProvider,
    );

    return asyncProducto.when(
      data: (List<Producto> prodcutos) {
        if (prodcutos.isEmpty) {
          return const Center(child: Text('No hay Productos para mostrar.'));
        }
        return ListviewCustom<Producto>(
          keyBuilder: (Producto proveedor) {
            return ValueKey(
              proveedor.idProducto != null
                  ? 'producto-${proveedor.idProducto}'
                  : proveedor.hashCode,
            );
          },
          data: prodcutos,
          titleBuilder: (producto) => producto.nombre.isEmpty
              ? Text('Jane Doe')
              : Text(producto.nombre),
          subtitleBuilder: (producto) =>
              producto.descripcion != null ? Text(producto.descripcion!) : null,
          leadingBuilder: (Producto prodcutos) => Icon(Icons.coffee_rounded),
          //TODO: Poner en el trailingBuilder el numero de stock que tiene el producto
          trailingBuilder: (Producto producto) => Text("1"),
          onEditDismissed: (Producto producto) async {
            if (producto.idProducto != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductoEditarPage(producto: producto),
                ),
              );
            }
            return false;
          },
          onDeleteDismissed: (Producto producto) async {
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
                      provider: productoProvider,
                      id: producto.idProducto!,
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
          onTapCallback: (Producto producto) async {
            if (producto.idProducto != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductoDetallePage(id: producto.idProducto!),
                ),
              );
            }
          },
          // onEditDismissed: (insumo) async {
          //   if (insumo.id != null) {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => EditarInsumoPage(insumo: insumo),
          //       ),
          //     );
          //   }
          //   return false;
          // },
        );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
