import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_notifier.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductoEditarPage extends ConsumerStatefulWidget {
  final Articulo producto;
  const ProductoEditarPage({super.key, required this.producto});

  @override
  ProductoEditarPageState createState() => ProductoEditarPageState();
}

class ProductoEditarPageState extends ConsumerState<ProductoEditarPage> {
  late final TextEditingController _nombreController;
  late final TextEditingController _precioController;
  late final TextEditingController _stockController;
  late final TextEditingController _descriptionController;
  UnidadMedida? _selectedUnidadMedidad;

  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.producto.nombre);
    _precioController = TextEditingController(
      text: widget.producto.precioVenta.toString(),
    );
    _stockController = TextEditingController(
      text: widget.producto.stock.toString(),
    );
    _descriptionController = TextEditingController(
      text: widget.producto.descripcion,
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    _stockController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _update() async {
    final productoUpdate = widget.producto.copyWith(
      nombre: _nombreController.text,
      descripcion: _descriptionController.text,
      precioVenta: double.parse(_precioController.text),
      stock: double.parse(_stockController.text),
    );
    mostrarDialogoConfirmacion(
      context: context,
      titulo: "Seguro que desea actualizar el Producto",
      contenido: "Se actualizaran los cambios el Producto",
      textoBotonConfirmacion: "Actualizar",
      onConfirm: () => update<Articulo>(
        context: context,
        ref: ref,
        provider: articuloProviderProvider,
        element: productoUpdate,
        mensajeExito: "El Producto se a actualizado correctamente",
        mensajeError: "Erro al actualizar el Producto, intente de nuevo",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final unidadMedidaAsync = debugOverride(
      ref,
      'editar_producto',
      ref.watch(unidadMedidaDetailProvider(widget.producto.idUnidad)),
    );

    return unidadMedidaAsync.when(
      loading: () => SkeletonDropMenu(),
      error: (e, _) => Scaffold(
        body: ErrorView(
          message: 'Error cargando unidad de medida',
          description: e.toString(),
        ),
      ),
      data: (unidadInicial) {
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
              tooltip: "Cerrar",
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close_rounded),
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
                  AppBuildTextField(
                    text: "Nombre",
                    controller: _nombreController,
                    icon: Icons.category_rounded,
                    isLoading: _isLoading,
                    customValidator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Por favor, ingrese el Nombre";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildDropDownMenu(unidadInicial),
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
                    controller: _descriptionController,
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
      },
    );
  }

  Widget _buildDropDownMenu(UnidadMedida unidadInicial) {
    return Consumer(
      builder: (context, ref, child) {
        final asyncUM = debugOverride(
          ref,
          'editar_producto',
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
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
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
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: "Guardar Cambios",
      child: FilledButton(
        onPressed: _isLoading
            ? null
            : () async {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() => _isLoading = true);
                  try {
                    if (mounted) {
                      _update();
                    }
                  } catch (e, st) {
                    // appLogger.e(
                    //   "Error al actualizar el producto",
                    //   error: e,
                    //   stackTrace: st,
                    // );
                  } finally {
                    if (mounted) setState(() => _isLoading = false);
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
