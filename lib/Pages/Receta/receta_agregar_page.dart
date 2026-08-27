import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/componente_card.dart';
import 'package:cafe_valdivia/Components/componente_row.dart';
import 'package:cafe_valdivia/Components/costo_estimado_display.dart';
import 'package:cafe_valdivia/Components/save_button.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/core/utils/db_error_handler.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/Receta/receta_provider.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarRecetaPage extends ConsumerStatefulWidget {
  const AgregarRecetaPage({super.key});

  @override
  AgregarRecetaPageState createState() => AgregarRecetaPageState();
}

class AgregarRecetaPageState extends ConsumerState<AgregarRecetaPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _cantidadBaseController = TextEditingController(
    text: '1',
  );
  Articulo? _productoSeleccionado;
  double _totalCostoEstimado = 0.0;
  final List<ComponenteRow> _componentes = [];
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _cantidadBaseController.dispose();
    for (final c in _componentes) {
      c.dispose();
    }
    super.dispose();
  }

  void _agregarComponente() {
    agregarComponente(componentes: _componentes, setState: setState);
  }

  void _removerComponente(int index) {
    removerComponente(index: index, componentes: _componentes, setState: setState);
  }

  void _calcularCostoEstimado(AsyncValue<List<Articulo>> asyncInsumos) {
    if (asyncInsumos is! AsyncData<List<Articulo>>) {
      return;
    }
    final insumos = asyncInsumos.value;
    double total = 0;
    for (final c in _componentes) {
      if (!c.isValid) continue;
      final cantidad = double.tryParse(c.cantidadController.text) ?? 0;
      final costo =
          insumos
              .where((i) => i.id == c.articulo!.id)
              .firstOrNull
              ?.costoUnitario ??
          0;
      total += cantidad * costo;
    }

    setState(() {
      _totalCostoEstimado = total;
    });
  }

  Future<void> _guardar() async {
    if (_productoSeleccionado == null) return;
    if (_productoSeleccionado!.id == null) return;

    final componentesValidos = _componentes.where((c) => c.isValid).toList();
    if (componentesValidos.isEmpty) return;

    final Receta receta = Receta(
      nombre: _nombreController.text,
      idArticuloProducto: _productoSeleccionado!.id!,
      cantidad_base: double.tryParse(_cantidadBaseController.text) ?? 1,
    );

    final List<RecetaDetalle> detalles = componentesValidos.map((c) {
      return RecetaDetalle(
        idReceta: 0,
        idArticulo: c.articulo!.id!,
        cantidad: double.tryParse(c.cantidadController.text) ?? 0,
        idUnidad: c.unidad!.id!,
      );
    }).toList();

    try {
      await ref.read(recetaProviderProvider.notifier).create(receta, detalles);

      if (!context.mounted) return;

      showCustomSnackBar(context: context, mensaje: "Receta creada con exito");
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!context.mounted) return;
      showCustomSnackBar(
        context: context,
        mensaje: traducirErrorBD(e),
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final asyncProductos = debugOverride(
      ref,
      'receta_agregar_productos',
      ref.watch(productosEIntermedioProviderProvider),
    );
    final asyncInsumos = debugOverride(
      ref,
      'receta_agregar_insumos',
      ref.watch(articuloProviderProvider),
    );
    final asyncUms = debugOverride(
      ref,
      'receta_agregar_ums',
      ref.watch(unidadMedidaProvider),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Receta",
          style: tt.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: cs.onPrimaryContainer,
          ),
        ),
        leading: IconButton(
          tooltip: "Cerrar",
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close_rounded),
        ),
        actions: [
          Padding(
            padding: AppPadding.hMd,
            child: SaveButton(
              isLoading: _isLoading,
              semanticsLabel: "Guardar Receta",
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() => _isLoading = true);
                  try {
                    await _guardar();
                  } finally {
                    if (context.mounted) {
                      setState(() => _isLoading = false);
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: AppPadding.formPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBuildTextField(
                text: "Nombre de la receta",
                controller: _nombreController,
                icon: Icons.menu_book_rounded,
                isLoading: _isLoading,
                customValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre de la receta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              asyncProductos.when(
                data: (productos) => DropdownMenu<Articulo>(
                  expandedInsets: EdgeInsets.zero,
                  initialSelection: _productoSeleccionado,
                  label: const Text("Producto final"),
                  onSelected: (Articulo? p) {
                    _calcularCostoEstimado(asyncInsumos);
                    setState(() => _productoSeleccionado = p);
                  },
                  dropdownMenuEntries: productos.map((p) {
                    return DropdownMenuEntry<Articulo>(
                      value: p,
                      label: p.nombre,
                    );
                  }).toList(),
                ),
                error: (e, _) => ErrorRetryField(
                  label: "Producto final",
                  leadingIcon: Icons.category_rounded,
                  onRetry: () => ref.invalidate(productosProviderProvider),
                  showCarita: true,
                ),
                loading: () => SkeletonDropMenu(),
              ),
              const SizedBox(height: 16),
              AppBuildTextField(
                text: "Cantidad base",
                controller: _cantidadBaseController,
                icon: Icons.production_quantity_limits_rounded,
                textInputType: TextInputType.number,
                isLoading: _isLoading,
                suffixText: "unidades",
                customValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la cantidad base';
                  }
                  if ((double.tryParse(value) ?? 0) <= 0) {
                    return 'Debe ser mayor a 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Icon(Icons.view_list_rounded, color: cs.primary),
                  const SizedBox(width: 8),
                  Text(
                    "Componentes",
                    style: tt.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (_componentes.isEmpty)
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLow,
                    borderRadius: AppRadius.mdCircular,
                    border: Border.all(color: cs.outlineVariant, width: 1),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_circle_outline_rounded,
                          size: 48,
                          color: cs.onSurfaceVariant.withValues(alpha: 0.4),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Agrega los ingredientes de la receta",
                          style: tt.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ..._componentes.asMap().entries.map((entry) {
                final index = entry.key;
                final componente = entry.value;
                return ComponenteCard(
                  index: index,
                  componente: componente,
                  asyncInsumos: asyncInsumos,
                  asyncUms: asyncUms,
                  onRemove: () => _removerComponente(index),
                  onArticuloChanged: (a) {
                    _calcularCostoEstimado(asyncInsumos);
                    setState(() => componente.articulo = a);
                    if (a != null &&
                        componente.unidad == null &&
                        asyncUms is AsyncData<List<UnidadMedida>>) {
                      final umList = asyncUms.value;
                      final match = umList.where(
                        (um) => um.id == a.idUnidad,
                      );
                      if (match.isNotEmpty) {
                        setState(() => componente.unidad = match.first);
                      }
                    }
                  },
                  onUnidadChanged: (u) {
                    _calcularCostoEstimado(asyncInsumos);
                    setState(() => componente.unidad = u);
                  },
                  onCantidadChanged: () => _calcularCostoEstimado(asyncInsumos),
                  isLoading: _isLoading,
                );
              }),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _isLoading ? null : _agregarComponente,
                icon: const Icon(Icons.add_rounded),
                label: const Text("Agregar componente"),
              ),
              const SizedBox(height: 16),
              if (_componentes.isNotEmpty)
                CostoEstimadoDisplay(
                  totalCostoEstimado: _totalCostoEstimado,
                  cs: cs,
                  tt: tt,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
