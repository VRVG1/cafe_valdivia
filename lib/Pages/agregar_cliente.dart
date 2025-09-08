import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter/material.dart';

class Agregarcliente extends StatefulWidget {
  const Agregarcliente({super.key});

  @override
  State<Agregarcliente> createState() => _AgregarClienteState(); // @override
}

class _AgregarClienteState extends State<Agregarcliente> {
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

  void _mensajeExito() {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Cliente guardado exitosamante',
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
          'Error al guardar el cliente. Por favor, intente de nuevo',
          style: TextStyle(
            color: theme.colorScheme.onErrorContainer,
            fontSize: 18,
          ),
        ),
        backgroundColor: theme.colorScheme.errorContainer,
      ),
    );
  }

  Future<void> _guardarCliente() async {
    if (_formKey.currentState?.validate() ?? false) {
      final database = DatabaseHelper();
      final repo = ClienteRepository(database);
      final cliente = Cliente(
        nombre: _nombreController.text,
        apellido: _apellidoController.text,
        telefono: _telefonoController.text,
        email: _correoController.text,
      );
      await repo.create(cliente);
      // await Future.delayed(const Duration(seconds: 5));
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
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
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
          "Agregar Cliente",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
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
                        await _guardarCliente();
                        if (mounted) {
                          Navigator.of(context).pop();
                        }
                      } catch (e) {
                        _mensajeError();
                        if (mounted) {
                          Navigator.of(context).pop();
                        }
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
