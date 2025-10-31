import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/providers/producto_notifier.dart';
import 'package:cafe_valdivia/providers/producto_provider.dart';
import 'package:cafe_valdivia/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoEditarPage extends ConsumerStatefulWidget {
  final Producto producto;
  const ProductoEditarPage({super.key, required this.producto});

  @override
  ProductoEditarPageState createState() => ProductoEditarPageState();
}

class ProductoEditarPageState extends ConsumerState<ProductoEditarPage> {
  late final TextEditingController _nombreController;
  late final TextEditingController _precioController;
  late final TextEditingController _descriptionController;

  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.producto.nombre);
    _precioController = TextEditingController(
      text: widget.producto.precioVenta.toString(),
    );
    _descriptionController = TextEditingController(
      text: widget.producto.descripcion,
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _update() async {
    final productoUpdate = widget.producto.copyWith(
      id: widget.producto.id,
      nombre: _nombreController.text,
      descripcion: _descriptionController.text,
      precioVenta: double.parse(_precioController.text),
    );
    mostrarDialogoConfirmacion(
      context: context,
      titulo: "Seguro que desea actualizar el Producto",
      contenido: "Se actualizaran los cambios el Producto",
      textoBotonConfirmacion: "Actualizar",
      onConfirm:
          () => {
            update<Producto>(
              context: context,
              ref: ref,
              provider: productoProvider,
              element: productoUpdate,
              mensajeExito: "El Producto se a actualizado correctamente",
              mensajeError: "Erro al actualizar el Producto, intente de nuevo",
            ),
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final AsyncValue<Producto> asyncValue = ref.watch(
      productoDetailProvider(widget.producto.id!),
    );

    return asyncValue.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error:
          (e, _) => Scaffold(
            body: Center(child: Text('Error cargando unidad de medida: $e')),
          ),
      data: (Producto producto) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Editar Producto",
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nombreController,
                    enabled: !_isLoading,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Por favor, ingrese el Precio";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.category_rounded),
                    ),
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
                    controller: _descriptionController,
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
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);

    return FilledButton(
      onPressed:
          _isLoading
              ? null
              : () async {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() => _isLoading = true);
                  try {
                    if (mounted) {
                      _update();
                    }
                  } catch (e, st) {
                    appLogger.e(
                      "Error al actualizar el producto",
                      error: e,
                      stackTrace: st,
                    );
                  } finally {
                    if (mounted) setState(() => _isLoading = false);
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
    );
  }
}
