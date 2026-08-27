import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/carta_resume.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/resumen_fila.dart';
import 'package:cafe_valdivia/Components/table_resume.dart';
import 'package:cafe_valdivia/Components/transaction_header_card.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/utils/detalle_utils.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetalleCompraPage extends ConsumerWidget {
  const DetalleCompraPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compraAsync = debugOverride(
      ref,
      'detalle_compra',
      ref.watch(compraDetalladaProvider(id)),
    );
    final theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;
    final tt = theme.textTheme;

    return Scaffold(
      appBar: AppBarDetalles<DetalleCompra>(
        title: "Detalle de Compra",
        hasMenu: true,
        onDeletePressed: () {
          mostrarDialogoConfirmacion(
            context: context,
            titulo: "Desea eliminar la compra?",
            contenido: "Esta accion no se puede deshacer.\n",
            textoBotonConfirmacion: "Eliminar",
            onConfirm: () => delete(
              context: context,
              ref: ref,
              provider: compraProvider,
              id: id,
              mensajeExito: "Receta eliminada con exito",
            ),
          );
        },
      ),
      body: compraAsync.when(
        data: (compra) {
          final itemsFormateados = reagruparDetalles(compra['detalles'], precioKey: 'precio_unitario_compra');
          final int numArticulos = numeroDeArticulos(itemsFormateados);
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(compraDetalladaProvider(id)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  seccionEtiqueta("ORDEN", cs),
                  TransactionHeaderCard(
                    chip: Chip(
                      label: Text(
                        (compra['pagado'] == 1) ? "Pagado" : "No Pagado",
                      ),
                      backgroundColor: (compra['pagado'] == 1)
                          ? cs.tertiaryContainer
                          : cs.errorContainer,
                      labelStyle: tt.bodySmall?.copyWith(
                        color: (compra['pagado'] == 1)
                            ? cs.onTertiaryContainer
                            : cs.onErrorContainer,
                        fontWeight: FontWeight.w500,
                      ),
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '#CPR-${compra['id_compra']}-${fechaORD(compra["fecha"])}',
                          style: tt.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: cs.primary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          compra['nombre_proveedor'],
                          style: tt.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          fechaHoraHumano(compra["fecha"]),
                          style: tt.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  seccionEtiqueta("Productos", cs),
                  const SizedBox(height: 8),
                  tableResume(cs, tt, itemsFormateados, [
                    'Producto',
                    'Cantidad',
                    'Precio',
                    'Total',
                  ]),
                  const SizedBox(height: 20),
                  seccionEtiqueta("Resumen", cs),
                  const SizedBox(height: 8),
                  cartaResume(
                    grandTotal: 0,
                    cs: cs,
                    children: [
                      resumenFila(
                        label: "Subtotal ($numArticulos articulos)",
                        value:
                            '\$${double.tryParse(compra['total']) ?? 0.toStringAsFixed(2)}',
                        cs: cs,
                      ),
                      resumenFila(
                        label: "Envido",
                        value: "Gratis",
                        cs: cs,
                        valueColor: cs.tertiary,
                      ),
                      resumenFila(
                        label: "Descuento{Cupon}",
                        value: "0",
                        cs: cs,
                      ),
                      resumenFila(
                        label: "IVA(16%) - no aplica",
                        value: "0",
                        cs: cs,
                      ),
                      const SizedBox(height: 4),
                      Divider(color: cs.outlineVariant),
                      const SizedBox(height: 4),
                      resumenFila(
                        label: "Total",
                        isTotal: true,
                        value: calcularTotal([
                          double.tryParse(compra['total']) ?? 0,
                          0,
                          0,
                          0,
                        ]),
                        cs: cs,
                      ), //TODO: Ver si se implementa el subtotal, envio, descuento, iva
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        error: (err, stack) => ErrorView(
          message: 'Error al cargar la compra',
          description: err.toString(),
          onRetry: () => ref.invalidate(compraDetalladaProvider(id)),
        ),
        loading: () => const SkeletonCompraDetalle(),
      ),
    );
  }
}
