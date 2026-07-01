import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/providers/Cliente/cliente_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Agregarcliente extends ConsumerStatefulWidget {
  const Agregarcliente({super.key});

  @override
  AgregarClienteState createState() => AgregarClienteState();
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
          tooltip: "Cerrar",
          onPressed: () {
            Navigator.of(context).pop();
          },
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                text: "Nombre",
                controller: _nombreController,
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Apellido",
                controller: _apellidoController,
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Telefono",
                controller: _telefonoController,
                icon: Icons.phone_rounded,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Correo",
                controller: _correoController,
                icon: Icons.mail_rounded,
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
    return AppBuildTextField(
      text: text ?? '',
      controller: controller!,
      icon: icon ?? Icons.person_rounded,
      isLoading: _isLoading,
      customValidator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el $text';
        }
        if (controller.hashCode == _correoController.hashCode) {
          if (!EmailValidator.validate(value)) {
            return "Ingrese un correo valido";
          }
        }
        if (controller.hashCode == _telefonoController.hashCode) {
          if (int.tryParse(value) == null) {
            return "Numero de telefono no valido";
          }
          if (value.length != 10) {
            return "El numero no tiene que ser de 10 digitos";
          }
        }
        return null;
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Semantics(
          label: "Guardar cliente",
          child: FilledButton(
            // El botón se deshabilita si el formulario no es válido
            onPressed: _isLoading
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
        ),
      ],
    );
  }
}
