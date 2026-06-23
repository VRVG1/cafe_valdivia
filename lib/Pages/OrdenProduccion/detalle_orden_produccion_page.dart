import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/OrdenProduccion/orden_produccion_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetalleOrdenProduccionPage extends ConsumerWidget {
  final int id;

  const DetalleOrdenProduccionPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final asyncOrden = debugOverride(
      ref,
      'detalle_op',
      ref.watch(ordenProduccionDetalladaProvider(id)),
    );

    return Scaffold(
      appBar: AppBarDetalles<Map<String, dynamic>>(
        title: "Orden de Producción",
        hasMenu: true,
        onDeletePressed: () {
          mostrarDialogoConfirmacion(
            context: context,
            titulo: "Eliminar orden",
            contenido:
                "Esta acción no se puede deshacer.\n"
                "Se eliminará la orden y sus consumos.",
            textoBotonConfirmacion: "Eliminar",
            onConfirm: () => delete(
              context: context,
              ref: ref,
              provider: ordenProduccionProvider,
              id: id,
              mensajeExito: "Orden eliminada con exito",
              mensajeError: "Error al eliminar la orden. Intente de nuevo.",
            ),
          );
        },
      ),
      body: asyncOrden.when(
        data: (orden) => RefreshIndicator(
          onRefresh: () async =>
              ref.invalidate(ordenProduccionDetalladaProvider(id)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeaderCard(cs, orden),
                const SizedBox(height: 16),
                DetailsContainer(
                  title: "Información general",
                  elements: [
                    DetailElement(
                      icon: const Icon(Icons.calendar_month_rounded),
                      title: const Text("Fecha"),
                      description: Text(
                        fecha(orden['fecha']?.toString() ?? ''),
                      ),
                    ),
                    DetailElement(
                      icon: const Icon(Icons.menu_book_rounded),
                      title: const Text("Receta"),
                      description: Text(orden['receta']?.toString() ?? ''),
                    ),
                    DetailElement(
                      icon: const Icon(Icons.coffee_rounded),
                      title: const Text("Producto producido"),
                      description: Text(
                        orden['producto_producido']?.toString() ?? '',
                      ),
                    ),
                    DetailElement(
                      icon: const Icon(
                        Icons.production_quantity_limits_rounded,
                      ),
                      title: const Text("Cantidad producida"),
                      description: Text(
                        "${orden['cantidad_producida']} unidades",
                      ),
                    ),
                    if (orden['notas'] != null)
                      DetailElement(
                        icon: const Icon(Icons.notes_rounded),
                        title: const Text("Notas"),
                        description: Text(orden['notas'].toString()),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                DetailsContainer(
                  title: "Costos",
                  elements: [
                    DetailElement(
                      icon: const Icon(Icons.attach_money_rounded),
                      title: const Text("Costo total producción"),
                      description: Text(
                        "\$${double.tryParse(orden['costo_total_produccion']?.toString() ?? '0')?.toStringAsFixed(2) ?? '0.00'}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: cs.primary,
                        ),
                      ),
                    ),
                    if (orden['costo_real_calculado'] != null)
                      DetailElement(
                        icon: const Icon(Icons.compare_arrows_rounded),
                        title: const Text("Costo real calculado"),
                        description: Text(
                          "\$${double.tryParse(orden['costo_real_calculado'].toString())?.toStringAsFixed(2) ?? '0.00'}",
                        ),
                      ),
                    DetailElement(
                      icon: const Icon(Icons.inventory_2_rounded),
                      title: const Text("Insumos diferentes"),
                      description: Text(
                        "${orden['cantidad_insumos_diferentes'] ?? 0}",
                      ),
                    ),
                    DetailElement(
                      icon: const Icon(Icons.summarize_rounded),
                      title: const Text("Total unidades consumidas"),
                      description: Text(
                        "${orden['total_unidades_consumidas'] ?? 0}",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (orden['consumos'] != null)
                  DetailsContainer(
                    title: "Consumo de insumos",
                    elements: [
                      _buildConsumosList(
                        context,
                        ref,
                        orden['consumos'],
                        cs,
                        tt,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        error: (err, stack) =>
            ErrorView(message: 'Error al cargar la orden de producción'),
        loading: () => const SkeletonOrdenProduccionDetalle(),
      ),
    );
  }

  Widget _buildHeaderCard(ColorScheme cs, Map<String, dynamic> orden) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            Icons.precision_manufacturing_rounded,
            color: cs.primary,
            size: 40,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ÓRDEN DE PRODUCCIÓN',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '#OP-${orden['id_orden_produccion']}-${fechaORD(orden['fecha']?.toString() ?? '')}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  orden['producto_producido']?.toString() ?? '',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsumosList(
    BuildContext context,
    WidgetRef ref,
    List<dynamic> consumos,
    ColorScheme cs,
    TextTheme tt,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Insumo",
                style: tt.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurfaceVariant,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Cantidad",
                style: tt.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Costo uni.",
                style: tt.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurfaceVariant,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const Divider(),
        ...consumos.map((consumo) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _ArticuloNombre(
                    articuloId: consumo['id_articulo'] as int,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    (consumo['cantidad_usada'] as num).toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "\$${(consumo['costo_articulo_momento'] as num).toStringAsFixed(2)}",
                    textAlign: TextAlign.right,
                    style: tt.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _ArticuloNombre extends ConsumerWidget {
  final int articuloId;

  const _ArticuloNombre({required this.articuloId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncArticulos = debugOverride(
      ref,
      'detalle_op_articulo',
      ref.watch(articuloProviderProvider),
    );
    return asyncArticulos.when(
      data: (articulos) {
        final match = articulos.where((a) => a.idArticulo == articuloId);
        return Text(match.isNotEmpty ? match.first.nombre : "ID: $articuloId");
      },
      loading: () => SkeletonLine(),
      error: (_, __) => Text("ID: $articuloId"),
    );
  }
}
