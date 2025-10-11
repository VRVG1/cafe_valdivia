import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/proveedor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditarProveedor extends ConsumerStatefulWidget {
  final Proveedor proveedor;
  const EditarProveedor({super.key, required this.proveedor});
  @override
  _EditarProveedorState createState() => _EditarProveedorState();
}

class _EditarProveedorState extends ConsumerState<EditarProveedor> {
  late final TextEditingController _nombreController;
  late final TextEditingController _direccionController;
  late final TextEditingController _telefonoController;
  late final TextEditingController _emailController;
  late final String acronimo;
  late final int? _id;

  final _formKey = GlobalKey<FormState>();

  late String _initialNombre;
  late String _initialDireccion;
  late String _initialTelefono;
  late String _initialEmail;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.proveedor.nombre);
    _direccionController = TextEditingController(
      text: widget.proveedor.direccion,
    );
    _telefonoController = TextEditingController(
      text: widget.proveedor.telefono,
    );
    _emailController = TextEditingController(text: widget.proveedor.email);
    acronimo = widget.proveedor.getIniciales();
    _id = widget.proveedor.id;

    _initialNombre = widget.proveedor.nombre;
    _initialDireccion = widget.proveedor.direccion ?? '';
    _initialTelefono = widget.proveedor.telefono.toString();
    _initialEmail = widget.proveedor.email ?? '';
  }

  bool get _isDirty {
    return _nombreController.text != _initialNombre ||
        _direccionController.text != _initialDireccion ||
        _telefonoController.text != _initialTelefono ||
        _emailController.text != _initialEmail;
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _direccionController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<bool> _showExitConfirmDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('¿Descartar cambios?'),
                content: const Text(
                  'Hay cambios sin guardar. Si sales, se perderán.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Descartar'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  void dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirmar Modificación'),
          content: const Text(
            '¿Estás seguro de que deseas modificar los datos de este proveedor?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _saveChanges(dialogContext);
              },
              child: const Text('Modificar'),
            ),
          ],
        );
      },
    );
  }

  void _saveChanges(BuildContext dialogContext) async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      Navigator.of(dialogContext).pop(); // Close dialog
      return;
    }

    if (_id == null) {
      Navigator.of(dialogContext).pop(); // Close dialog
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error: No se puede actualizar un proveedor sin ID.'),
          ),
        );
      }
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final proveedorModificado = Proveedor(
      id: _id,
      nombre: _nombreController.text,
      direccion: _direccionController.text,
      telefono: _telefonoController.text,
      email: _emailController.text,
    );

    try {
      await ref
          .read(proveedorNotifierProvider.notifier)
          .updateProveedor(proveedorModificado);

      if (mounted) {
        Navigator.of(dialogContext).pop(); // Close dialog
        Navigator.of(context).pop(); // Close edit screen
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar los cambios: $e')),
        );
      }
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
    final ThemeData theme = Theme.of(context);
    return PopScope(
      canPop: !_isDirty || _isLoading,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showExitConfirmDialog(context);
        if (shouldPop && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Editar Proveedor",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: FilledButton(
                onPressed:
                    _isLoading
                        ? null
                        : () {
                          dialog(context);
                        },
                child:
                    _isLoading
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Text(
                          "Guardar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(theme, acronimo),
                const SizedBox(height: 32),
                Text(
                  "Información Personal",
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                _buildTextField(label: "Nombre", controller: _nombreController),
                const SizedBox(height: 24),
                _buildTextField(
                  label: "Direccion",
                  controller: _direccionController,
                ),
                const SizedBox(height: 24),
                Text("Datos de Contanto", style: theme.textTheme.titleMedium),
                const SizedBox(height: 24),
                _buildTextField(
                  label: "Telefono",
                  icon: Icons.phone_android_rounded,
                  controller: _telefonoController,
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  label: "Email",
                  icon: Icons.email_rounded,
                  controller: _emailController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, String acronimo) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          radius: 80,
          child: Text(
            acronimo,
            style: theme.textTheme.displayLarge?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.proveedor.nombre,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    Key? key,
    String? label,
    IconData? icon,
    String suffixText = '',
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    final theme = Theme.of(context);
    return TextFormField(
      key: key,
      controller: controller,
      validator: validator,
      enabled: !_isLoading,
      onChanged: (value) {
        setState(() {});
      },
      style: theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: theme.colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        prefixIcon:
            icon != null
                ? Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 10.0),
                  child: Icon(icon, color: theme.colorScheme.primary),
                )
                : null,
        suffixText: suffixText,
        suffixStyle: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          // Borde en caso de error
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2.0,
          ),
        ),
        filled: true,
        fillColor: Theme.of(
          context,
        ).colorScheme.surfaceContainerHigh.withAlpha(178),
        contentPadding: const EdgeInsetsGeometry.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
      ),
    );
  }
}

