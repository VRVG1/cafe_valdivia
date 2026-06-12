import 'package:cafe_valdivia/Debug/debug_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<Map<String, String>> _paginas = [
  {'key': 'unidad_medida', 'label': 'Unidad de Medida'},
  {'key': 'productos', 'label': 'Productos'},
  {'key': 'clientes', 'label': 'Clientes'},
  {'key': 'proveedores', 'label': 'Proveedores'},
  {'key': 'articulos', 'label': 'Artículos'},
  {'key': 'compras', 'label': 'Compras'},
  {'key': 'detalle_compra', 'label': 'Detalle Compra'},
  {'key': 'articulo_detalle', 'label': 'Detalle Artículo'},
  {'key': 'proveedor_detalle', 'label': 'Detalle Proveedor'},
  {'key': 'cliente_detalle', 'label': 'Detalle Cliente'},
  {'key': 'ventas', 'label': 'Ventas'},
  {'key': 'detalle_venta', 'label': 'Detalle Venta'},
  {'key': 'recetas', 'label': 'Recetas'},
  {'key': 'receta_detalle', 'label': 'Detalle Receta'},
  {'key': 'orden_produccion', 'label': 'Órdenes Producción'},
  {'key': 'detalle_op', 'label': 'Detalle OP'},
  {'key': 'seleccion_receta', 'label': 'Seleccionar Receta'},
  {'key': 'agregar_articulo', 'label': 'Agregar Artículo'},
  {'key': 'agregar_producto', 'label': 'Agregar Producto'},
  {'key': 'editar_articulo', 'label': 'Editar Artículo'},
  {'key': 'editar_producto', 'label': 'Editar Producto'},
  {'key': 'seleccion_compra', 'label': 'Selección Compra'},
  {'key': 'seleccion_venta', 'label': 'Selección Venta'},
  {'key': 'receta_agregar_productos', 'label': 'Agregar Receta (Prod.)'},
  {'key': 'receta_agregar_insumos', 'label': 'Agregar Receta (Insum.)'},
  {'key': 'receta_agregar_ums', 'label': 'Agregar Receta (UMed.)'},
  {'key': 'receta_editar_productos', 'label': 'Editar Receta (Prod.)'},
  {'key': 'receta_editar_insumos', 'label': 'Editar Receta (Insum.)'},
  {'key': 'receta_editar_ums', 'label': 'Editar Receta (UMed.)'},
  {'key': 'detalle_receta_articulo', 'label': 'Detalle Receta (Art.)'},
  {'key': 'detalle_receta_unidad', 'label': 'Detalle Receta (UM)'},
  {'key': 'detalle_op_articulo', 'label': 'Detalle OP (Art.)'},
  {'key': 'agregar_op_insumos', 'label': 'Agregar OP (Insum.)'},
];

class DebugPanel extends ConsumerWidget {
  const DebugPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debug = ref.watch(debugStateProvider);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                const Icon(Icons.bug_report, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Panel de Depuración',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (debug.pagesWithErrors.isNotEmpty)
                  TextButton(
                    onPressed: () => ref.read(debugStateProvider.notifier).clearAll(),
                    child: const Text('Limpiar todo'),
                  ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final pagina in _paginas) ...[
                  SwitchListTile(
                    title: Text(pagina['label']!),
                    subtitle: Text('Key: ${pagina['key']}'),
                    value: debug.shouldFail(pagina['key']!),
                    onChanged: (value) {
                      final notifier = ref.read(debugStateProvider.notifier);
                      if (value) {
                        notifier.forceError(
                          pagina['key']!,
                          'Error forzado [${pagina['label']}]',
                        );
                      } else {
                        notifier.clearError(pagina['key']!);
                      }
                    },
                  ),
                  if (pagina != _paginas.last) const Divider(height: 1, indent: 16),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
