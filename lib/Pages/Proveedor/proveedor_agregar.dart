import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/proveedor_notifier.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProveedorAgregar extends ConsumerStatefulWidget {
  const ProveedorAgregar({super.key});

  @override
  ProveedorAgregarState createState() => ProveedorAgregarState();
}

class ProveedorAgregarState extends ConsumerState<ProveedorAgregar> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _correoController.dispose();
    _telefonoController.dispose();
    _direccionController.dispose();
    _nombreController.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    if (_formKey.currentState?.validate() ?? false) {
      final Proveedor proveedor = Proveedor(
        nombre: _nombreController.text,
        telefono: _telefonoController.text,
        email: _correoController.text,
        direccion: _direccionController.text,
      );
      create<Proveedor>(
        context: context,
        ref: ref,
        provider: proveedorProvider,
        element: proveedor,
        mensajeExito: "El Proveedor se guardo con exito",
        mensajeError:
            "Error al guardar el proveedor. Por favor, intente de nuevo.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Proveedor",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            if (!_isLoading) {
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                esObligatorio: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Telefono",
                controller: _telefonoController,
                icon: Icons.phone_outlined,
                esObligatorio: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Correo",
                controller: _correoController,
                icon: Icons.mail_outlined,
                esObligatorio: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Direccion",
                controller: _direccionController,
                icon: Icons.add_location_alt_rounded,
                esObligatorio: false,
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
    required bool esObligatorio,
  }) {
    return TextFormField(
      enabled: !_isLoading,
      controller: controller,
      validator: esObligatorio
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese el $text';
              }
              if (controller.hashCode == _correoController.hashCode) {
                if (!EmailValidator.validate(value)) {
                  return "Ingere un correo valido";
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
            }
          : null,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton(
      onPressed: _isLoading ? null : _guardar,
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
    );
  }
}
