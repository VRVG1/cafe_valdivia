import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/insumo_notifier.dart';
import 'package:cafe_valdivia/providers/unidad_medida_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarInsumosPage extends ConsumerStatefulWidget {
  const AgregarInsumosPage({super.key});

  @override
  AgregarInsumosPageState createState() => AgregarInsumosPageState();
}

class AgregarInsumosPageState extends ConsumerState<AgregarInsumosPage> {
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  UnidadMedida? _selectedUnidadMedidad;

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    _nombreController.dispose();

    super.dispose();
  }

  void _mensajeExito() {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Insumo guardado exitosamente',
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
          'Error al guardar el insumo. Por favor, intente de nuevo',
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
    if ((_formKey.currentState?.validate() ?? false) &&
        _selectedUnidadMedidad != null) {
      final insumo = Insumos(
        nombre: _nombreController.text,
        descripcion: _descripcionController.text,
        idUnidad: _selectedUnidadMedidad!.id!,
      );
      await ref.read(insumoProvider.notifier).create(insumo);
      // await Future.delayed(const Duration(seconds: 5));
      _mensajeExito();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Insumo",
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
              _buildDropDownMenu(),
              const SizedBox(height: 16),
              _buildTextField(
                text: "Descripcion",
                controller: _descripcionController,
                icon: Icons.person_outline,
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

  Widget _buildDropDownMenu() {
    return Consumer(
      builder: (context, ref, child) {
        final asyncUM = ref.watch(unidadMedidaProvider);

        return asyncUM.when(
          data: (ums) {
            return DropdownMenu<UnidadMedida>(
              label: const Text("Unidad de Medida"),
              leadingIcon: const Icon(Icons.balance_rounded),
              expandedInsets: EdgeInsets.zero,
              initialSelection: _selectedUnidadMedidad,
              onSelected: (UnidadMedida? unidadMedida) {
                setState(() {
                  _selectedUnidadMedidad = unidadMedida;
                });
              },
              dropdownMenuEntries:
                  ums.map((unidadMedida) {
                    return DropdownMenuEntry<UnidadMedida>(
                      value: unidadMedida,
                      label: unidadMedida.nombre,
                    );
                  }).toList(),
            );
          },
          error: (err, stack) => Center(child: Text("Error: $err")),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
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
