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

class ProductoAgregarPage extends ConsumerStatefulWidget {
  const ProductoAgregarPage({super.key});

  @override
  ProductoAgregarPageState createState() => ProductoAgregarPageState();
}

class ProductoAgregarPageState extends ConsumerState<ProductoAgregarPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  UnidadMedida? _selectedUnidadMedidad;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  void _crearProducto() {
    final Articulo producto = Articulo(
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      tipo: ArticuloTipo.producto,
      idUnidad: _selectedUnidadMedidad!.idUnidadMedida!,
      costoUnitario: 0.0,
      precioVenta: double.tryParse(_precioController.text) ?? 0.0,
      stock: double.tryParse(_stockController.text) ?? 0.0,
    );
    create<Articulo>(
      context: context,
      ref: ref,
      provider: articuloProviderProvider,
      element: producto,
      mensajeExito: "Producto creado con exito",
      mensajeError: "Error al crear el producto, Por favor, intente de nuevo",
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Producto",
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        leading: IconButton(
          tooltip: "Cerrar",
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                text: "Nombre",
                controller: _nombreController,
                icon: Icons.category_rounded,
              ),
              const SizedBox(height: 16),
              _buildDropDownMenu(),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                enabled: !_isLoading,
                controller: _precioController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el Precio';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresar un valor monetario correcto';
                  }
                  if ((double.tryParse(value) ?? 0.0) <= 0.0) {
                    return "El valor del producto no puede ser 0 o menor";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Precio de venta",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money_rounded),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                enabled: !_isLoading,
                controller: _stockController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el Stock';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresar un valor numerico correcto';
                  }
                  if ((double.tryParse(value) ?? 0.0) < 0.0) {
                    return "El stock no puede ser negativo";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Stock",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.inventory_rounded),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _descripcionController,
                decoration: InputDecoration(
                  labelText: "Descripcion",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? text,
    TextEditingController? controller,
    IconData? icon,
  }) {
    return TextFormField(
      enabled: !_isLoading,
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

  Widget _buildDropDownMenu() {
    return Consumer(
      builder: (context, ref, child) {
        final asyncUM = debugOverride(
          ref,
          'agregar_producto',
          ref.watch(unidadMedidaProvider),
        );

        return asyncUM.when(
          data: (ums) {
            return FormField<UnidadMedida>(
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
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.error,
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
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Semantics(
          label: "Guardar producto",
          child: FilledButton(
            onPressed: _isLoading
                ? null
                : () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        _crearProducto();
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
        ),
      ],
    );
  }
}
