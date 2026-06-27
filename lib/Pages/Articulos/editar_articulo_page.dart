import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/pop_scope_guard.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_notifier.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditarArticuloPage extends ConsumerStatefulWidget {
  final Articulo articulo;
  const EditarArticuloPage({super.key, required this.articulo});

  @override
  EditarArticuloPageState createState() => EditarArticuloPageState();
}

class EditarArticuloPageState extends ConsumerState<EditarArticuloPage> {
  late final TextEditingController _descripcionController;
  late final TextEditingController _nombreController;
  late final TextEditingController _costoUnitarioController;
  UnidadMedida? _selectedUnidadMedidad;
  bool _isLoading = false;
  bool _initialized = false;

  final _formKey = GlobalKey<FormState>();

  late String _initialDescripcion;
  late String _initialNombre;
  late double _initialCostoUnitario;
  late int _initialUnidadMedida;

  @override
  void initState() {
    super.initState();
    _descripcionController = TextEditingController(
      text: widget.articulo.descripcion,
    );
    _nombreController = TextEditingController(text: widget.articulo.nombre);
    _costoUnitarioController = TextEditingController(
      text: widget.articulo.costoUnitario.toString(),
    );

    _initialDescripcion = widget.articulo.descripcion ?? '';
    _initialNombre = widget.articulo.nombre;
    _initialCostoUnitario = widget.articulo.costoUnitario;
    _initialUnidadMedida = widget.articulo.idUnidad;
  }

  bool get _isDirty {
    return _nombreController.text != _initialNombre ||
        _descripcionController.text != _initialDescripcion ||
        _costoUnitarioController.text != _initialCostoUnitario.toString() ||
        (_selectedUnidadMedidad?.idUnidadMedida ?? _initialUnidadMedida) !=
            _initialUnidadMedida;
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    _nombreController.dispose();
    _costoUnitarioController.dispose();
    super.dispose();
  }

  Future<void> _update(UnidadMedida unidadInicial) async {
    final unidadFinal = _selectedUnidadMedidad ?? unidadInicial;

    final updatedArticulo = widget.articulo.copyWith(
      idArticulo: widget.articulo.idArticulo,
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      costoUnitario: double.tryParse(_costoUnitarioController.text) ?? 0.0,
      idUnidad: unidadFinal.idUnidadMedida!,
    );

    await ref
        .read(articuloProviderProvider.notifier)
        .updateElement(updatedArticulo);

    update<Articulo>(
      context: context,
      ref: ref,
      provider: articuloProviderProvider,
      element: updatedArticulo,
      mensajeExito: "Se actualizo la Unidad de Medida de forma correcta.",
      mensajeError:
          "Error al actualizar la Unidad de Medidad, Por favor intente de nuevo.",
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final unidadMedidaAsync = debugOverride(
      ref,
      'editar_articulo',
      ref.watch(unidadMedidaDetailProvider(widget.articulo.idUnidad)),
    );

    return unidadMedidaAsync.when(
      loading: () => SkeletonEditar(editarName: "Editar Articulo"),
      error: (e, _) => Scaffold(
        body: ErrorView(
          message: 'Error cargando unidad de medida',
          description: e.toString(),
        ),
      ),
      data: (unidadInicial) {
        if (!_initialized) {
          _selectedUnidadMedidad = unidadInicial;
          _initialized = true;
        }
        return PopScopeGuard(
          isDirty: _isDirty,
          isLoading: _isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Editar Articulo",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              leading: IconButton(
                tooltip: "Cerrar",
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildActionButtons(context, unidadInicial),
                ),
              ],
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(
                      label: "Nombre",
                      controller: _nombreController,
                      icon: Icons.label_outline,
                    ),
                    const SizedBox(height: 16),
                    _buildDropDownMenu(unidadInicial),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: "Descripcion",
                      controller: _descripcionController,
                      icon: Icons.description_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: "Costo Unitario",
                      controller: _costoUnitarioController,
                      icon: Icons.attach_money,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextFormField(
      enabled: !_isLoading,
      controller: controller,
      onChanged: (value) {
        setState(() {});
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }

  //TODO: Hay que refactorizar esta funcion, ya que esta elaborada con las patas.
  Widget _buildDropDownMenu(UnidadMedida unidadInicial) {
    return Consumer(
      builder: (context, ref, child) {
        final asyncUM = debugOverride(
          ref,
          'editar_articulo',
          ref.watch(unidadMedidaProvider),
        );
        return asyncUM.when(
          data: (ums) {
            return FormField<UnidadMedida>(
              initialValue: unidadInicial,
              validator: (value) {
                if (_selectedUnidadMedidad == null) {
                  return 'Por favor, selecciona una unidad';
                }
                return null;
              },
              builder: (FormFieldState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownMenu<UnidadMedida>(
                      label: const Text("Unidad de Medida"),
                      leadingIcon: const Icon(Icons.balance_rounded),
                      expandedInsets: EdgeInsets.zero,
                      initialSelection: _selectedUnidadMedidad,
                      onSelected: (UnidadMedida? unidadMedida) {
                        setState(() {
                          _selectedUnidadMedidad = unidadMedida;
                          FormFieldState.didChange(unidadMedida);
                        });
                      },
                      dropdownMenuEntries: ums.map((unidadMedida) {
                        return DropdownMenuEntry<UnidadMedida>(
                          value: unidadMedida,
                          label: unidadMedida.nombre,
                        );
                      }).toList(),
                    ),
                    if (FormFieldState.hasError)
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 8),
                        child: Text(
                          FormFieldState.errorText!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
          error: (err, stack) => ErrorRetryField(
            label: "Unidad de Medida",
            leadingIcon: Icons.balance_rounded,
            showCarita: true,
            onRetry: () => ref.invalidate(unidadMedidaProvider),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context, UnidadMedida unidadInicial) {
    final theme = Theme.of(context);

    return Semantics(
      label: "Guardar Cambios",
      child: FilledButton(
        onPressed: _isLoading
            ? null
            : () async {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    _isLoading = true;
                  });
                  try {
                    await _update(unidadInicial);
                  } finally {
                    if (context.mounted) {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  }
                }
              },
        child: _isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: theme.colorScheme.onSecondaryContainer,
                  strokeWidth: 2,
                ),
              )
            : const Text("Guardar"),
      ),
    );
  }
}
