import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Insumo/editar_insumo_page.dart';
import 'package:cafe_valdivia/Pages/Insumo/insumo_detallado_page.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/Pages/Insumo/unidad_medida_nombre.dart';
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
              insumo.id != null ? 'insumo-${insumo.id}' : insumo.hashCode,
            );
          },
          leadingBuilder: (insumo) => const Icon(Icons.inventory_2_rounded),
          titleBuilder: (insumo) => Text(insumo.nombre),
          subtitleBuilder: (insumo) =>
              UnidadMedidaNombre(unidadMedidaId: insumo.idUnidad),
          onTapCallback: (insumo) {
            if (insumo.id != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InsumoDetalladoPage(insumoId: insumo.id!),
                ),
              );
            }
          },
          onEditDismissed: (insumo) async {
            if (insumo.id != null) {
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
                await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmar Eliminación'),
                    content: Text(
                      '¿Estás seguro de que quieres eliminar ${insumo.nombre}?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
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
