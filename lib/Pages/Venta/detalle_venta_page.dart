import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/carta_resume.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/resumen_fila.dart';
import 'package:cafe_valdivia/Components/table_resume.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/Venta/venta_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetalleVentaPage extends ConsumerWidget {
  const DetalleVentaPage({super.key, required this.id});
  final int id;

  List<Map<String, dynamic>> _reagruparDetalles(List<dynamic> detalles) {
    return detalles.map((element) {
      return {
        "producto": element['nombre_articulo']?.toString() ?? 'Sin nombre',
        "cantidad": element['cantidad']?.toString() ?? '0',
        "precio": element['precio_unitario_venta']?.toString() ?? '0.00',
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
    final ventaAsync = debugOverride(
      ref,
      'detalle_venta',
      ref.watch(ventaDetalladaProvider(id)),
    );
    final theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;
    final tt = theme.textTheme;

    return Scaffold(
      appBar: AppBarDetalles<DetalleCompra>(
        title: "Detalle de Venta",
      ),
      body: ventaAsync.when(
        data: (venta) {
          final infoVenta = venta['venta'] as Map<String, dynamic>;
          final detalles = venta['detalles'] as List<dynamic>;
          final itemsFormateados = _reagruparDetalles(detalles);
          final int numeroDeArticulos = _numeroDeArticulos(itemsFormateados);

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(ventaDetalladaProvider(id)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _headerCard(cs, tt, infoVenta),
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
                        label: "Subtotal ($numeroDeArticulos artículos)",
                        value:
                            '\$${double.tryParse(venta['total']?.toString() ?? '0')?.toStringAsFixed(2) ?? '0.00'}',
                        cs: cs,
                      ),
                      resumenFila(label: "Descuento", value: "0", cs: cs),
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
                          double.tryParse(venta['total']?.toString() ?? '0') ??
                              0,
                          0,
                          0,
                        ]),
                        cs: cs,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        error: (err, stack) => ErrorView(
          message: 'Error al cargar la venta',
          description: err.toString(),
          onRetry: () => ref.invalidate(ventaDetalladaProvider(id)),
        ),
        loading: () => const SkeletonCompraDetalle(),
      ),
    );
  }

  Widget _headerCard(ColorScheme cs, TextTheme tt, Map<String, dynamic> infoVenta) {
    final pagado = infoVenta['pagado'];
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
                  'VENTA',
                  style: tt.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '#VEN-${infoVenta['id_venta']}-${fechaORD(infoVenta['fecha'] ?? '')}',
                  style: tt.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${infoVenta['nombre_cliente'] ?? ''} ${infoVenta['apellido_cliente'] ?? ''}',
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 2),
                Text(
                  fecha(infoVenta['fecha'] ?? ''),
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Chip(
            label: Text(pagado == 1 ? "Pagado" : "No Pagado"),
            backgroundColor: pagado == 1
                ? cs.tertiaryContainer
                : cs.errorContainer,
            labelStyle: tt.bodySmall?.copyWith(
              color: pagado == 1 ? cs.onTertiaryContainer : cs.onErrorContainer,
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
