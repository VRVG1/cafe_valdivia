import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/providers/cliente_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Agregarcliente extends ConsumerStatefulWidget {
  const Agregarcliente({super.key});

  @override
  AgregarClienteState createState() => AgregarClienteState(); // @override
}

class AgregarClienteState extends ConsumerState<Agregarcliente> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _correoController.dispose();
    _telefonoController.dispose();
    _apellidoController.dispose();
    _nombreController.dispose();
    super.dispose();
  }

  Future<void> _guardarCliente() async {
    if (_formKey.currentState?.validate() ?? false) {
      final cliente = Cliente(
        nombre: _nombreController.text,
        apellido: _apellidoController.text,
        telefono: _telefonoController.text,
        email: _correoController.text,
      );
      create<Cliente>(
        context: context,
        ref: ref,
        provider: clienteProvider,
        element: cliente,
        mensajeExito: "El Cliente se guerdo con exito.",
        mensajeError:
            "Error al guardar el cliente. Por favor, intente de nuevo.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Cliente",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                text: "Nombre",
                controller: _nombreController,
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Apellido",
                controller: _apellidoController,
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Telefono",
                controller: _telefonoController,
                icon: Icons.phone_outlined,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Correo",
                controller: _correoController,
                icon: Icons.mail_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? text,
    TextEditingController? controller,
    IconData? icon,
  }) {
    return TextFormField(
      enabled: !_isLoading,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el $text';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
                        await _guardarCliente();
                      } finally {
                        if (context.mounted) {
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
