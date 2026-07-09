import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/agregar_orden_produccion_page.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/detalle_orden_produccion_page.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/editar_orden_produccion_page.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/OrdenProduccion/orden_produccion_notifier.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdenProduccionListaPage extends ConsumerWidget {
  const OrdenProduccionListaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncOrdenes = debugOverride(
      ref,
      'orden_produccion',
      ref.watch(ordenProduccionProvider),
    );
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Agregar Producción",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AgregarOrdenProduccionPage(),

              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: asyncOrdenes.when(
        data: (ordenes) {
          if (ordenes.isEmpty) {
            return const Center(
              child: Text('No hay órdenes de producción para mostrar.'),
            );
          }
          return ListviewCustom<Map<String, dynamic>>(
            data: ordenes,
            keyBuilder: (Map<String, dynamic> orden) {
              final id = orden['id_orden_produccion'];
              return ValueKey<Object>(id != null ? 'op-$id' : orden.hashCode);
            },
            leadingBuilder: (Map<String, dynamic> orden) =>
                const Icon(Icons.precision_manufacturing_rounded),
            titleBuilder: (Map<String, dynamic> orden) => Text(
              orden['producto_producido']?.toString() ?? 'Sin producto',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitleBuilder: (Map<String, dynamic> orden) => Text(
              '${fecha(orden['fecha'] ?? '')} · ${orden['receta'] ?? ''}',
            ),
            trailingBuilder: (Map<String, dynamic> orden) => Text(
              '\$${double.tryParse(orden['costo_total_produccion']?.toString() ?? '0')?.toStringAsFixed(2) ?? '0.00'}',
              style: TextStyle(fontWeight: FontWeight.bold, color: cs.primary),
            ),
            onTapCallback: (Map<String, dynamic> orden) {
              final id = orden['id_orden_produccion'];
              if (id != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleOrdenProduccionPage(id: id),
                  ),
                );
              }
            },
            onEditDismissed: (Map<String, dynamic> orden) async {
              final ordenEntity = await ref
                  .read(ordenProduccionRepositoryProvider)
                  .getById(orden['id_orden_produccion'] as int);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditarOrdenProduccionPage(orden: ordenEntity),
                  ),
                );
              }
              return false;
            },
            onDeleteDismissed: (Map<String, dynamic> orden) async {
              final id = orden['id_orden_produccion'] as int;
              final bool confirmacion =
                  await mostrarDialogoConfirmacion(
                    context: context,
                    titulo: "Eliminar orden de producción",
                    contenido: "Esta acción no se puede deshacer",
                    textoBotonConfirmacion: "Eliminar",
                    onConfirm: () => {
                      delete(
                        context: context,
                        ref: ref,
                        provider: ordenProduccionProvider,
                        id: id,
                        mensajeExito: "Orden de producción eliminada con exito",
                        mensajeError:
                            "Error al eliminar la orden de producción",
                        detalle: false,
                      ),
                    },
                  ) ??
                  false;
              if (confirmacion) {
                return true;
              }
              return false;
            },
          );
        },
        error: (err, stack) => ErrorView(
          message: 'Error al cargar las órdenes de producción',
          onRetry: () => ref.invalidate(ordenProduccionProvider),
        ),
        loading: () => SkeletonListTiles(n: 10),
      ),
    );
  }
}
