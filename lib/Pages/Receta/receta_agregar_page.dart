import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/Receta/receta_provider.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _ComponenteRow {
  Articulo? articulo;
  UnidadMedida? unidad;
  TextEditingController cantidadController = TextEditingController();

  void dispose() {
    cantidadController.dispose();
  }

  bool get isValid =>
      articulo != null &&
      unidad != null &&
      (double.tryParse(cantidadController.text) ?? 0) > 0;
}

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
  final List<_ComponenteRow> _componentes = [];
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
    setState(() {
      _componentes.add(_ComponenteRow());
    });
  }

  void _removerComponente(int index) {
    setState(() {
      _componentes[index].dispose();
      _componentes.removeAt(index);
    });
  }

  Future<void> _guardar() async {
    if (_productoSeleccionado == null) return;
    if (_productoSeleccionado!.idArticulo == null) return;

    final componentesValidos = _componentes.where((c) => c.isValid).toList();
    if (componentesValidos.isEmpty) return;

    final Receta receta = Receta(
      nombre: _nombreController.text,
      idArticuloProducto: _productoSeleccionado!.idArticulo!,
      cantidad_base: double.tryParse(_cantidadBaseController.text) ?? 1,
    );

    final List<RecetaDetalle> detalles = componentesValidos.map((c) {
      return RecetaDetalle(
        idReceta: 0,
        idArticulo: c.articulo!.idArticulo!,
        cantidad: double.tryParse(c.cantidadController.text) ?? 0,
        idUnidad: c.unidad!.idUnidadMedida!,
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
        mensaje: "Error al crear la receta. Por favor, intente de nuevo.",
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
      ref.watch(productosProviderProvider),
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
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSaveButton(cs),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                enabled: !_isLoading,
                controller: _nombreController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre de la receta';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Nombre de la receta",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.menu_book_rounded),
                ),
              ),
              const SizedBox(height: 16),
              asyncProductos.when(
                data: (productos) => DropdownMenu<Articulo>(
                  expandedInsets: EdgeInsets.zero,
                  initialSelection: _productoSeleccionado,
                  label: const Text("Producto final"),
                  onSelected: (Articulo? p) {
                    setState(() => _productoSeleccionado = p);
                  },
                  dropdownMenuEntries: productos.map((p) {
                    return DropdownMenuEntry<Articulo>(
                      value: p,
                      label: p.nombre,
                    );
                  }).toList(),
                ),
                error: (e, _) => Text("Error: $e"),
                loading: () => SkeletonDropMenu(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                enabled: !_isLoading,
                controller: _cantidadBaseController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la cantidad base';
                  }
                  if ((double.tryParse(value) ?? 0) <= 0) {
                    return 'Debe ser mayor a 0';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Cantidad base",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.production_quantity_limits_rounded,
                  ),
                  suffixText: "unidades",
                ),
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
                    borderRadius: BorderRadius.circular(16),
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
                return _buildComponenteCard(
                  index: index,
                  componente: componente,
                  asyncInsumos: asyncInsumos,
                  asyncUms: asyncUms,
                  cs: cs,
                  tt: tt,
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
                _buildCostoEstimado(asyncInsumos, cs, tt),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComponenteCard({
    required int index,
    required _ComponenteRow componente,
    required AsyncValue<List<Articulo>> asyncInsumos,
    required AsyncValue<List<UnidadMedida>> asyncUms,
    required ColorScheme cs,
    required TextTheme tt,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: cs.outlineVariant),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Componente ${index + 1}",
                    style: tt.labelLarge?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => _removerComponente(index),
                    icon: Icon(Icons.delete_outline_rounded, color: cs.error),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              asyncInsumos.when(
                data: (insumos) => DropdownMenu<Articulo>(
                  expandedInsets: EdgeInsets.zero,
                  initialSelection: componente.articulo,
                  label: const Text("Artículo"),
                  leadingIcon: const Icon(Icons.inventory_2_rounded),
                  onSelected: (Articulo? a) {
                    setState(() => componente.articulo = a);
                    if (a != null &&
                        componente.unidad == null &&
                        asyncUms is AsyncData<List<UnidadMedida>>) {
                      final umList = asyncUms.value;
                      final match = umList.where(
                        (um) => um.idUnidadMedida == a.idUnidad,
                      );
                      if (match.isNotEmpty) {
                        setState(() => componente.unidad = match.first);
                      }
                    }
                  },
                  dropdownMenuEntries: insumos.map((a) {
                    return DropdownMenuEntry<Articulo>(
                      value: a,
                      label: a.nombre,
                    );
                  }).toList(),
                ),
                error: (e, _) => Text("Error: $e"),
                loading: () => SkeletonDropMenu(),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      enabled: !_isLoading,
                      controller: componente.cantidadController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Cantidad",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: asyncUms.when(
                      data: (ums) => DropdownMenu<UnidadMedida>(
                        expandedInsets: EdgeInsets.zero,
                        initialSelection: componente.unidad,
                        label: const Text("Unidad"),
                        onSelected: (UnidadMedida? u) {
                          setState(() => componente.unidad = u);
                        },
                        dropdownMenuEntries: ums.map((u) {
                          return DropdownMenuEntry<UnidadMedida>(
                            value: u,
                            label: u.nombre,
                          );
                        }).toList(),
                      ),
                      error: (e, _) => Text("Error: $e"),
                      loading: () => SkeletonDropMenu(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCostoEstimado(
    AsyncValue<List<Articulo>> asyncInsumos,
    ColorScheme cs,
    TextTheme tt,
  ) {
    if (asyncInsumos is! AsyncData<List<Articulo>>) {
      return const SizedBox.shrink();
    }
    final insumos = asyncInsumos.value;
    double total = 0;
    for (final c in _componentes) {
      if (!c.isValid) continue;
      final cantidad = double.tryParse(c.cantidadController.text) ?? 0;
      final costo =
          insumos
              .where((i) => i.idArticulo == c.articulo!.idArticulo)
              .firstOrNull
              ?.costoUnitario ??
          0;
      total += cantidad * costo;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.tertiaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.calculate_rounded, color: cs.tertiary),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Costo estimado",
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(ColorScheme cs) {
    return FilledButton(
      onPressed: _isLoading
          ? null
          : () async {
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
      child: _isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: cs.onSecondaryContainer,
                strokeWidth: 2,
              ),
            )
          : const Text("Guardar"),
    );
  }
}
