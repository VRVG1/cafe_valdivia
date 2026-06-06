import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Articulos/editar_articulo_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/articulo_detallado_page.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/Pages/Articulos/unidad_medida_nombre.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsumoListaPage extends ConsumerWidget {
  const InsumoListaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncArticulo = ref.watch(articuloProviderProvider);

    return asyncArticulo.when(
      data: (articulos) {
        if (articulos.isEmpty) {
          return const Center(child: Text('No hay articulos para mostrar.'));
        }
        return ListviewCustom<Articulo>(
          data: articulos,
          keyBuilder: (articulo) {
            return ValueKey(
              articulo.idArticulo != null
                  ? 'articulo-${articulo.idArticulo}'
                  : articulo.hashCode,
            );
          },
          leadingBuilder: (articulo) => const Icon(Icons.inventory_2_rounded),
          titleBuilder: (articulo) => Text(articulo.nombre),
          trailingBuilder: (articulo) => Text(
            "\$${articulo.costoUnitario}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitleBuilder: (articulo) =>
              UnidadMedidaNombre(unidadMedidaId: articulo.idUnidad),
          onTapCallback: (articulo) {
            if (articulo.idArticulo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ArticuloDetalladoPage(articuloId: articulo.idArticulo!),
                ),
              );
            }
          },
          onEditDismissed: (articulo) async {
            if (articulo.idArticulo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarArticuloPage(articulo: articulo),
                ),
              );
            }
            return false;
          },
          onDeleteDismissed: (articulo) async {
            final bool confirmar =
                await mostrarDialogoConfirmacion(
                  context: context,
                  titulo: "Seguro que quiere eliminar este cliente?",
                  contenido: "Esta accion no se puede deshacer",
                  textoBotonConfirmacion: "Eliminar",
                  onConfirm: () => {
                    delete(
                      context: context,
                      ref: ref,
                      provider: articuloProviderProvider,
                      id: articulo.idArticulo!,
                      mensajeExito: "El articulo se ha borrado con exito",
                      detalle: false,
                      mensajeError:
                          "Error al eliminar el Articulo, Por favor, intente de nuevo.",
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
      error: (err, stack) => const ErrorView(message: 'Error al cargar los artículos'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
