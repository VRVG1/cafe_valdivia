import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgregarVenta extends StatefulWidget {
  const AgregarVenta({super.key});

  @override
  State<AgregarVenta> createState() => _AgregarVentaState(); // @override
  // AgregarClienteState createState() => _AgregarClienteState();
}

class _AgregarVentaState extends State<AgregarVenta> {
  final List<Cliente> _clientes = [
    Cliente(
      id: 1,
      nombre: 'Yoyezer',
      apellido: "Hernandez",
      telefono: '1234567890',
    ),
    Cliente(
      id: 2,
      nombre: 'Alonso',
      apellido: "Hernandez",
      telefono: '1234567890',
    ),
    Cliente(
      id: 3,
      nombre: 'Pedro',
      apellido: "Hernandez",
      telefono: '1234567890',
    ),
    Cliente(
      id: 4,
      nombre: 'Sofia',
      apellido: "Hernandez",
      telefono: '1234567890',
    ),
  ];

  final List<Producto> _productos = [
    Producto(id: 1, nombre: "Cafe 1/2Kg", precioVenta: 140),
    Producto(id: 2, nombre: "Cafe 1Kg", precioVenta: 280),
    Producto(id: 3, nombre: "Cafe 1/4Kg", precioVenta: 70),
    Producto(id: 4, nombre: "Cafe Grano", precioVenta: 120),
    Producto(id: 5, nombre: "Cafe Molido", precioVenta: 666),
  ];

  Cliente? _clienteSeleccionado;
  Producto? _productoSeleccionado;
  double _total = 0.0;
  bool _estaPagado = false;

  final TextEditingController _cantidadController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _cantidadController.addListener(_updateState);
  }

  @override
  void dispose() {
    _cantidadController.removeListener(_updateState);
    _cantidadController.dispose();
    super.dispose();
  }

  void _updateState() {
    final cantidad = double.tryParse(_cantidadController.text) ?? 0.0;
    double nuevoTotal = 0.0;

    if (_productoSeleccionado != null && cantidad > 0) {
      nuevoTotal = cantidad * _productoSeleccionado!.precioVenta;
    }

    setState(() {
      _total = nuevoTotal;
    });
  }

  void _mensajeExito() {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Venta guardada exitosamente',
          style: TextStyle(
            color: theme.colorScheme.onTertiaryContainer,
            fontSize: 18,
          ),
        ),
        backgroundColor: theme.colorScheme.tertiaryContainer,
      ),
    );
  }

  void _mensajeError() {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error al guardar la venta. Por favor, intente de nuevo',
          style: TextStyle(
            color: theme.colorScheme.onErrorContainer,
            fontSize: 18,
          ),
        ),
        backgroundColor: theme.colorScheme.errorContainer,
      ),
    );
  }

  Future<void> _guardarVenta() async {
    if (_formKey.currentState?.validate() ?? false) {
      print(
        'Venta guardada: Cliente: ${_clienteSeleccionado}, Producto: ${_productoSeleccionado}, Total: $_total, Credito: $_estaPagado',
      );
      await Future.delayed(const Duration(seconds: 3));
      _mensajeExito();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            _buildDropdownMenu(
              key: const ValueKey('ClienteDropdown'),
              selectedValue: _clienteSeleccionado,
              onChanged: (cliente) {
                setState(() {
                  _clienteSeleccionado = cliente;
                });
              },
              items: _clientes,
              label: "Cliente",
              icon: Icons.person_outlined,
              itemLabel: (cliente) => cliente.toString(),
            ),
            const SizedBox(height: 24),
            _buildDropdownMenu(
              key: const ValueKey('ProductoDropDown'),
              selectedValue: _productoSeleccionado,
              onChanged: (producto) {
                setState(() {
                  _productoSeleccionado = producto;
                });
              },
              items: _productos,
              label: 'Producto',
              icon: Icons.shopping_bag_outlined,
              itemLabel:
                  (producto) =>
                      '${producto.nombre} - \$${producto.precioVenta.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 24),
            _buildCantidadInput(),
            const SizedBox(height: 32),
            _buildEstadoPagoSwitch(),
            const SizedBox(height: 16),
            _buildTotalDisplay(context),
            const SizedBox(height: 32),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          "Nueva Venta",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed:
                _isLoading
                    ? null
                    : () {
                      Navigator.of(context).pop();
                    },
            icon: Icon(Icons.close),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownMenu<T extends Object>({
    required T? selectedValue,
    required ValueChanged<T?>? onChanged,
    required List<T> items,
    required String label,
    required IconData icon,
    required String Function(T) itemLabel,
    Key? key,
  }) {
    return FormField<T>(
      key: key,
      enabled: !_isLoading,
      initialValue: selectedValue,
      validator: (value) {
        if (value == null) {
          return 'Selecciona un $label';
        }
        return null;
      },
      onSaved: (value) => onChanged?.call(value),
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu<T>(
              label: Text(label),
              leadingIcon: Icon(icon),
              expandedInsets: EdgeInsets.zero,
              initialSelection: selectedValue,
              onSelected: (T? value) {
                state.didChange(value);
                onChanged?.call(value);
                if (label == 'Producto') {
                  _updateState();
                }
              },
              dropdownMenuEntries:
                  items
                      .map(
                        (objeto) => DropdownMenuEntry(
                          value: objeto,
                          label: itemLabel(objeto),
                        ),
                      )
                      .toList(),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsetsGeometry.only(top: 8.0, left: 12.0),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCantidadInput() {
    return TextFormField(
      enabled: !_isLoading,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Ingrese una cantidad";
        }
        return null;
      },
      controller: _cantidadController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*')),
      ],
      decoration: const InputDecoration(
        labelText: 'Cantidad',
        prefixIcon: Icon(Icons.numbers),
      ),
    );
  }

  Widget _buildEstadoPagoSwitch() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.payment_outlined),
      title: Text(_estaPagado ? "Pagado" : "A Crédito"),
      trailing: Switch(
        value: _estaPagado,
        onChanged:
            _isLoading
                ? null
                : (value) {
                  setState(() {
                    _estaPagado = value;
                  });
                },
      ),
    );
  }

  Widget _buildTotalDisplay(BuildContext contex) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Total: \$${_total.toStringAsFixed(2)}',
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text("Cancelar"),
        ),
        const SizedBox(width: 8),
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
                        await _guardarVenta();
                        if (mounted) {
                          Navigator.of(context).pop();
                        }
                      } catch (e) {
                        _mensajeError();
                      } finally {
                        if (mounted) {
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
