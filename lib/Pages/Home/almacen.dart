import 'package:cafe_valdivia/Components/carta_resume.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/table_resume.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sección del Home que muestra una tabla con los artículos seleccionados
/// del almacén.
///
/// La "selección" corresponde a los artículos con menor stock, ordenados de
/// forma ascendente, para que el dashboard destaque lo que requiere atención.
class Almacen extends ConsumerWidget {
  const Almacen({super.key});

  /// Cantidad máxima de artículos que se listan en la maqueta.
  static const int _limite = 8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final asyncArticulos = ref.watch(articuloProviderProvider);

    return Padding(
      padding: AppPadding.hLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: seccionEtiqueta("Almacén", cs)),
              Text(
                "Artículos seleccionados",
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 12),
          asyncArticulos.when(
            data: (articulos) => _tabla(cs, tt, articulos),
            loading: () => const ShimmerTableResume(rowCount: 5),
            error: (err, stack) => ErrorView(
              message: "No se pudieron cargar los artículos",
              onRetry: () => ref.invalidate(articuloProviderProvider),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabla(ColorScheme cs, TextTheme tt, List<Articulo> articulos) {
    if (articulos.isEmpty) {
      return ErrorView(message: "No hay artículos en el almacén.");
    }

    final seleccionados = [...articulos]
      ..sort((a, b) => a.stock.compareTo(b.stock));

    final items = seleccionados.take(_limite).map((a) {
      return <String, dynamic>{
        'producto': a.nombre,
        'cantidad': _numero(a.stock),
        'precio': a.costoUnitario.toStringAsFixed(2),
        'total': (a.stock * a.costoUnitario).toStringAsFixed(2),
      };
    }).toList();

    return tableResume(cs, tt, items, ["Artículo", "Stock", "Costo", "Total"]);
  }
}

String _numero(double valor) {
  if (valor == valor.roundToDouble()) return valor.toInt().toString();
  return valor.toStringAsFixed(2);
}
