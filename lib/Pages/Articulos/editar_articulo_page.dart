import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/pop_scope_guard.dart';
import 'package:cafe_valdivia/Components/save_button.dart';
import 'package:cafe_valdivia/Components/unidad_medida_dropdown.dart';
import 'package:cafe_valdivia/Debug/debug_state.dart';
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
  late final TextEditingController _stockController;
  UnidadMedida? _selectedUnidadMedidad;
  bool _isLoading = false;
  bool _initialized = false;
  bool _debugStock = false;

  final _formKey = GlobalKey<FormState>();

  late String _initialDescripcion;
  late String _initialNombre;
  late double _initialCostoUnitario;
  late double _initialStock;
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
    _stockController = TextEditingController(
      text: widget.articulo.stock.toString(),
    );

    _initialDescripcion = widget.articulo.descripcion ?? '';
    _initialNombre = widget.articulo.nombre;
    _initialCostoUnitario = widget.articulo.costoUnitario;
    _initialStock = widget.articulo.stock;
    _initialUnidadMedida = widget.articulo.idUnidad;
  }

  bool get _isDirty {
    return _nombreController.text != _initialNombre ||
        _descripcionController.text != _initialDescripcion ||
        _costoUnitarioController.text != _initialCostoUnitario.toString() ||
        (_debugStock && _stockController.text != _initialStock.toString()) ||
        (_selectedUnidadMedidad?.id ?? _initialUnidadMedida) !=
            _initialUnidadMedida;
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    _nombreController.dispose();
    _costoUnitarioController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Future<void> _update(UnidadMedida unidadInicial) async {
    final unidadFinal = _selectedUnidadMedidad ?? unidadInicial;

    final updatedArticulo = widget.articulo.copyWith(
      id: widget.articulo.id,
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      costoUnitario: double.tryParse(_costoUnitarioController.text) ?? 0.0,
      stock: _debugStock
          ? (double.tryParse(_stockController.text) ?? widget.articulo.stock)
          : widget.articulo.stock,
      idUnidad: unidadFinal.id!,
    );

    update<Articulo>(
      context: context,
      ref: ref,
      provider: articuloProviderProvider,
      element: updatedArticulo,
      mensajeExito: "Se actualizo la Unidad de Medida de forma correcta.",
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _debugStock = ref.watch(debugStateProvider).enabled;
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
                icon: Icon(Icons.close_rounded),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SaveButton(
                    semanticsLabel: "Editar cliente",
                    isLoading: _isLoading,
                    onPressed: () async {
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
                  ),
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
                      icon: Icons.label_rounded,
                    ),
                    const SizedBox(height: 16),
                    Consumer(
                      builder: (context, ref, _) {
                        final asyncUM = debugOverride(
                          ref,
                          'editar_articulo',
                          ref.watch(unidadMedidaProvider),
                        );
                        return UnidadMedidaDropdown(
                          asyncData: asyncUM,
                          selectedValue: _selectedUnidadMedidad,
                          initialValue: unidadInicial,
                          onChanged: (v) =>
                              setState(() => _selectedUnidadMedidad = v),
                          onRetry: () =>
                              ref.invalidate(unidadMedidaProvider),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: "Descripcion",
                      controller: _descripcionController,
                      icon: Icons.description_rounded,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: "Costo Unitario",
                      controller: _costoUnitarioController,
                      icon: Icons.attach_money_rounded,
                    ),
                    if (_debugStock) ...[
                      const SizedBox(height: 16),
                      _buildTextField(
                        label: "Stock",
                        controller: _stockController,
                        icon: Icons.inventory_rounded,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese el Stock';
                          }
                          final parsed = double.tryParse(value);
                          if (parsed == null) {
                            return 'Ingresar un valor numerico correcto';
                          }
                          if (parsed < 0) {
                            return "El stock no puede ser negativo";
                          }
                          return null;
                        },
                      ),
                    ],
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
    TextInputType? textInputType,
    String? Function(String?)? validator,
  }) {
    return AppBuildTextField(
      text: label,
      controller: controller,
      icon: icon,
      textInputType: textInputType,
      isLoading: _isLoading,
      onChanged: (value) => setState(() {}),
      customValidator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, ingrese el $label';
            }
            return null;
          },
    );
  }
}
