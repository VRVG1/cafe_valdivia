import 'package:cafe_valdivia/Components/carta_resume.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/resumen_fila.dart';
import 'package:cafe_valdivia/Components/table_resume.dart';
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
    final compraAsync = ref.watch(compraDetalladaProvider(id));
    final theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;

    return compraAsync.when(
      data: (compra) {
        final itemsFormateados = _reagruparDetalles(compra['detalles']);
        final int numeroDeArticulos = _numeroDeArticulos(itemsFormateados);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Detalle de Compra",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            elevation: 0,
            actions: const [],
          ),
          body: RefreshIndicator(
            onRefresh: () async => ref.invalidate(compraDetalladaProvider(id)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _headerCard(
                    cs,
                    compra['id_compra'],
                    fechaORD(compra["fecha"]),
                    compra['pagado'] ?? 0,
                  ),
                  const SizedBox(height: 20),
                  seccionEtiqueta("Productos", cs),
                  const SizedBox(height: 8),
                  tableResume(cs, itemsFormateados, [
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
                            '\$${double.tryParse(compra['total']) ?? 0.toStringAsFixed(0)}',
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
          ),
        );
      },
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: ErrorView(
          message: 'Error al cargar la compra',
          description: err.toString(),
          onRetry: () => ref.invalidate(compraDetalladaProvider(id)),
        ),
      ),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _headerCard(ColorScheme cs, int idCompra, String fecha, int pagado) {
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
                  'ORDEN',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '#ORD-$idCompra-$fecha',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Nombre proveedor',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 2),
                Text(
                  '24 abr 2026 · 10:32 AM',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Chip(
            label: Text((pagado == 1) ? "Pagado" : "No Pagado"),
            backgroundColor: (pagado == 1)
                ? cs.tertiaryContainer
                : cs.errorContainer,
            labelStyle: TextStyle(
              color: (pagado == 1)
                  ? cs.onTertiaryContainer
                  : cs.onErrorContainer,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
        ],
      ),
    );
  }

  //  Widget _tableResume(ColorScheme cs, List<Map<String, dynamic>> items) {
  //    return ClipRRect(
  //      borderRadius: BorderRadius.circular(16),
  //      child: Table(
  //        columnWidths: const {
  //          0: FlexColumnWidth(3.0),
  //          1: FlexColumnWidth(1.5),
  //          2: FlexColumnWidth(1.8),
  //          3: FlexColumnWidth(1.8),
  //        },
  //        children: [
  //          TableRow(
  //            decoration: BoxDecoration(color: cs.primary),
  //            children: ['Producto', 'Cantidad', 'Precio', 'Total']
  //                .map(
  //                  (h) => Padding(
  //                    padding: const EdgeInsets.symmetric(
  //                      horizontal: 12,
  //                      vertical: 11,
  //                    ),
  //                    child: Text(
  //                      h,
  //                      style: TextStyle(
  //                        color: cs.onPrimary,
  //                        fontSize: 14,
  //                        fontWeight: FontWeight.w600,
  //                      ),
  //                      textAlign: h == 'Precio' || h == 'Total'
  //                          ? TextAlign.right
  //                          : TextAlign.left,
  //                    ),
  //                  ),
  //                )
  //                .toList(),
  //          ),
  //          ...items.asMap().entries.map((entry) {
  //            final i = entry.key;
  //            final item = entry.value;
  //            final isEven = i.isEven;

  //            return TableRow(
  //              decoration: BoxDecoration(
  //                color: isEven ? cs.surface : cs.surfaceContainerLowest,
  //                border: Border(
  //                  bottom: BorderSide(
  //                    color: cs.outlineVariant.withOpacity(0.5),
  //                    width: 0.5,
  //                  ),
  //                ),
  //              ),
  //              children: [
  //                Padding(
  //                  padding: const EdgeInsets.symmetric(
  //                    horizontal: 12,
  //                    vertical: 10,
  //                  ),
  //                  child: Row(
  //                    children: [
  //                      Expanded(
  //                        child: Column(
  //                          crossAxisAlignment: CrossAxisAlignment.start,
  //                          children: [
  //                            Text(
  //                              item['producto'],
  //                              style: const TextStyle(
  //                                fontSize: 14,
  //                                fontWeight: FontWeight.w500,
  //                              ),
  //                              overflow: TextOverflow.ellipsis,
  //                            ),
  //                          ],
  //                        ),
  //                      ),
  //                    ],
  //                  ),
  //                ),
  //                //Cantidad
  //                Padding(
  //                  padding: const EdgeInsets.symmetric(vertical: 10),
  //                  child: Center(
  //                    child: Container(
  //                      padding: const EdgeInsets.symmetric(
  //                        horizontal: 8,
  //                        vertical: 3,
  //                      ),
  //                      decoration: BoxDecoration(
  //                        color: cs.primaryContainer,
  //                        borderRadius: BorderRadius.circular(20),
  //                      ),
  //                      child: Text(
  //                        item['cantidad'],
  //                        style: TextStyle(
  //                          fontSize: 14,
  //                          fontWeight: FontWeight.w600,
  //                          color: cs.onPrimaryContainer,
  //                        ),
  //                      ),
  //                    ),
  //                  ),
  //                ),
  //                Padding(
  //                  padding: const EdgeInsets.symmetric(
  //                    horizontal: 12,
  //                    vertical: 10,
  //                  ),
  //                  child: Text(
  //                    item['precio'],
  //                    style: TextStyle(fontSize: 14, color: cs.onSurfaceVariant),
  //                    textAlign: TextAlign.right,
  //                  ),
  //                ),
  //                Padding(
  //                  padding: const EdgeInsets.symmetric(
  //                    horizontal: 12,
  //                    vertical: 10,
  //                  ),
  //                  child: Text(
  //                    item['total'],
  //                    style: TextStyle(fontSize: 14, color: cs.onSurfaceVariant),
  //                    textAlign: TextAlign.right,
  //                  ),
  //                ),
  //              ],
  //            );
  //          }),
  //        ],
  //      ),
  //    );
  //  }
}
