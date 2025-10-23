import 'package:cafe_valdivia/providers/unidad_medida_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnidadMedidaNombre extends ConsumerWidget {
  final int unidadMedidaId;

  const UnidadMedidaNombre({super.key, required this.unidadMedidaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUnidadMedida = ref.watch(
      unidadMedidaDetailProvider(unidadMedidaId),
    );

    return asyncUnidadMedida.when(
      data: (unidadMedida) => Text(unidadMedida.nombre),
      loading: () => const Text('...'),
      error: (err, stack) => const Text('Error'),
    );
  }
}
