import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/cart_modal_handle.dart';
import 'package:cafe_valdivia/Components/cart_modal_resume.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/quantity_buttons_widget.dart';
import 'package:cafe_valdivia/Components/show_cart_options_sheet.dart';
import 'package:cafe_valdivia/Components/show_confirm_pay_modal.dart';
import 'package:cafe_valdivia/Components/show_quantity_modify_dialog.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_seleccion_cliente_page.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_seleccion_producto_page.dart';
import 'package:cafe_valdivia/core/models/venta.dart';
import 'package:cafe_valdivia/core/models/detalle_venta.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/Venta/venta_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Object _grupoCantidad = 'grupo_cantidad';

class AgregarVentaPage extends ConsumerStatefulWidget {
  const AgregarVentaPage({super.key});

  @override
  AgregarVentaPageState createState() => AgregarVentaPageState();
}

class AgregarVentaPageState extends ConsumerState<AgregarVentaPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNodeTextField = FocusNode();

  bool _isLoading = false;
  bool _isButtonsExpresive = false;
  bool _isNegative = false;
  bool _esPagado = false;

  final _clienteProducto = <String, dynamic>{"cliente": "", "producto": ""};

  final TextEditingController _cantidadController = TextEditingController(
    text: "0",
  );
  final TextEditingController _clienteController = TextEditingController();
  final TextEditingController _productoController = TextEditingController();
  final TextEditingController _precioController = TextEditingController(
    text: "0",
  );
  final TextEditingController _descripcionController = TextEditingController();

  List<Map<String, dynamic>> carritoDeVentas = [];

  Future<void> _recibirDatos(
    BuildContext context,
    Widget widget,
    TextEditingController controller,
    String eleccion,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

    if (result == null) return;

    setState(() {
      if (eleccion == 'producto') {
        _precioController.text = result.precioVenta.toString();
      }
      controller.text = result.nombre;
      _clienteProducto[eleccion] = result;
    });
    if (!context.mounted) return;
  }

  @override
  void initState() {
    _focusNodeTextField.addListener(() {
      if (_focusNodeTextField.hasFocus) {
        setState(() {
          _isButtonsExpresive = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeTextField.dispose();
    _cantidadController.dispose();
    _clienteController.dispose();
    _productoController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  void _incrementarCantidad(int valor) {
    int actual = int.tryParse(_cantidadController.text) ?? 0;
    setState(() {
      _cantidadController.text = (actual + valor).toString();
    });
  }

  void _agregarAlCarrito() {
    if (_formKey.currentState?.validate() ?? false) {
      final producto = {
        'nombre': _clienteProducto['producto'].nombre,
        'cantidad': int.tryParse(_cantidadController.text),
        'precio': double.tryParse(_precioController.text),
        'articulo': _clienteProducto['producto'],
        'cliente': _clienteProducto['cliente'],
      };

      setState(() {
        carritoDeVentas.add(producto);
        _cantidadController.text = "";
        _productoController.text = "";
        _precioController.text = "";
      });
    }
  }

  Future<int?> _procesarVenta(
    Venta venta,
    List<DetalleVenta> detalleVenta,
  ) async {
    return await create(
      context: context,
      ref: ref,
      provider: ventaProvider,
      element: venta,
      detalles: true,
      detallesElement: detalleVenta,
      mensajeExito: "Venta realizada con éxito",
    );
  }

  Future<void> _resumenVenta() async {
    final cliente = carritoDeVentas.first['cliente'];

    Venta venta = Venta(
      idCliente: cliente.id,
      fecha: DateTime.now(),
      pagado: _esPagado,
      estado: VentaEstado.pendiente,
      detalles: _descripcionController.text,
    );

    final List<DetalleVenta> detallesVentaList = [];
    for (var elemento in carritoDeVentas) {
      DetalleVenta detalleVenta = DetalleVenta(
        idVenta: 0,
        idArticulo: elemento['articulo'].id,
        cantidad: ((elemento['cantidad'] as int?) ?? 0).toDouble(),
        precioUnitarioVenta: elemento['precio'],
      );
      detallesVentaList.add(detalleVenta);
    }

    await _procesarVenta(venta, detallesVentaList);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nueva Venta",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        leading: IconButton(
          tooltip: "Cerrar",
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close_rounded),
        ),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 32,
                bottom: 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildAgregarCliente(),
                  const SizedBox(height: 16),
                  _buildAgregarProducto(),
                  const SizedBox(height: 16),
                  _buildCantidadPrecio(),
                  if (_isButtonsExpresive)
                    TapRegion(
                      groupId: _grupoCantidad,
                      child: QuantityButtonsWidget(
                        isNegative: _isNegative,
                        onIncrement: _incrementarCantidad,
                        onToggleNegative: () =>
                            setState(() => _isNegative = !_isNegative),
                      ),
                    ),
                  const SizedBox(height: 32),
                  _buildAgregarButton(),
                ],
              ),
            ),
          ),
          _buildModal(theme.colorScheme, theme.textTheme),
        ],
      ),
    );
  }

  Widget _buildAgregarCliente() {
    return AppBuildTextField(
      text: "Cliente",
      controller: _clienteController,
      icon: Icons.person_rounded,
      readOnly: true,
      onTap: () => {
        _recibirDatos(
          context,
          VentaSeleccionClientePage(),
          _clienteController,
          "cliente",
        ),
      },
      customValidator: (value) {
        if (value == null || value.isEmpty) {
          return "Selecciona un cliente";
        }
        return null;
      },
    );
  }

  Widget _buildAgregarProducto() {
    return AppBuildTextField(
      text: "Producto",
      controller: _productoController,
      icon: Icons.coffee_rounded,
      readOnly: true,
      onTap: () => {
        _recibirDatos(
          context,
          VentaSeleccionProductoPage(),
          _productoController,
          "producto",
        ),
      },
      customValidator: (value) {
        if (value == null || value.isEmpty) {
          return "Selecciona un producto";
        }
        return null;
      },
    );
  }

  Widget _buildAgregarButton() {
    return Center(
      child: SizedBox(
        width: 320,
        height: 56,
        child: FilledButton(
          onPressed: () {
            _agregarAlCarrito();
          },
          child: Text("Agregar"),
        ),
      ),
    );
  }

  Widget _buildCantidadPrecio() {
    return Row(
      children: <Widget>[
        Expanded(
          child: AppBuildTextField(
            text: "Precio",
            controller: _precioController,
            icon: Icons.attach_money_rounded,
            isLoading: _isLoading,
            customValidator: (value) {
              if (value == null || value == "0") {
                return "El precio no puede ser 0";
              }
              if (double.tryParse(value) == null) {
                return "Ingresa un precio válido";
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TapRegion(
            groupId: _grupoCantidad,
            onTapOutside: (event) {
              _focusNodeTextField.unfocus();
              setState(() {
                _isButtonsExpresive = false;
              });
            },
            child: AppBuildTextField(
              text: "Cantidad",
              controller: _cantidadController,
              icon: Icons.production_quantity_limits_rounded,
              textInputType: TextInputType.number,
              isLoading: _isLoading,
              focusNode: _focusNodeTextField,
              customValidator: (value) {
                if (value == null || value == "0") {
                  return "La cantidad debe ser mayor a 0";
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModal(ColorScheme cs, TextTheme tt) {
    return DraggableScrollableSheet(
      initialChildSize: 0.13,
      minChildSize: 0.13,
      maxChildSize: 1,
      expand: true,
      snap: true,
      builder: (context, scrollController) {
        final double totalDinero = carritoDeVentas.fold<double>(0, (sum, item) {
          return sum + ((item['precio'] ?? 0) * (item['cantidad'] ?? 0));
        });

        final int totalProductos = carritoDeVentas.fold<int>(0, (sum, item) {
          return sum + (item['cantidad'] as int? ?? 0);
        });
        return Container(
          decoration: BoxDecoration(
            color: cs.surfaceContainerLow,
            borderRadius: AppRadius.modalTopCircular,
          ),
          child: ListviewCustom(
            controller: scrollController,
            data: carritoDeVentas,
            keyBuilder: (item) => ValueKey(item.hashCode),
            titleBuilder: (item) => Text(
              item['nombre'],
              style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitleBuilder: (item) => Text("Cant: ${item['cantidad']}"),
            trailingBuilder: (item) => Text(
              "\$ ${item['precio'].toString()}",
              style: tt.labelLarge?.copyWith(color: cs.primary),
            ),
            onLongPressCallback: (item) => showCartOptionsSheet(
              context: context,
              item: item,
              onModify: () => showQuantityModifyDialog(
                context: context,
                item: item,
                onUpdated: (nueva) => setState(() => item['cantidad'] = nueva),
              ),
              onRemove: () => setState(() => carritoDeVentas.remove(item)),
            ),
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: () async {
                    if (carritoDeVentas.isNotEmpty) {
                      if (await showConfirmPayModal(
                        context: context,
                        titulo: "Realizar Venta",
                        cuerpo: "¿Confirmar venta por \$$totalDinero?",
                        esPagado: _esPagado,
                        onPagadoChanged: (v) => setState(() => _esPagado = v),
                        descripcionController: _descripcionController,
                      )) {
                        await _resumenVenta();
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      showConfirmPayModal(
                        context: context,
                        titulo: "Carrito vacío",
                        cuerpo: "No hay productos en el carrito",
                        esPagado: _esPagado,
                        onPagadoChanged: (v) => setState(() => _esPagado = v),
                        descripcionController: _descripcionController,
                        mostrarSegundoBoton: false,
                        mostrarCamposExtra: false,
                      );
                    }
                  },
                  icon: const Icon(Icons.shopping_cart_checkout_rounded),
                  label: const Text("Proceder con la venta"),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                ),
              ),
            ),
            header: Column(
              children: <Widget>[
                CartModalHandle(cs: cs),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                ),
                CartModalResume(
                  cs: cs,
                  tt: tt,
                  totalProductos: totalProductos,
                  totalDinero: totalDinero,
                ),
                SizedBox(height: 12),
                const Divider(height: 1, indent: 12, endIndent: 12),
                SizedBox(height: 12),
              ],
            ),
            secondaryBackgroundIcon: Icons.remove_rounded,
            onDeleteDismissed: (value) async {
              setState(() {
                if ((value['cantidad'] as int) - 1 < 1) {
                  carritoDeVentas.remove(value);
                } else {
                  value['cantidad'] = (value['cantidad'] as int) - 1;
                }
              });
              return false;
            },
            primaryBackgroundIcon: Icons.add_rounded,
            onEditDismissed: (value) async {
              setState(() {
                value['cantidad'] = (value['cantidad'] as int) + 1;
              });
              return false;
            },
          ),
        );
      },
    );
  }
}
