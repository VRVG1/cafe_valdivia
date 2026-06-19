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
  String? tipoSeleccionado;

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _submitted = false;

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
    if (_selectedUnidadMedidad == null || tipoSeleccionado == null) return;
    if (_selectedUnidadMedidad!.idUnidadMedida == null) return;

    final Articulo articulo = Articulo(
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      idUnidad: _selectedUnidadMedidad!.idUnidadMedida!,
      costoUnitario: double.tryParse(_costoUnitarioController.text) ?? 0.0,
      precioVenta: 0.0,
      stock: 0.0,
      tipo: ArticuloTipo.fromValue(tipoSeleccionado!),
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
              ),
              const SizedBox(height: 16),
              _buildDropDownMenu(asyncUM),
              const SizedBox(height: 16),
              DropdownMenu<String>(
                initialSelection: ArticuloTipo.insumo.value,
                expandedInsets: EdgeInsets.zero,
                requestFocusOnTap: true,
                label: const Text("Tipo"),
                onSelected: (String? tipo) {
                  setState(() {
                    tipoSeleccionado = tipo;
                  });
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
  }) {
    return TextFormField(
      enabled: !_isLoading,
      keyboardType: textInputType,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el $text';
        }
        return null;
      },
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu<UnidadMedida>(
              label: const Text("Unidad de Medida"),
              expandedInsets: EdgeInsets.zero,
              leadingIcon: const Icon(Icons.balance_rounded),
              initialSelection: _selectedUnidadMedidad,
              onSelected: (UnidadMedida? unidadMedida) {
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
            if (_submitted && _selectedUnidadMedidad == null)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: Text(
                  'Por favor, selecciona una unidad',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
      error: (err, stack) =>
          ErrorView(message: 'Error al cargar los artículos'),
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
