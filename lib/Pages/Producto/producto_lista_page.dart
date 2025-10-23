import 'package:cafe_valdivia/Components/listview_custom.dart';
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
          return const Center(child: Text('No hay Productoes para mostrar.'));
        }
        return ListviewCustom(
          keyBuilder: (Producto proveedor) {
            return ValueKey(
              proveedor.id != null
                  ? 'producto-${proveedor.id}'
                  : proveedor.hashCode,
            );
          },
          data: prodcutos,
          titleBuilder:
              (producto) =>
                  producto.nombre.isEmpty
                      ? Text('Jane Doe')
                      : Text(producto.nombre),
        );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
