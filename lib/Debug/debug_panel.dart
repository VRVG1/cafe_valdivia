import 'package:cafe_valdivia/Debug/debug_state.dart';
import 'package:cafe_valdivia/services/seed_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _GrupoPagina {
  final String nombre;
  final IconData icono;
  final List<Map<String, String>> paginas;

  const _GrupoPagina({
    required this.nombre,
    required this.icono,
    required this.paginas,
  });
}

const List<_GrupoPagina> _grupos = [
  _GrupoPagina(
    nombre: 'Unidad Medida',
    icono: Icons.straighten,
    paginas: [
      {'key': 'unidad_medida', 'label': 'Lista'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Productos',
    icono: Icons.inventory_2,
    paginas: [
      {'key': 'productos', 'label': 'Lista'},
      {'key': 'agregar_producto', 'label': 'Agregar'},
      {'key': 'editar_producto', 'label': 'Editar'},
      {'key': 'productos_detalles', 'label': 'Detalles'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Clientes',
    icono: Icons.people,
    paginas: [
      {'key': 'clientes', 'label': 'Lista'},
      {'key': 'cliente_detalle', 'label': 'Detalle'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Proveedores',
    icono: Icons.store,
    paginas: [
      {'key': 'proveedores', 'label': 'Lista'},
      {'key': 'proveedor_detalle', 'label': 'Detalle'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Artículos',
    icono: Icons.science,
    paginas: [
      {'key': 'articulos', 'label': 'Lista'},
      {'key': 'agregar_articulo', 'label': 'Agregar'},
      {'key': 'editar_articulo', 'label': 'Editar'},
      {'key': 'articulo_detalle', 'label': 'Detalle'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Compras',
    icono: Icons.shopping_cart,
    paginas: [
      {'key': 'compras', 'label': 'Lista'},
      {'key': 'detalle_compra', 'label': 'Detalle'},
      {'key': 'seleccion_compra', 'label': 'Selección'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Ventas',
    icono: Icons.point_of_sale,
    paginas: [
      {'key': 'ventas', 'label': 'Lista'},
      {'key': 'detalle_venta', 'label': 'Detalle'},
      {'key': 'seleccion_venta', 'label': 'Selección'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Recetas',
    icono: Icons.menu_book,
    paginas: [
      {'key': 'recetas', 'label': 'Lista'},
      {'key': 'receta_detalle', 'label': 'Detalle'},
      {'key': 'detalle_receta_articulo', 'label': 'Detalle (Art.)'},
      {'key': 'detalle_receta_unidad', 'label': 'Detalle (UM)'},
      {'key': 'receta_agregar_productos', 'label': 'Agregar (Prod.)'},
      {'key': 'receta_agregar_insumos', 'label': 'Agregar (Insum.)'},
      {'key': 'receta_agregar_ums', 'label': 'Agregar (UMed.)'},
      {'key': 'receta_editar_productos', 'label': 'Editar (Prod.)'},
      {'key': 'receta_editar_insumos', 'label': 'Editar (Insum.)'},
      {'key': 'receta_editar_ums', 'label': 'Editar (UMed.)'},
    ],
  ),
  _GrupoPagina(
    nombre: 'Órdenes Producción',
    icono: Icons.factory,
    paginas: [
      {'key': 'orden_produccion', 'label': 'Lista'},
      {'key': 'detalle_op', 'label': 'Detalle'},
      {'key': 'detalle_op_articulo', 'label': 'Detalle (Art.)'},
      {'key': 'seleccion_receta', 'label': 'Seleccionar Receta'},
      {'key': 'agregar_op_insumos', 'label': 'Agregar (Insum.)'},
    ],
  ),
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
                if (debug.pagesWithErrors.isNotEmpty ||
                    debug.loadings.isNotEmpty)
                  Semantics(
                    label: "Limpiar todo",
                    hint: "Limpia debug seleccionado",
                    child: TextButton(
                      onPressed: () =>
                          ref.read(debugStateProvider.notifier).clearAll(),
                      child: const Text('Limpiar todo'),
                    ),
                  ),
                IconButton(
                  tooltip: "Cerrar panel de Depuración",
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () async {
                  await seedDatabase();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Base de datos poblada con datos de prueba',
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.dataset_linked),
                label: const Text('Cargar datos de prueba'),
              ),
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final grupo in _grupos) ...[
                  ExpansionTile(
                    leading: Icon(grupo.icono),
                    title: Text(
                      grupo.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    initiallyExpanded: false,
                    children: [
                      for (final pagina in grupo.paginas) ...[
                        SwitchListTile(
                          title: Text(pagina['label']!),
                          subtitle: Text('Error => Key: ${pagina['key']}'),
                          value: debug.shouldFail(pagina['key']!),
                          onChanged: (value) {
                            final notifier = ref.read(
                              debugStateProvider.notifier,
                            );
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
                        SwitchListTile(
                          title: Text(pagina['label']!),
                          subtitle: Text('Loading => Key: ${pagina['key']}'),
                          value: debug.shouldLoad(pagina['key']!),
                          onChanged: (value) {
                            final notifier = ref.read(
                              debugStateProvider.notifier,
                            );
                            if (value) {
                              notifier.forceLoading(pagina['key']!);
                            } else {
                              notifier.clearLoading(pagina['key']!);
                            }
                          },
                        ),
                        if (pagina != grupo.paginas.last)
                          const Divider(height: 1, indent: 16),
                      ],
                    ],
                  ),
                  if (grupo != _grupos.last) const Divider(height: 1),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
