import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnidadMedidaDropdown extends StatelessWidget {
  final AsyncValue<List<UnidadMedida>> asyncData;
  final UnidadMedida? selectedValue;
  final UnidadMedida? initialValue;
  final ValueChanged<UnidadMedida?> onChanged;
  final VoidCallback? onRetry;

  const UnidadMedidaDropdown({
    super.key,
    required this.asyncData,
    required this.selectedValue,
    required this.onChanged,
    this.initialValue,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return asyncData.when(
      data: (ums) => _buildDropdown(context, ums),
      error: (err, stack) => ErrorRetryField(
        label: "Unidad de Medida",
        leadingIcon: Icons.balance_rounded,
        showCarita: true,
        onRetry: onRetry ?? () {},
      ),
      loading: () => const SkeletonDropMenu(),
    );
  }

  Widget _buildDropdown(BuildContext context, List<UnidadMedida> ums) {
    return FormField<UnidadMedida>(
      initialValue: initialValue,
      validator: (value) {
        if (value == null) {
          return 'Seleccione una unidad de medida';
        }
        return null;
      },
      builder: (FormFieldState<UnidadMedida> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu<UnidadMedida>(
              label: const Text("Unidad de Medida"),
              leadingIcon: const Icon(Icons.balance_rounded),
              expandedInsets: EdgeInsets.zero,
              initialSelection: state.value,
              onSelected: (UnidadMedida? unidadMedida) {
                state.didChange(unidadMedida);
                onChanged(unidadMedida);
              },
              dropdownMenuEntries: ums.map((unidadMedida) {
                return DropdownMenuEntry<UnidadMedida>(
                  value: unidadMedida,
                  label: unidadMedida.nombre,
                );
              }).toList(),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: Text(
                  state.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
