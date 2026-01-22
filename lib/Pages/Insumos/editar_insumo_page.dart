import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/insumo_notifier.dart';
import 'package:cafe_valdivia/providers/unidad_medida_notifier.dart';
import 'package:cafe_valdivia/providers/unidad_medida_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditarInsumoPage extends ConsumerStatefulWidget {
  final Insumo insumo;
  const EditarInsumoPage({super.key, required this.insumo});

  @override
  EditarInsumoPageState createState() => EditarInsumoPageState();
}

class EditarInsumoPageState extends ConsumerState<EditarInsumoPage> {
  late final TextEditingController _descripcionController;
  late final TextEditingController _nombreController;
  UnidadMedida? _selectedUnidadMedidad;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _descripcionController = TextEditingController(
      text: widget.insumo.descripcion,
    );
    _nombreController = TextEditingController(text: widget.insumo.nombre);
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    _nombreController.dispose();
    super.dispose();
  }

  Future<void> _update(UnidadMedida unidadInicial) async {
    final unidadFinal = _selectedUnidadMedidad ?? unidadInicial;

    final updatedInsumo = widget.insumo.copyWith(
      idInsumo: widget.insumo.idInsumo, //TODO: ES idInsumo o idUnidad???
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      idUnidad: unidadFinal.idUnidadMedida!,
    );

    update<Insumo>(
      context: context,
      ref: ref,
      provider: insumoProvider,
      element: updatedInsumo,
      mensajeExito: "Se actualizo la Unidad de Medida de forma correcta.",
      mensajeError:
          "Error al actualizar la Unidad de Medidad, Por favor intente de nuevo.",
    );

    await ref.read(insumoProvider.notifier).updateElement(updatedInsumo);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final unidadMedidaAsync = ref.watch(
      unidadMedidaDetailProvider(widget.insumo.idUnidad),
    );

    return unidadMedidaAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Error cargando unidad de medida: $e')),
      ),
      data: (unidadInicial) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Editar Insumo",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildActionButtons(context, unidadInicial),
              ),
            ],
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTextField(
                    label: "Nombre",
                    controller: _nombreController,
                    icon: Icons.label_outline,
                  ),
                  const SizedBox(height: 16),
                  _buildDropDownMenu(unidadInicial),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: "Descripcion",
                    controller: _descripcionController,
                    icon: Icons.description_outlined,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextFormField(
      enabled: !_isLoading,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }

  //TODO: Hay que refactorizar esta funcion, ya que esta elaborada con las patas.
  Widget _buildDropDownMenu(UnidadMedida unidadInicial) {
    return Consumer(
      builder: (context, ref, child) {
        final asyncUM = ref.watch(unidadMedidaProvider);

        return asyncUM.when(
          data: (ums) {
            return FormField<UnidadMedida>(
              initialValue: unidadInicial,
              validator: (value) {
                if (_selectedUnidadMedidad == null) {
                  return 'Por favor, selecciona una unidad';
                }
                return null;
              },
              builder: (FormFieldState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownMenu<UnidadMedida>(
                      label: const Text("Unidad de Medida"),
                      leadingIcon: const Icon(Icons.balance_rounded),
                      expandedInsets: EdgeInsets.zero,
                      initialSelection: _selectedUnidadMedidad,
                      onSelected: (UnidadMedida? unidadMedida) {
                        setState(() {
                          _selectedUnidadMedidad = unidadMedida;
                          FormFieldState.didChange(unidadMedida);
                        });
                      },
                      dropdownMenuEntries: ums.map((unidadMedida) {
                        return DropdownMenuEntry<UnidadMedida>(
                          value: unidadMedida,
                          label: unidadMedida.nombre,
                        );
                      }).toList(),
                    ),
                    if (FormFieldState.hasError)
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 8),
                        child: Text(
                          FormFieldState.errorText!,
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
          },
          error: (err, stack) => Center(child: Text("Error: $err")),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context, UnidadMedida unidadInicial) {
    final theme = Theme.of(context);

    return FilledButton(
      onPressed: _isLoading
          ? null
          : () async {
              if (_formKey.currentState?.validate() ?? false) {
                setState(() {
                  _isLoading = true;
                });
                try {
                  await _update(unidadInicial);
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
    );
  }
}
