import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_editar_page.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/producto_extension.dart';
import 'package:cafe_valdivia/providers/producto_notifier.dart';
import 'package:cafe_valdivia/providers/producto_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoDetallePage extends ConsumerWidget {
  final int id;
  const ProductoDetallePage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncValue = ref.watch(productoDetailProvider(id));

    void onEditPressed(Producto producto) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductoEditarPage(producto: producto),
          ),
        ).then((_) => ref.invalidate(productoDetailProvider(id)));
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
          provider: productoProvider,
          id: id,
          mensajeExito: "El Producto se elimino con exito",
          mensajeError: "Error al eliminar el producto",
        ),
      );
    }

    return asyncValue.when(
      data: (Producto producto) => Scaffold(
        appBar: AppBarDetalles<Producto>(
          title: "Producto",
          model: producto,
          onEditPressed: () => onEditPressed(producto),
          onDeletePressed: () => onDeletePressed(),
        ),
        body: RefreshIndicator(
          onRefresh: () async => ref.invalidate(productoDetailProvider(id)),
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
                    producto.iniciales,
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
                    description: Text(producto.precioVenta.toString()),
                  ),
                  DetailElement(
                    icon: Icon(Icons.description_rounded),
                    title: Text("Descricion"),
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

      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
