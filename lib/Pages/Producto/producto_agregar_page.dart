import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/providers/producto_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoAgregarPage extends ConsumerStatefulWidget {
  const ProductoAgregarPage({super.key});

  @override
  ProductoAgregarPageState createState() => ProductoAgregarPageState();
}

class ProductoAgregarPageState extends ConsumerState<ProductoAgregarPage> {
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _precioController.dispose();
    _descripcionController.dispose();
    _nombreController.dispose();
    super.dispose();
  }

  void _crearProducto() {
    final Producto producto = Producto(
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      precioVenta: double.parse(_precioController.text),
    );
    create(
      context: context,
      ref: ref,
      provider: productoProvider,
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
                icon: Icons.tag_rounded,
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                enabled: !_isLoading,
                controller: _precioController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el Precio';
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
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _descripcionController,
                decoration: InputDecoration(
                  hintText: "Descripcion",
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

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FilledButton(
          // El botón se deshabilita si el formulario no es válido
          onPressed:
              _isLoading
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
          child:
              _isLoading
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
