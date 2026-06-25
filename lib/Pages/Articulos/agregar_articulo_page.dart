import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarArticuloPage extends ConsumerStatefulWidget {
  const AgregarArticuloPage({super.key});

  @override
  AgregarArticuloPageState createState() => AgregarArticuloPageState();
}

class AgregarArticuloPageState extends ConsumerState<AgregarArticuloPage> {
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _costoUnitarioController =
      TextEditingController();
  UnidadMedida? _selectedUnidadMedidad;
  String tipoSeleccionado = ArticuloTipo.insumo.value;

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    _nombreController.dispose();
    _costoUnitarioController.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    if (_selectedUnidadMedidad == null) return;
    if (_selectedUnidadMedidad!.idUnidadMedida == null) return;

    final Articulo articulo = Articulo(
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      idUnidad: _selectedUnidadMedidad!.idUnidadMedida!,
      costoUnitario: double.tryParse(_costoUnitarioController.text) ?? 0.0,
      precioVenta: 0.0,
      stock: 0.0,
      tipo: ArticuloTipo.fromValue(tipoSeleccionado),
    );
    create<Articulo>(
      context: context,
      ref: ref,
      provider: articuloProviderProvider,
      element: articulo,
      mensajeExito: "El Articulo se guardo con exito",
      mensajeError: "Error al guardar el Articulo. Por favor, inente de nuevo.",
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final asyncUM = debugOverride(
      ref,
      'agregar_articulo',
      ref.watch(unidadMedidaProvider),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Articulo",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildActionButtons(context),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                text: "Nombre",
                controller: _nombreController,
                icon: Icons.person_outline,
                customValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingrese el Nombre";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildDropDownMenu(asyncUM),
              const SizedBox(height: 16),
              FormField<String>(
                initialValue: ArticuloTipo.insumo.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tienes que elegir algún tipo de artículo";
                  }
                  return null;
                },
                builder: (FormFieldState<String> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownMenu<String>(
                        initialSelection: tipoSeleccionado,
                        leadingIcon: const Icon(Icons.category),
                        label: const Text("Tipo"),
                        expandedInsets: EdgeInsets.zero,
                        requestFocusOnTap: true,
                        onSelected: (String? tipo) {
                          tipoSeleccionado = tipo ?? ArticuloTipo.insumo.value;
                          state.didChange(tipo);
                        },
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: ArticuloTipo.insumo.value,
                            label: "Insumo",
                          ),
                          DropdownMenuEntry(
                            value: ArticuloTipo.productoIntermedio.value,
                            label: "Producto Intermedio",
                          ),
                        ],
                      ),
                      if (state.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 12),
                          child: Text(
                            state.errorText!,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Descripcion",
                controller: _descripcionController,
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Costo Unitario",
                textInputType: TextInputType.number,
                controller: _costoUnitarioController,
                icon: Icons.attach_money,
                customValidator: (value) {
                  final numero = double.tryParse(value ?? "Necesito ayuda");
                  if (numero == null) {
                    return 'Ingrese un número válido';
                  }
                  if (numero < 0) {
                    return 'El costo no puede ser negativo';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String text,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? textInputType,
    String? Function(String?)? customValidator,
  }) {
    return TextFormField(
      enabled: !_isLoading,
      keyboardType: textInputType,
      controller: controller,
      validator: customValidator,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildDropDownMenu(AsyncValue<List<UnidadMedida>> asyncUM) {
    return asyncUM.when(
      data: (ums) {
        return FormField<UnidadMedida>(
          initialValue: _selectedUnidadMedidad,
          validator: (value) {
            if (value == null) {
              return "Ingresa una unidad de medida";
            }
            return null;
          },
          builder: (FormFieldState<UnidadMedida> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu<UnidadMedida>(
                  label: const Text("Unidad de Medida"),
                  leadingIcon: const Icon(Icons.balance_rounded),
                  expandedInsets: EdgeInsets.zero,
                  initialSelection: state.value,
                  onSelected: (UnidadMedida? unidadMedida) {
                    state.didChange(unidadMedida);
                    setState(() {
                      _selectedUnidadMedidad = unidadMedida;
                    });
                  },
                  dropdownMenuEntries: ums.map((unidadMedida) {
                    return DropdownMenuEntry<UnidadMedida>(
                      value: unidadMedida,
                      label: unidadMedida.nombre,
                    );
                  }).toList(),
                ),
                // ← Muestra el error de validación
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 12),
                    child: Text(
                      state.errorText!,
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
      loading: () => SkeletonDropMenu(),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FilledButton(
          // El botón se deshabilita si el formulario no es válido
          onPressed: _isLoading
              ? null
              : () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      await _guardar();
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
      ],
    );
  }
}
