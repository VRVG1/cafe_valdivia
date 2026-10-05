import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/cart_modal_handle.dart';
import 'package:cafe_valdivia/Components/cart_modal_resume.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/quantity_buttons_widget.dart';
import 'package:cafe_valdivia/Components/show_cart_item_modify_dialog.dart';
import 'package:cafe_valdivia/Components/show_cart_options_sheet.dart';
import 'package:cafe_valdivia/Components/show_confirm_pay_modal.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_page_proveedor_lista.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_articulo_page.dart';
import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
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

  // Notifier del buscador cacheado para poder limpiar el filtro en dispose()
  // sin usar `ref` (ver initState).
  late final FiltroBusquedaNotifier _filtroBusqueda;

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
    ref.read(filtroBusquedaProvider.notifier).limpiar();

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
    super.initState();
    _focusNodeTextField.addListener(() {
      if (_focusNodeTextField.hasFocus) {
        setState(() {
          _isButtonsExpresive = true;
        });
      }
    });
    // El notifier del buscador se guarda en un campo porque en dispose() el
    // `ref` ya no es seguro de usar: Riverpod lanza un StateError al leer un
    // provider desde dispose() ("Using ref when a widget is about to or has
    // been unmounted is unsafe"). Además filtroBusquedaProvider es keepAlive,
    // así que la instancia sobrevive a esta pantalla.
    _filtroBusqueda = ref.read(filtroBusquedaProvider.notifier);
  }

  @override
  void dispose() {
    _focusNodeTextField.dispose();

    // Controllers
    _cantidadController.dispose();
    _proveedorController.dispose();
    _articuloController.dispose();
    _descripcionController.dispose();

    // OJO: aquí no se limpia el filtro del buscador. Modificar un provider
    // dentro de dispose() está prohibido (el dispose se ejecuta durante
    // BuildOwner.finalizeTree y Riverpod lanza "Tried to modify a provider while
    // the widget tree was building"). La limpieza se hace en los eventos que
    // cierran la pantalla: ver _cerrarPantalla().

    super.dispose();
  }

  // Cierra la pantalla y deja el buscador limpio. Se invoca desde los botones
  // (eventos de usuario), que es el lugar correcto para modificar providers.
  void _cerrarPantalla() {
    _filtroBusqueda.limpiar();
    Navigator.of(context).pop();
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
      // 'precio' es el precio capturado en el formulario (puede diferir del
      // costo_unitario del artículo) y es el que se guardará en el detalle.
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
      // Se copia también 'precio': al agrupar por proveedor hay que conservar el
      // precio capturado, si no se perdería y el detalle se guardaría con el
      // costo anterior del artículo.
      listaArticulos.add({
        'articulo': articulo,
        'cantidad': item['cantidad'],
        'precio': item['precio'],
      });
    }
    return grupos.values.toList();
  }

  Future<void> _procesarCompra(
    Compra compra,
    List<DetalleCompra> detalleCompra,
  ) async {
    // El guardado (detalles + actualización del costo del artículo) se hace en
    // una sola transacción dentro de CompraRepository.registrarNuevaCompra.
    await create(
      context: context,
      ref: ref,
      provider: compraProvider,
      element: compra,
      detalles: true,
      detallesElement: detalleCompra,
      mensajeExito: "Compra realizada con éxito",
    );
  }

  Future<void> _resumenCompra() async {
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
      for (var elemento in item['articulos']) {
        // El precio capturado en el formulario manda sobre el costo guardado
        // del artículo: el costo almacenado solo sirve como referencia inicial.
        DetalleCompra detalleCompra = DetalleCompra(
          idCompra:
              0, //TODO: Arreglar el objecto DetalleCompra para que este atributo pueda ser nulo, ya que se le asigna al momento de la transaccion en el repositoy compra_repository.dart
          idArticulo: elemento['articulo'].id,
          cantidad: ((elemento['cantidad'] as int?) ?? 0).toDouble(),
          precioUnitarioCompra:
              (elemento['precio'] as double?) ??
              elemento['articulo'].costoUnitario,
        );
        detallesCompraList.add(detalleCompra);
      }
      //Usamos el crud la funcion create
      await _procesarCompra(compra, detallesCompraList);
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
          onPressed: _cerrarPantalla,
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
              onModify: () => showCartItemModifyDialog(
                context: context,
                item: item,
                onUpdated: ({required cantidad, required precio}) =>
                    setState(() {
                      // Se actualizan los dos valores: el precio es el que se
                      // guardará en el detalle de la compra.
                      item['cantidad'] = cantidad;
                      item['precio'] = precio;
                    }),
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
                        await _resumenCompra();
                        if (context.mounted) {
                          // Se limpia el filtro en el evento (no en dispose)
                          // antes de salir de la pantalla.
                          _filtroBusqueda.limpiar();
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
