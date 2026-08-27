import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticuloNombre extends ConsumerWidget {
  final int articuloId;

  const ArticuloNombre({super.key, required this.articuloId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncArticulos = debugOverride(
      ref,
      'articulo_nombre',
      ref.watch(articuloProviderProvider),
    );
    return asyncArticulos.when(
      data: (articulos) {
        final match = articulos.where((a) => a.id == articuloId);
        return Text(match.isNotEmpty ? match.first.nombre : "ID: $articuloId");
      },
      loading: () => const SkeletonLine(),
      error: (_, __) => Text("ID: $articuloId"),
    );
  }
}
