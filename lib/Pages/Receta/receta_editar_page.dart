import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/Receta/receta_provider.dart';
import 'package:cafe_valdivia/providers/providers.dart';
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

class EditarRecetaPage extends ConsumerStatefulWidget {
  final Receta receta;

  const EditarRecetaPage({super.key, required this.receta});

  @override
  EditarRecetaPageState createState() => EditarRecetaPageState();
}

class EditarRecetaPageState extends ConsumerState<EditarRecetaPage> {
  late final TextEditingController _nombreController;
  late final TextEditingController _cantidadBaseController;
  Articulo? _productoSeleccionado;
  final List<_ComponenteRow> _componentes = [];
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _initialLoadDone = false;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.receta.nombre);
    _cantidadBaseController = TextEditingController(
      text: widget.receta.cantidad_base.toString(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _loadDetalles());
  }

  Future<void> _loadDetalles() async {
    if (_initialLoadDone) return;
    _initialLoadDone = true;

    final repo = ref.read(recetaRepositoryProvider);
    final insumos = await ref.read(articuloProviderProvider.future);
    final ums = await ref.read(unidadMedidaProvider.future);

    if (!mounted) return;

    try {
      final detalles = await repo.getRecetaDetalles(widget.receta.idReceta!);

      setState(() {
        for (final d in detalles) {
          final row = _ComponenteRow();
          row.articulo = insumos
              .where((a) => a.idArticulo == d.idArticulo)
              .firstOrNull;
          row.unidad = ums
              .where((u) => u.idUnidadMedida == d.idUnidad)
              .firstOrNull;
          row.cantidadController.text = d.cantidad.toString();
          _componentes.add(row);
        }
      });
    } catch (_) {}
  }

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
    setState(() => _componentes.add(_ComponenteRow()));
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
    if (widget.receta.idReceta == null) return;

    final componentesValidos = _componentes.where((c) => c.isValid).toList();

    final receta = widget.receta.copyWith(
      nombre: _nombreController.text,
      idArticuloProducto: _productoSeleccionado!.idArticulo!,
      cantidad_base: double.tryParse(_cantidadBaseController.text) ?? 1,
    );

    final List<RecetaDetalle> detalles = componentesValidos.map((c) {
      return RecetaDetalle(
        idReceta: widget.receta.idReceta!,
        idArticulo: c.articulo!.idArticulo!,
        cantidad: double.tryParse(c.cantidadController.text) ?? 0,
        idUnidad: c.unidad!.idUnidadMedida!,
      );
    }).toList();

    try {
      await ref
          .read(recetaRepositoryProvider)
          .updateReceta(receta: receta, detalles: detalles);

      if (!context.mounted) return;

      ref.invalidate(recetaProviderProvider);
      ref.invalidate(recetaDetailProvider(widget.receta.idReceta!));
      ref.invalidate(recetaDetallesProvider(widget.receta.idReceta!));

      showCustomSnackBar(
        context: context,
        mensaje: "Receta actualizada con exito",
      );
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!context.mounted) return;
      showCustomSnackBar(
        context: context,
        mensaje: "Error al actualizar la receta. Intente de nuevo.",
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
      'receta_editar_productos',
      ref.watch(productosProviderProvider),
    );
    final asyncInsumos = debugOverride(
      ref,
      'receta_editar_insumos',
      ref.watch(articuloProviderProvider),
    );
    final asyncUms = debugOverride(
      ref,
      'receta_editar_ums',
      ref.watch(unidadMedidaProvider),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Receta",
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
          Padding(padding: AppPadding.hMd, child: _buildSaveButton(cs)),
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
                data: (productos) {
                  if (_productoSeleccionado == null && productos.isNotEmpty) {
                    final match = productos.where(
                      (p) => p.idArticulo == widget.receta.idArticuloProducto,
                    );
                    if (match.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          setState(() => _productoSeleccionado = match.first);
                        }
                      });
                    }
                  }
                  return DropdownMenu<Articulo>(
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
                  );
                },
                error: (e, _) => ErrorRetryField(
                  label: "Producto final",
                  leadingIcon: Icons.category_rounded,
                  showCarita: true,
                  onRetry: () => ref.invalidate(productosProviderProvider),
                ),
                loading: () => const LinearProgressIndicator(),
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
          borderRadius: AppRadius.mdCircular,
          side: BorderSide(color: cs.outlineVariant),
        ),
        child: Padding(
          padding: AppPadding.allMd,
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
                    tooltip: "Eliminar Componente",
                    onPressed: () => _removerComponente(index),
                    icon: Icon(Icons.delete_outline_rounded, color: cs.error),
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
                error: (e, _) => ErrorRetryField(
                  label: "Artículo",
                  leadingIcon: Icons.inventory_2_rounded,
                  showCarita: true,
                  onRetry: () => ref.invalidate(articuloProviderProvider),
                ),
                loading: () => const LinearProgressIndicator(),
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
                      error: (e, _) => ErrorRetryField(
                        label: "Unidad",
                        leadingIcon: Icons.balance_rounded,
                        showCarita: true,
                        onRetry: () => ref.invalidate(unidadMedidaProvider),
                      ),
                      loading: () => const LinearProgressIndicator(),
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
