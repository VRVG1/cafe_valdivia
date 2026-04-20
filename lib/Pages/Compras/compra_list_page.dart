import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompraListPage extends ConsumerWidget {
  const CompraListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCompra = ref.watch(compraProvider);
    final ColorScheme cs = Theme.of(context).colorScheme;
    final TextTheme tt = Theme.of(context).textTheme;

    return asyncCompra.when(
      data: (compras) {
        if (compras.isEmpty) {
          return const Center(child: Text('No hay compras para mostrar.'));
        }
        return ListviewCustom<Map<String, dynamic>>(
          data: compras,
          keyBuilder: (Map<String, dynamic> compra) {
            return ValueKey<Object>(
              compra['idCompra'] != null
                  ? 'compra-${compra['idCompra']}'
                  : compra.hashCode,
            );
          },
          leadingBuilder: (Map<String, dynamic> compra) => Icon(
            Icons.inventory_2_rounded,
            color: (compra['pagado'] == 1) ? cs.tertiary : cs.error,
          ),
          titleBuilder: (Map<String, dynamic> compra) => Text(
            compra['nombre_proveedor'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitleBuilder: (Map<String, dynamic> compra) =>
              Text(fecha(compra['fecha'])),
          trailingBuilder: (Map<String, dynamic> compra) =>
              Text("\$${compra['total_compra'].toString()}"),
          onTapCallback: (Map<String, dynamic> compra) {
            if (compra['idCompra'] != null) {
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
            if (compra['idCompra'] != null) {
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
            // if (compra.idCompra != null){

            // final bool confirmar =
            //     await mostrarDialogoConfirmacion(
            //       context: context,
            //       titulo: "Seguro que quiere eliminar este cliente?",
            //       contenido: "Esta accion no se puede deshacer",
            //       textoBotonConfirmacion: "Eliminar",
            //       onConfirm: () => <Future<bool>>{
            //         delete(
            //           context: context,
            //           ref: ref,
            //           provider: compraProvider,
            //           id: compra.idCompra,
            //           mensajeExito: "El compra se ha borrado con exito",
            //           detalle: false,
            //           mensajeError:
            //               "Error al eliminar el Insumo, Por favor, intente de nuevo.",
            //         ),
            //       },
            //     ) ??
            //     false;
            // }

            // if (confirmar) {
            //   return true;
            // }
            return false;
          },
        );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
