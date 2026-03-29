import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_page_proveedor_lista.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_insumo_page.dart';
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

  // Controllers
  final TextEditingController _cantidadController = TextEditingController(
    text: "0",
  );
  final TextEditingController _proveedorController = TextEditingController();
  final TextEditingController _insumoController = TextEditingController();
  // Test
  List<Map<String, dynamic>> carritoDeCompras = [
    {'nombre': 'Leche Entera 1L', 'cantidad': 2, 'precio': 1.50},
    {
      'nombre':
          'MacBook Pro M3 Max 16" - Edición Especial para Desarrolladores de Flutter',
      'cantidad': 1,
      'precio': 3499.99,
    },
    {'nombre': 'Clavos de acero (bolsa x100)', 'cantidad': 50, 'precio': 0.15},
    {'nombre': 'Suscripción Premium Mensual', 'cantidad': 1, 'precio': 9.99},
    {
      'nombre': 'Monitor UltraWide 49"',
      'cantidad': 0, // Caso de prueba para stock agotado
      'precio': 1200.50,
    },
    {'nombre': 'Chicle de menta', 'cantidad': 100, 'precio': 0.05},
    {
      'nombre':
          'Escritorio Elevable Eléctrico de Madera de Roble Finlandés con Acabado en Aceite Natural',
      'cantidad': 1,
      'precio': 850.00,
    },
    {'nombre': 'Adaptador USB-C a Jack 3.5mm', 'cantidad': 3, 'precio': 12.45},
    {'nombre': 'Pan Artesanal', 'cantidad': 5, 'precio': 2.25},
    {'nombre': 'Cámara Mirrorless 4K', 'cantidad': 2, 'precio': 1890.00},
    {'nombre': 'Adaptador USB-C a Jack 3.5mm', 'cantidad': 3, 'precio': 12.45},
    {'nombre': 'Adaptador USB-C a Jack 3.5mm', 'cantidad': 3, 'precio': 12.45},
    {'nombre': 'Adaptador USB-C a Jack 3.5mm', 'cantidad': 3, 'precio': 12.45},
    {'nombre': 'Adaptador USB-C a Jack 3.5mm', 'cantidad': 3, 'precio': 12.45},
    {'nombre': 'Adaptador USB-C a Jack 3.5mm', 'cantidad': 3, 'precio': 12.45},
    {'nombre': 'Pan Artesanal', 'cantidad': 5, 'precio': 2.25},
    {'nombre': 'Cámara Mirrorless 4K', 'cantidad': 2, 'precio': 1890.00},
    {'nombre': 'Pan Artesanal', 'cantidad': 5, 'precio': 2.25},
    {'nombre': 'Cámara Mirrorless 4K', 'cantidad': 2, 'precio': 1890.00},
    {'nombre': 'Pan Artesanal', 'cantidad': 5, 'precio': 2.25},
    {'nombre': 'Cámara Mirrorless 4K', 'cantidad': 2, 'precio': 1890.00},
    {'nombre': 'Pan Artesanal', 'cantidad': 5, 'precio': 2.25},
    {'nombre': 'Cámara Mirrorless 4K', 'cantidad': 2, 'precio': 1890.00},
    {'nombre': 'Pan Artesanal', 'cantidad': 5, 'precio': 2.25},
    {'nombre': 'Cámara Mirrorless 4K', 'cantidad': 2, 'precio': 1890.00},
  ];
  //
  //
  Future<void> _recibirDatos(
    BuildContext context,
    Widget widget,
    TextEditingController controller,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

    if (result == null) return;

    setState(() {
      controller.text = result.nombre;
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
    super.dispose();
  }

  // Funciones

  void _incrementarCantidad(int valor) {
    int actual = int.tryParse(_cantidadController.text) ?? 0;
    setState(() {
      _cantidadController.text = (actual + valor).toString();
    });
  }

  // fin funciones

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final AsyncValue<List<Insumo>> insumoAsync = ref.watch(
    //   insumosRepositoryProvider,
    // );
    //
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
      readOnly: true,
      controller: _proveedorController,
      onTap: () => {
        _recibirDatos(
          context,
          AgregarCompraPageProveedorLista(),
          _proveedorController,
        ),
      },
      decoration: InputDecoration(
        labelText:
            "Proveedor", //TODO: Es un combobox o una lista flotante u otra pagina donde se pueda ver como lista y buscar
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.fax_rounded),
      ),
    );
  }

  Widget _buildAgregarInsumo() {
    return TextFormField(
      //TODO: Aqui va el controller y la forma de saber como retoranar cosas de otra pagina
      readOnly: true,
      controller: _insumoController,
      onTap: () => {
        _recibirDatos(
          context,
          AgregarCompraSeleccionInsumoPage(),
          _insumoController,
        ),
      },
      decoration: InputDecoration(
        labelText:
            "Insumo", //TODO: Es un combobox o una lista flotante u otra pagina donde se pueda ver como lista y buscar                  border: OutlineInputBorder(),
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
        child: FilledButton(onPressed: () {}, child: Text("Agregar")),
      ),
    );
  }

  Widget _buildCantidadPrecio() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            enabled: !_isLoading,
            decoration: InputDecoration(
              labelText:
                  "Precio", //TODO: Poner una funcion en la que busque el precio anterior registrado y lo auto acomplete
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
            trailingBuilder: (item) =>
                Text("999", style: tt.labelLarge?.copyWith(color: cs.primary)),
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: () => print("Compra finalizada"),
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

  Widget resumenCompra() {
    //return ListviewCustom(data: data, titleBuilder: titleBuilder, keyBuilder: keyBuilder);
    return Text("hola");
  }
}
