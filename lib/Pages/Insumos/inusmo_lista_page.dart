import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Insumos/editar_insumo_page.dart';
import 'package:cafe_valdivia/Pages/Insumos/insumo_detallado_page.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/Pages/Insumos/unidad_medida_nombre.dart';
import 'package:cafe_valdivia/providers/insumo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InusmoListaPage extends ConsumerWidget {
  const InusmoListaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncInsumo = ref.watch(insumoProvider);

    return asyncInsumo.when(
      data: (insumos) {
        if (insumos.isEmpty) {
          return const Center(child: Text('No hay insumos para mostrar.'));
        }
        return ListviewCustom<Insumo>(
          data: insumos,
          keyBuilder: (insumo) {
            return ValueKey(
              insumo.idInsumo != null
                  ? 'insumo-${insumo.idInsumo}'
                  : insumo.hashCode,
            );
          },
          leadingBuilder: (insumo) => const Icon(Icons.inventory_2_rounded),
          titleBuilder: (insumo) => Text(insumo.nombre),
          subtitleBuilder: (insumo) =>
              UnidadMedidaNombre(unidadMedidaId: insumo.idUnidad),
          onTapCallback: (insumo) {
            if (insumo.idInsumo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InsumoDetalladoPage(insumoId: insumo.idInsumo!),
                ),
              );
            }
          },
          onEditDismissed: (insumo) async {
            if (insumo.idInsumo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarInsumoPage(insumo: insumo),
                ),
              );
            }
            return false;
          },
          onDeleteDismissed: (insumo) async {
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
                      provider: insumoProvider,
                      id: insumo.idInsumo!,
                      mensajeExito: "El insumo se ha borrado con exito",
                      detalle: false,
                      mensajeError:
                          "Error al eliminar el Insumo, Por favor, intente de nuevo.",
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
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
