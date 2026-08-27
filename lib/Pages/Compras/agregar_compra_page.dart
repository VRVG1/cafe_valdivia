import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/cart_modal_handle.dart';
import 'package:cafe_valdivia/Components/cart_modal_resume.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/quantity_buttons_widget.dart';
import 'package:cafe_valdivia/Components/show_cart_options_sheet.dart';
import 'package:cafe_valdivia/Components/show_confirm_pay_modal.dart';
import 'package:cafe_valdivia/Components/show_quantity_modify_dialog.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_page_proveedor_lista.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_articulo_page.dart';
import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Object _grupoCantidad = 'grupo_cantidad';

class AgregarCompraPage extends ConsumerStatefulWidget {
  const AgregarCompraPage({super.key});

  //Grupos de widgets

  @override
  AgregarCompraPageState createState() => AgregarCompraPageState();
}

class AgregarCompraPageState extends ConsumerState<AgregarCompraPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNodeTextField = FocusNode();

  bool _isLoading = false;
  bool _isButtonsExpresive = false;
  bool _isNegative = false;
  bool _esPagado = false;

  final _proveedorArticulo = <String, dynamic>{"proveedor": "", "articulo": ""};

  // Controllers
  final TextEditingController _cantidadController = TextEditingController(
    text: "0",
  );
  final TextEditingController _proveedorController = TextEditingController();
  final TextEditingController _articuloController = TextEditingController();
  final TextEditingController _precioController = TextEditingController(
    text: "0",
  );
  final TextEditingController _descripcionController = TextEditingController();
  // Test
  List<Map<String, dynamic>> carritoDeCompras = [];
  //
  //
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
      if (eleccion == 'articulo') {
        // print(result.costoUnitario);
        _precioController.text = result.costoUnitario.toString();
      }
      controller.text = result.nombre;
      _proveedorArticulo[eleccion] = result;
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

    // Controllers
    _cantidadController.dispose();
    _proveedorController.dispose();
    _articuloController.dispose();
    _descripcionController.dispose();

    super.dispose();
  }

  // Funciones

  void _incrementarCantidad(int valor) {
    int actual = int.tryParse(_cantidadController.text) ?? 0;
    setState(() {
      _cantidadController.text = (actual + valor).toString();
    });
  }

  void _agregarAlCarrito() {
    if (_formKey.currentState?.validate() ?? false) {
      final producto = {
        'nombre': _proveedorArticulo['articulo'].nombre,
        'cantidad': int.tryParse(_cantidadController.text),
        'precio': double.tryParse(_precioController.text),
        'articulo': _proveedorArticulo['articulo'],
        'proveedor': _proveedorArticulo['proveedor'],
      };

      setState(() {
        carritoDeCompras.add(producto);
        _cantidadController.text = "";
        _articuloController.text = "";
        _precioController.text = "";
      });
    }
  }

  List<Map<String, dynamic>> _separarPorProveedor(
    List<Map<String, dynamic>> data,
  ) {
    final Map<int, Map<String, dynamic>> grupos = {};

    for (var item in data) {
      final proveedor = item['proveedor'];
      final articulo = item['articulo'];
      if (proveedor == null) continue;
      final int id = proveedor.id;

      final contenedor = grupos.putIfAbsent(
        id,
        () => {'idProveedor': id, 'articulos': <Map<String, dynamic>>[]},
      );

      final listaArticulos =
          contenedor['articulos'] as List<Map<String, dynamic>>;
      listaArticulos.add({'articulo': articulo, 'cantidad': item['cantidad']});
    }
    return grupos.values.toList();
  }

  void _procesarCompra(
    Compra compra,
    List<DetalleCompra> detalleCompra,
    List<Articulo> articulos,
  ) async {
    final result = await create(
      context: context,
      ref: ref,
      provider: compraProvider,
      element: compra,
      detalles: true,
      detallesElement: detalleCompra,
      mensajeExito: "Compra realizada con éxito",
    );
    // TODO: Se supone que en los triggers se tiene que realizar dicha operacion de cambios
    // if (result) {
    //   for (var articulo in articulos) {
    //     update(
    //       context: context,
    //       ref: ref,
    //       provider: articuloProviderProvider,
    //       element: articulo,
    //     );
    //   }
    // }
  }

  void _resumenCompra() {
    //TODO: REcordar que, siempre se tiene que actualizar el articulo, en concreto el campo costoUnitario, ya que puede que o no, cambie con la compra, y como no se como validar si cambia o no, mejor lo actualizo y ya.
    final List<Map<String, dynamic>> result = _separarPorProveedor(
      carritoDeCompras,
    );
    for (var item in result) {
      //Creamos una compras
      Compra compra = Compra(
        idProveedor: item['idProveedor'],
        fecha: DateTime.now(),
        pagado: _esPagado,
        detalles: _descripcionController.text,
      );
      //Creamos una lista de compras detalladas
      final List<DetalleCompra> detallesCompraList = [];
      final List<Articulo> articulos = [];
      for (var elemento in item['articulos']) {
        DetalleCompra detalleCompra = DetalleCompra(
          idCompra:
              0, //TODO: Arreglar el objecto DetalleCompra para que este atributo pueda ser nulo, ya que se le asigna al momento de la transaccion en el repositoy compra_repository.dart
          idArticulo: elemento['articulo'].id,
          cantidad: ((elemento['cantidad'] as int?) ?? 0).toDouble(),
          precioUnitarioCompra: elemento['articulo'].costoUnitario,
        );
        articulos.add(elemento['articulo']);
        detallesCompraList.add(detalleCompra);
      }
      //Usamos el crud la funcion create
      _procesarCompra(compra, detallesCompraList, articulos);
      //esperamos a que jale xd
    }
  }

  // fin funciones

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Comprar",
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
                  _buildAgregarProveedor(),
                  const SizedBox(height: 16),
                  _buildAgregarArticulo(),

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

  Widget _buildAgregarProveedor() {
    return AppBuildTextField(
      text: "Proveedor",
      controller: _proveedorController,
      icon: Icons.person_rounded,
      readOnly: true,
      onTap: () => {
        _recibirDatos(
          context,
          AgregarCompraPageProveedorLista(),
          _proveedorController,
          "proveedor",
        ),
      },
      customValidator: (value) {
        if (value == null || value.isEmpty) {
          return "Selecciona un proveedor";
        }
        return null;
      },
    );
  }

  Widget _buildAgregarArticulo() {
    return AppBuildTextField(
      text: "Articulo",
      controller: _articuloController,
      icon: Icons.widgets_rounded,
      readOnly: true,
      onTap: () => {
        _recibirDatos(
          context,
          AgregarCompraSeleccionArticuloPage(),
          _articuloController,
          "articulo",
        ),
      },
      customValidator: (value) {
        if (value == null || value.isEmpty) {
          return "Selecciona un artículo";
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
              icon: Icons.numbers_rounded,
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
      initialChildSize: 0.13, // Altura visible inicial (pestaña)
      minChildSize: 0.13, // Mínimo que se puede encoger
      maxChildSize: 1, // Máximo que se puede expandir
      expand: true,
      snap: true, // Salta a las posiciones min/max automáticamente
      builder: (context, scrollController) {
        final double totalDinero = carritoDeCompras.fold<double>(0, (
          sum,
          item,
        ) {
          return sum + ((item['precio'] ?? 0) * (item['cantidad'] ?? 0));
        });

        final int totalProductos = carritoDeCompras.fold<int>(0, (sum, item) {
          return sum + (item['cantidad'] as int? ?? 0);
        });
        return Container(
          decoration: BoxDecoration(
            color: cs.surfaceContainerLow,
            borderRadius: AppRadius.modalTopCircular,
          ),
          child: ListviewCustom(
            controller: scrollController,
            data: carritoDeCompras,
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
              onRemove: () => setState(() => carritoDeCompras.remove(item)),
            ),
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: () async {
                    if (carritoDeCompras.isNotEmpty) {
                      if (await showConfirmPayModal(
                        context: context,
                        titulo: "Realizar Compra",
                        cuerpo: "¿Confirmar compra por \$$totalDinero?",
                        esPagado: _esPagado,
                        onPagadoChanged: (v) => setState(() => _esPagado = v),
                        descripcionController: _descripcionController,
                      )) {
                        _resumenCompra();
                        if (context.mounted) {
                          showCustomSnackBar(
                            context: context,
                            mensaje: "Compra realizada con éxito",
                          );
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      showConfirmPayModal(
                        context: context,
                        titulo: "Carrito vacío",
                        cuerpo: "No hay artículos en el carrito",
                        esPagado: _esPagado,
                        onPagadoChanged: (v) => setState(() => _esPagado = v),
                        descripcionController: _descripcionController,
                        mostrarSegundoBoton: false,
                        mostrarCamposExtra: false,
                      );
                    }
                  },
                  icon: const Icon(Icons.shopping_cart_checkout_rounded),
                  label: const Text("Proceder con la compra"),
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
                  carritoDeCompras.remove(value);
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
