import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/carta_resume.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/resumen_fila.dart';
import 'package:cafe_valdivia/Components/table_resume.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetalleCompraPage extends ConsumerWidget {
  const DetalleCompraPage({super.key, required this.id});
  final int id;

  List<Map<String, dynamic>> _reagruparDetalles(List<dynamic> detalles) {
    return detalles.map((element) {
      return {
        "producto": element['nombre_articulo']?.toString() ?? 'Sin nombre',
        "cantidad": element['cantidad']?.toString() ?? '0',
        "precio": element['precio_unitario_compra']?.toString() ?? '0.00',
        "total": element['subtotal']?.toString() ?? '0.00',
      };
    }).toList();
  }

  int _numeroDeArticulos(List<Map<String, dynamic>> lista) {
    return lista.fold<int>(
      0,
      (int t, Map<String, dynamic> e) =>
          t + (int.tryParse(e['cantidad'].toString()) ?? 0),
    );
  }

  String _calcularTotal(List<double> cantidades) {
    double total = cantidades.fold(0.0, (t, e) => t + e);

    return "\$${total.toStringAsFixed(2)}";
  }

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
              mensajeError:
                  "Error al eliminar la receta. Por favor, intente de nuevo.",
            ),
          );
        },
      ),
      body: compraAsync.when(
        data: (compra) {
          final itemsFormateados = _reagruparDetalles(compra['detalles']);
          final int numeroDeArticulos = _numeroDeArticulos(itemsFormateados);
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(compraDetalladaProvider(id)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  seccionEtiqueta("ORDEN", cs),
                  _headerCard(
                    tt,
                    cs,
                    compra['id_compra'],
                    compra["fecha"],
                    compra['pagado'] ?? 0,
                    compra['nombre_proveedor'],
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
                        label: "Subtotal ($numeroDeArticulos articulos)",
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
                        value: _calcularTotal([
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

  Widget _headerCard(
    TextTheme tt,
    ColorScheme cs,
    int idCompra,
    String fechaRaw,
    int pagado,
    String nombreProveedor,
  ) {
    final fechaID = fechaORD(fechaRaw);
    final fechaChida = fechaHoraHumano(fechaRaw);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#CPR-$idCompra-$fechaID', //TODO: ESTARIA BIEN PONER AL FINAL EL NUMERO DE COMPRAS DE ESE DIA 001
                  style: tt.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  nombreProveedor,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 2),
                Text(
                  //'24 abr 2026 · 10:32 AM',
                  fechaChida,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Chip(
            label: Text((pagado == 1) ? "Pagado" : "No Pagado"),
            backgroundColor: (pagado == 1)
                ? cs.tertiaryContainer
                : cs.errorContainer,
            labelStyle: tt.bodySmall?.copyWith(
              color: (pagado == 1)
                  ? cs.onTertiaryContainer
                  : cs.onErrorContainer,
              fontWeight: FontWeight.w500,
            ),
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
        ],
      ),
    );
  }
}
