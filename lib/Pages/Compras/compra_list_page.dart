import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompraListPage extends ConsumerWidget {
  const CompraListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCompra = ref.watch(compraProvider);

    return asyncCompra.when(
      data: (compras) {
        if (compras.isEmpty) {
          return const Center(child: Text('No hay compras para mostrar.'));
        }
        return ListviewCustom<Map<String, dynamic>>(
          data: compras,
          keyBuilder: (Map<String, dynamic> compra) {
            final compraData = compra['compra'];
            return ValueKey<Object>(
              compraData.idCompra != null
                  ? 'compra-${compraData.idCompra}'
                  : compra.hashCode,
            );
          },
          leadingBuilder: (Map<String, dynamic> compra) =>
              const Icon(Icons.inventory_2_rounded),
          titleBuilder: (Map<String, dynamic> compra) =>
              Text(compra['compra']['nombre_proveedor'] ?? 'Sin Proveedo'),
          subtitleBuilder: (Map<String, dynamic> compra) =>
              Text(compra['compra']['pagado'] ?? "Sin Datos"),
          onTapCallback: (Map<String, dynamic> compra) {
            if (compra['compra'].idCompra != null) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         InsumoDetalladoPage(compraId: compra.idCompra!),
              //   ),
              // );
            }
          },
          onEditDismissed: (Map<String, dynamic> compra) async {
            if (compra['compra'].idCompra != null) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => EditarInsumoPage(compra: compra),
              //   ),
              // );
            }
            return false;
          },
          onDeleteDismissed: (Map<String, dynamic> compra) async {
            final bool confirmar =
                await mostrarDialogoConfirmacion(
                  context: context,
                  titulo: "Seguro que quiere eliminar este cliente?",
                  contenido: "Esta accion no se puede deshacer",
                  textoBotonConfirmacion: "Eliminar",
                  onConfirm: () => <Future<bool>>{
                    delete(
                      context: context,
                      ref: ref,
                      provider: compraProvider,
                      id: compra['compra'].idCompra!,
                      mensajeExito: "El compra se ha borrado con exito",
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
