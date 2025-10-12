import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/proveedor_notifier.dart';
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

  void _mensajeExito() {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Proveedor guardado exitosamente',
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
          'Error al guardar el proveedor. Por favor, intente de nuevo',
          style: TextStyle(
            color: theme.colorScheme.onErrorContainer,
            fontSize: 18,
          ),
        ),
        backgroundColor: theme.colorScheme.errorContainer,
      ),
    );
  }

  Future<void> _guardar() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final proveedor = Proveedor(
      nombre: _nombreController.text,
      telefono: _telefonoController.text,
      email: _correoController.text,
      direccion: _direccionController.text,
    );

    try {
      await ref.read(proveedorProvider.notifier).create(proveedor);
      _mensajeExito();
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
                esObligatorio: false,
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
      validator:
          esObligatorio
              ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el $text';
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
    );
  }
}
