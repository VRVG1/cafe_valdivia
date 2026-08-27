import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/save_button.dart';
import 'package:cafe_valdivia/Components/unidad_medida_dropdown.dart';
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
    if (_selectedUnidadMedidad!.id == null) return;

    final Articulo articulo = Articulo(
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      idUnidad: _selectedUnidadMedidad!.id!,
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
          tooltip: "Cerrar",
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close_rounded),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SaveButton(
              isLoading: _isLoading,
              semanticsLabel: "Guardar Articulo",
              onPressed: () async {
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
            ),
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
              AppBuildTextField(
                text: "Nombre",
                controller: _nombreController,
                icon: Icons.person_rounded,
                customValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingrese el Nombre";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              UnidadMedidaDropdown(
                asyncData: asyncUM,
                selectedValue: _selectedUnidadMedidad,
                onChanged: (v) => setState(() => _selectedUnidadMedidad = v),
                onRetry: () => ref.invalidate(unidadMedidaProvider),
              ),
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
                        leadingIcon: const Icon(Icons.category_rounded),
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
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              AppBuildTextField(
                text: "Descripcion",
                controller: _descripcionController,
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 16),
              AppBuildTextField(
                text: "Costo Unitario",
                textInputType: TextInputType.number,
                controller: _costoUnitarioController,
                icon: Icons.attach_money_rounded,
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

}
