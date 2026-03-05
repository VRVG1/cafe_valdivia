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
    super.initState();
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
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    //TODO: Aqui va el controller y la forma de saber como retoranar cosas de otra pagina
                    readOnly: true,
                    onTap: () => {
                      print("Abrir pagina de seleccion de proveedore"),
                    },
                    decoration: InputDecoration(
                      labelText:
                          "Proveedor", //TODO: Es un combobox o una lista flotante u otra pagina donde se pueda ver como lista y buscar
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fax_rounded),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    //TODO: Aqui va el controller y la forma de saber como retoranar cosas de otra pagina
                    readOnly: true,
                    onTap: () => {
                      print("Abrir pagina de seleccion de Insumos"),
                    },
                    decoration: InputDecoration(
                      labelText:
                          "Insumo", //TODO: Es un combobox o una lista flotante u otra pagina donde se pueda ver como lista y buscar                  border: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fax_rounded),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
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
                  ),
                  if (_isButtonsExpresive)
                    TapRegion(
                      groupId: _grupoCantidad,
                      child: _cantidadButtonsWidget(theme.colorScheme),
                    ),

                  const SizedBox(height: 32),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 128),
                    child: SizedBox(
                      height: 56,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text("Agregar"),
                      ),
                    ),
                  ),

                  //TODO: El detalles va en la parte final, antes de realizar la compra, por si se quiere comentar algo
                  // TextFormField(
                  //   enabled: !_isLoading,
                  //   keyboardType: TextInputType.multiline,
                  //   maxLines: null,
                  //   decoration: InputDecoration(
                  //     labelText: "Comentarios",
                  //     border: OutlineInputBorder(),
                  //     prefixIcon: Icon(Icons.fax_rounded),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.12, // Altura visible inicial (pestaña)
            minChildSize: 0.12, // Mínimo que se puede encoger
            maxChildSize: 0.6, // Máximo que se puede expandir
            snap: true, // Salta a las posiciones min/max automáticamente
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController, // Obligatorio para el drag
                  children: [
                    // Tirador visual
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Resumen de Compra",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(),
                    // Aquí iría la lista de items agregados o detalles extra
                    ListTile(
                      leading: Icon(
                        Icons.shopping_basket,
                        color: theme.colorScheme.primary,
                      ),
                      title: const Text("Harina de Trigo"),
                      subtitle: const Text("12 unidades x \$2.50"),
                      trailing: Text(
                        "\$30.00",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
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
