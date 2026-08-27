import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/save_button.dart';
import 'package:cafe_valdivia/Components/unidad_medida_dropdown.dart';
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
      idUnidad: _selectedUnidadMedidad!.id!,
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
          icon: Icon(Icons.close_rounded),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SaveButton(
              isLoading: _isLoading,
              semanticsLabel: "Guardar Producto",
              onPressed: () async {
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
            ),
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
              Consumer(
                builder: (context, ref, _) {
                  final asyncUM = debugOverride(
                    ref,
                    'agregar_producto',
                    ref.watch(unidadMedidaProvider),
                  );
                  return UnidadMedidaDropdown(
                    asyncData: asyncUM,
                    selectedValue: _selectedUnidadMedidad,
                    onChanged: (v) =>
                        setState(() => _selectedUnidadMedidad = v),
                    onRetry: () => ref.invalidate(unidadMedidaProvider),
                  );
                },
              ),
              const SizedBox(height: 16),
              AppBuildTextField(
                text: "Precio de venta",
                controller: _precioController,
                icon: Icons.attach_money_rounded,
                textInputType: TextInputType.number,
                isLoading: _isLoading,
                customValidator: (value) {
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
              ),
              const SizedBox(height: 16),
              AppBuildTextField(
                text: "Stock",
                controller: _stockController,
                icon: Icons.inventory_rounded,
                textInputType: TextInputType.number,
                isLoading: _isLoading,
                customValidator: (value) {
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
              ),
              const SizedBox(height: 16),
              AppBuildTextField(
                text: "Descripcion",
                controller: _descripcionController,
                icon: Icons.description_rounded,
                textInputType: TextInputType.multiline,
                maxLines: null,
                isLoading: _isLoading,
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
    return AppBuildTextField(
      text: text ?? '',
      controller: controller!,
      icon: icon ?? Icons.category_rounded,
      isLoading: _isLoading,
      customValidator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el $text';
        }
        return null;
      },
    );
  }

}
