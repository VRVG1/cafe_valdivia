import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_page_proveedor_lista.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_insumo_page.dart';
import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/models/insumo.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:cafe_valdivia/providers/Insumo/insumo_provider.dart';
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

  final _proveedorInsumo = <String, dynamic>{"proveedor": "", "insumo": ""};

  // Controllers
  final TextEditingController _cantidadController = TextEditingController(
    text: "0",
  );
  final TextEditingController _proveedorController = TextEditingController();
  final TextEditingController _insumoController = TextEditingController();
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
      if (eleccion == 'insumo') {
        print(result.costoUnitario);
        _precioController.text = result.costoUnitario;
      }
      controller.text = result.nombre;
      _proveedorInsumo[eleccion] = result;
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
    _insumoController.dispose();
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
        'nombre': _proveedorInsumo['insumo'].nombre,
        'cantidad': int.tryParse(_cantidadController.text),
        'precio': double.parse(_precioController.text),
        'insumo': _proveedorInsumo['insumo'],
        'proveedor': _proveedorInsumo['proveedor'],
      };

      setState(() {
        carritoDeCompras.add(producto);
        _cantidadController.text = "";
        _insumoController.text = "";
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
      final insumo = item['insumo'];
      if (proveedor == null) continue;
      final int id = proveedor.idProveedor;

      final contenedor = grupos.putIfAbsent(
        id,
        () => {'idProveedor': id, 'insumos': <Map<String, dynamic>>[]},
      );

      final listaInsumos = contenedor['insumos'] as List<Map<String, dynamic>>;
      listaInsumos.add({'insumo': insumo, 'cantidad': item['cantidad']});
    }
    return grupos.values.toList();
  }

  void _procesarCompra(
    Compra compra,
    List<DetalleCompra> detalleCompra,
    List<Insumo> insumos,
  ) async {
    final result = await create(
      context: context,
      ref: ref,
      provider: compraProvider,
      element: compra,
      detalles: true,
      detallesElement: detalleCompra,
      mensajeExito: "Compra realizada con exito",
      mensajeError: "Error al procesar la compra, intente mas tarde",
    );
    // TODO: Se supone que en los triggers se tiene que realizar dicha operacion de cambios
    // if (result) {
    //   for (var insumo in insumos) {
    //     update(
    //       context: context,
    //       ref: ref,
    //       provider: insumoProviderProvider,
    //       element: insumo,
    //     );
    //   }
    // }
  }

  void _resumenCompra() {
    //TODO: REcordar que, siempre se tiene que actualizar el insumo, en concreto el campo costoUnitario, ya que puede que o no, cambie con la compra, y como no se como validar si cambia o no, mejor lo actualizo y ya.
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
      final List<Insumo> insumos = [];
      for (var elemento in item['insumos']) {
        DetalleCompra detalleCompra = DetalleCompra(
          idCompra:
              0, //TODO: Arreglar el objecto DetalleCompra para que este atributo pueda ser nulo, ya que se le asigna al momento de la transaccion en el repositoy compra_repository.dart
          idInsumo: elemento['insumo'].idInsumo,
          cantidad: elemento['cantidad'],
          precioUnitarioCompra: elemento['insumo'].costoUnitario,
        );
        insumos.add(elemento['insumo']);
        detallesCompraList.add(detalleCompra);
      }
      //Usamos el crud la funcion create
      _procesarCompra(compra, detallesCompraList, insumos);
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
                  _buildAgregarProveedor(),
                  const SizedBox(height: 16),
                  _buildAgregarInsumo(),

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

  Widget _buildAgregarProveedor() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Favor de seleccionar un Proveedor.";
        }
        return null;
      },
      readOnly: true,
      controller: _proveedorController,
      onTap: () => {
        _recibirDatos(
          context,
          AgregarCompraPageProveedorLista(),
          _proveedorController,
          "proveedor",
        ),
      },
      decoration: InputDecoration(
        labelText: "Proveedor",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.fax_rounded),
      ),
    );
  }

  Widget _buildAgregarInsumo() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Favor de seleccionar un Insumo.";
        }
        return null;
      },
      readOnly: true,
      controller: _insumoController,
      onTap: () => {
        _recibirDatos(
          context,
          AgregarCompraSeleccionInsumoPage(),
          _insumoController,
          "insumo",
        ),
      },
      decoration: InputDecoration(
        labelText: "Insumo",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.fax_rounded),
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
                return "El monto no puede ser 0.";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Precio",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.fax_rounded),
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
                  return "La cantidad no puede ser 0.";
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
                prefixIcon: Icon(Icons.fax_rounded),
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
                    // Aquí manejas la lógica de los datos capturados
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
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
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: () async {
                    if (carritoDeCompras.isNotEmpty) {
                      if (await _mostrarModal(
                        context: context,
                        titulo: "Realizar Compra",
                        cuerpo: "Desea realizar la compra de \$$totalDinero",
                      )) {
                        _resumenCompra();
                        if (context.mounted) {
                          showCustomSnackBar(
                            context: context,
                            mensaje: "Compra realizada con exito",
                          );
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      _mostrarModal(
                        context: context,
                        titulo: "Carrito Vacio",
                        cuerpo: "No existe articulo agregado al carrito",
                        mostrarSegundoBoton: false,
                        mostrarCamposExtra: false,
                      );
                    }
                  },
                  icon: const Icon(Icons.shopping_cart_checkout),
                  label: const Text("Proceder con la compra"),
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
            //TODO: EL onDelete y onEdit, que uno agregue y que el otro elimine
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
