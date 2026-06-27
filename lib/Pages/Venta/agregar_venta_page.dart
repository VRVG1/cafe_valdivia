import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_seleccion_cliente_page.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_seleccion_producto_page.dart';
import 'package:cafe_valdivia/core/models/venta.dart';
import 'package:cafe_valdivia/core/models/detalle_venta.dart';
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

  void _procesarVenta(Venta venta, List<DetalleVenta> detalleVenta) async {
    await create(
      context: context,
      ref: ref,
      provider: ventaProvider,
      element: venta,
      detalles: true,
      detallesElement: detalleVenta,
      mensajeExito: "Venta realizada con éxito",
      mensajeError: "Error al procesar la venta, intenta más tarde",
    );
  }

  void _resumenVenta() {
    // Todas las ventas van al mismo cliente en esta transaccion
    final cliente = carritoDeVentas.first['cliente'];

    Venta venta = Venta(
      idCliente: cliente.idCliente,
      fecha: DateTime.now(),
      pagado: _esPagado,
      estado: VentaEstado.pendiente,
      detalles: _descripcionController.text,
    );

    final List<DetalleVenta> detallesVentaList = [];
    for (var elemento in carritoDeVentas) {
      DetalleVenta detalleVenta = DetalleVenta(
        idVenta: 0,
        idArticulo: elemento['articulo'].idArticulo,
        cantidad: ((elemento['cantidad'] as int?) ?? 0).toDouble(),
        precioUnitarioVenta: elemento['precio'],
      );
      detallesVentaList.add(detalleVenta);
    }

    _procesarVenta(venta, detallesVentaList);
  }

  void _mostrarOpcionesItem(Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                item['nombre'],
                style: Theme.of(ctx).textTheme.titleMedium,
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Modificar cantidad"),
              onTap: () {
                Navigator.pop(ctx);
                _mostrarDialogoModificarCantidad(item);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_rounded,
                color: Theme.of(ctx).colorScheme.error,
              ),
              title: Text(
                "Eliminar del carrito",
                style: TextStyle(color: Theme.of(ctx).colorScheme.error),
              ),
              onTap: () {
                Navigator.pop(ctx);
                setState(() {
                  carritoDeVentas.remove(item);
                });
              },
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogoModificarCantidad(Map<String, dynamic> item) {
    final controller = TextEditingController(text: item['cantidad'].toString());
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Modificar cantidad"),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Nueva cantidad",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancelar"),
          ),
          FilledButton(
            onPressed: () {
              final nueva = int.tryParse(controller.text);
              if (nueva != null && nueva > 0) {
                setState(() {
                  item['cantidad'] = nueva;
                });
                Navigator.pop(ctx);
              }
            },
            child: Text("Aceptar"),
          ),
        ],
      ),
    );
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
          icon: Icon(Icons.close),
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
                      child: _cantidadButtonsWidget(theme.colorScheme),
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
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Selecciona un cliente";
        }
        return null;
      },
      readOnly: true,
      controller: _clienteController,
      onTap: () => {
        _recibirDatos(
          context,
          VentaSeleccionClientePage(),
          _clienteController,
          "cliente",
        ),
      },
      decoration: InputDecoration(
        labelText: "Cliente",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person_rounded),
      ),
    );
  }

  Widget _buildAgregarProducto() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Selecciona un producto";
        }
        return null;
      },
      readOnly: true,
      controller: _productoController,
      onTap: () => {
        _recibirDatos(
          context,
          VentaSeleccionProductoPage(),
          _productoController,
          "producto",
        ),
      },
      decoration: InputDecoration(
        labelText: "Producto",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.coffee_rounded),
      ),
    );
  }

  Widget _buildAgregarButton() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 128),
      child: SizedBox(
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
          child: TextFormField(
            enabled: !_isLoading,
            controller: _precioController,
            validator: (value) {
              if (value == null || value == "0") {
                return "El precio no puede ser 0";
              }
              if (double.tryParse(value) == null) {
                return "Ingresa un precio válido";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Precio",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.attach_money_rounded),
            ),
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
            child: TextFormField(
              validator: (value) {
                if (value == null || value == "0") {
                  return "La cantidad debe ser mayor a 0";
                }
                return null;
              },
              enabled: !_isLoading,
              focusNode: _focusNodeTextField,
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cantidad",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.production_quantity_limits_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> _mostrarModal({
    required BuildContext context,
    required String titulo,
    required String cuerpo,
    bool mostrarSegundoBoton = true,
    bool mostrarCamposExtra = true,
  }) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(titulo),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(cuerpo),
                    if (mostrarCamposExtra) ...[
                      const SizedBox(height: 20),
                      SwitchListTile(
                        title: const Text("¿Pagado?"),
                        value: _esPagado,
                        onChanged: (bool value) {
                          setState(() {
                            _esPagado = value;
                          });
                        },
                      ),
                      TextField(
                        controller: _descripcionController,
                        decoration: const InputDecoration(
                          labelText: 'Información extra',
                          hintText: 'Escribe aquí...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                if (mostrarSegundoBoton)
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text("Cancelar"),
                  ),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("Aceptar"),
                ),
              ],
            );
          },
        );
      },
    );
    return result ?? false;
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
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
            onLongPressCallback: (item) => _mostrarOpcionesItem(item),
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: () async {
                    if (carritoDeVentas.isNotEmpty) {
                      if (await _mostrarModal(
                        context: context,
                        titulo: "Realizar Venta",
                        cuerpo: "¿Confirmar venta por \$$totalDinero?",
                      )) {
                        _resumenVenta();
                        if (context.mounted) {
                          showCustomSnackBar(
                            context: context,
                            mensaje: "Venta realizada con éxito",
                          );
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      _mostrarModal(
                        context: context,
                        titulo: "Carrito vacío",
                        cuerpo: "No hay productos en el carrito",
                        mostrarSegundoBoton: false,
                        mostrarCamposExtra: false,
                      );
                    }
                  },
                  icon: const Icon(Icons.shopping_cart_checkout),
                  label: const Text("Proceder con la venta"),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                ),
              ),
            ),
            header: Column(
              children: <Widget>[
                _buildModalHandle(cs),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                ),
                _buildModalResume(cs, tt, totalProductos, totalDinero),
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

  Widget _buildModalResume(
    ColorScheme cs,
    TextTheme tt,
    int totalProductos,
    double totalDinero,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Total productos: $totalProductos ",
                style: tt.titleMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
          Text(
            "\$${totalDinero.toStringAsFixed(2)}",
            style: tt.headlineMedium?.copyWith(
              color: cs.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModalHandle(ColorScheme cs) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: 32,
        height: 4,
        decoration: BoxDecoration(
          color: cs.outlineVariant,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _expressiveButton(
    String label,
    Color color,
    double points,
    Color bg,
    VoidCallback onPressed,
  ) {
    return IconButton(
      tooltip: "Accion especial",
      onPressed: onPressed,
      icon: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: color,
          shape: StarBorder(
            points: points,
            innerRadiusRatio: 0.8,
            pointRounding: 0.4,
          ),
          shadows: <BoxShadow>[
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: bg),
        ),
      ),
    );
  }

  Widget _cantidadButtonsWidget(ColorScheme cs) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(top: 8.0),
      child: Card(
        color: cs.surfaceContainerLowest,
        elevation: 0,
        child: SizedBox(
          width: 60.0,
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _expressiveButton(
                _isNegative ? "-1" : "+1",
                cs.primaryContainer,
                14,
                cs.onPrimaryContainer,
                _isNegative
                    ? () => _incrementarCantidad(-1)
                    : () => _incrementarCantidad(1),
              ),
              _expressiveButton(
                _isNegative ? "-6" : "+6",
                cs.primaryContainer,
                14,
                cs.onPrimaryContainer,
                _isNegative
                    ? () => _incrementarCantidad(-6)
                    : () => _incrementarCantidad(6),
              ),
              _expressiveButton(
                _isNegative ? "-12" : "+12",
                cs.primaryContainer,
                14,
                cs.onPrimaryContainer,
                _isNegative
                    ? () => _incrementarCantidad(-12)
                    : () => _incrementarCantidad(12),
              ),
              _expressiveButton(
                _isNegative ? "-24" : "+24",
                cs.primaryContainer,
                14,
                cs.onPrimaryContainer,
                _isNegative
                    ? () => _incrementarCantidad(-24)
                    : () => _incrementarCantidad(24),
              ),
              _expressiveButton(
                _isNegative ? "+" : "-",
                _isNegative ? cs.tertiaryContainer : cs.errorContainer,
                14,
                _isNegative ? cs.onTertiaryContainer : cs.onErrorContainer,
                () => setState(() {
                  _isNegative = !_isNegative;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
