import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/providers/crear_compra_notifier.dart';
import 'package:cafe_valdivia/providers/insumo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddInsumoDialog extends ConsumerStatefulWidget {
  const AddInsumoDialog({super.key});

  @override
  ConsumerState<AddInsumoDialog> createState() => _AddInsumoDialogState();
}

class _AddInsumoDialogState extends ConsumerState<AddInsumoDialog> {
  final _formKey = GlobalKey<FormState>();
  Insumos? _selectedInsumo;
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();

  @override
  void dispose() {
    _cantidadController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final cantidad = double.tryParse(_cantidadController.text) ?? 0;
      final precio = double.tryParse(_precioController.text) ?? 0;

      if (_selectedInsumo != null && cantidad > 0 && precio > 0) {
        ref
            .read(crearCompraProvider.notifier)
            .agregarItem(_selectedInsumo!, cantidad, precio);
        Navigator.of(context).pop(); // Cierra el diálogo
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncInsumos = ref.watch(insumoProvider);

    return AlertDialog(
      title: const Text('Añadir Insumo'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              asyncInsumos.when(
                loading: () => const CircularProgressIndicator(),
                error: (err, stack) => Text('Error: $err'),
                data: (insumos) {
                  return DropdownMenu<Insumos>(
                    label: const Text('Insumo'),
                    expandedInsets: EdgeInsets.zero,
                    dropdownMenuEntries:
                        insumos.map((insumo) {
                          return DropdownMenuEntry<Insumos>(
                            value: insumo,
                            label: insumo.nombre,
                          );
                        }).toList(),
                    onSelected: (insumo) {
                      setState(() {
                        _selectedInsumo = insumo;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cantidadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Cantidad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una cantidad';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'La cantidad debe ser un número positivo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _precioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Precio de Compra',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un precio';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'El precio debe ser un número positivo';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(onPressed: _submit, child: const Text('Aceptar')),
      ],
    );
  }
}
