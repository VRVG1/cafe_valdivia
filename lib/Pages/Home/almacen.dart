import 'package:cafe_valdivia/Components/carta_resume.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/table_resume.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/core/theme/stock_nivel.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sección del Home que muestra una tabla con los artículos de café del
/// almacén.
///
/// La tabla muestra únicamente las familias de café indicadas en
/// [_familiasMostradas]. Cada artículo se compara contra el artículo con más
/// stock de su misma familia para obtener un porcentaje, y ese porcentaje
/// define el aviso visual (normal / poco stock / crítico / sin stock).
class Almacen extends ConsumerWidget {
  const Almacen({super.key});

  /// Familias de café que aparecen en la tabla. Se busca por fragmento del
  /// nombre (sin distinguir mayúsculas), así que cubre todas sus variedades:
  /// "Cafe molido medio", "Cafe molido oscuro", "Cafe verde calidad buena",
  /// "cafe tostado oscuro", etc.
  ///
  /// Para mostrar otra familia o quitar alguna, edita esta lista.
  static const List<String> _familiasMostradas = [
    'molido',
    'verde',
    'tostado',
    'bola',
    'pergamino',
  ];

  /// Umbral superior: por encima de este porcentaje el stock se ve normal.
  static const double _umbralNormal = 40;

  /// Umbral inferior: por debajo de este porcentaje el aviso es grave.
  static const double _umbralCritico = 20;

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
                "Artículos de café",
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
    final familias = articulos
        .where((a) => _familia(a.nombre).isNotEmpty)
        .toList();

    if (familias.isEmpty) {
      return ErrorView(message: "No hay artículos de café en el almacén.");
    }

    // El 100% de cada familia es el artículo con más stock de esa familia.
    final maxPorFamilia = <String, double>{};
    for (final articulo in familias) {
      final familia = _familia(articulo.nombre);
      final actual = maxPorFamilia[familia] ?? 0;
      if (articulo.stock > actual) {
        maxPorFamilia[familia] = articulo.stock;
      }
    }

    final porcentajes = <String, double>{
      for (final articulo in familias)
        articulo.nombre: (maxPorFamilia[_familia(articulo.nombre)] ?? 0) <= 0
            ? 0
            : (articulo.stock / maxPorFamilia[_familia(articulo.nombre)]!) * 100,
    };

    // ============ ORDEN DE LOS ARTÍCULOS ============
    // Cambia aquí el criterio de ordenamiento de la tabla.
    // 1. Los artículos sin stock van primero.
    // 2. Después, por porcentaje de stock ascendente (los más críticos arriba).
    // 3. A igual porcentaje, se ordenan alfabéticamente por nombre.
    familias.sort((a, b) {
      final aSinStock = a.stock <= 0;
      final bSinStock = b.stock <= 0;
      if (aSinStock != bSinStock) return aSinStock ? -1 : 1;

      final pa = porcentajes[a.nombre]!;
      final pb = porcentajes[b.nombre]!;
      if (pa != pb) return pa.compareTo(pb);

      return a.nombre.compareTo(b.nombre);
    });

    final items = familias.map((a) {
      final porcentaje = porcentajes[a.nombre]!;
      final nivel = _nivel(a.stock, porcentaje);
      return <String, dynamic>{
        'producto': a.nombre,
        'nota': '${porcentaje.round()}% · ${nivel.etiqueta}',
        'nivel': nivel,
        'cantidad': _numero(a.stock),
        'precio': a.costoUnitario.toStringAsFixed(2),
        'total': (a.stock * a.costoUnitario).toStringAsFixed(2),
      };
    }).toList();

    return tableResume(cs, tt, items, ["Artículo", "Stock", "Costo", "Total"]);
  }

  /// Clasifica el artículo según su porcentaje de stock dentro de su familia.
  NivelStock _nivel(double stock, double porcentaje) {
    if (stock <= 0) return NivelStock.sinStock;
    if (porcentaje < _umbralCritico) return NivelStock.critico;
    if (porcentaje < _umbralNormal) return NivelStock.advertencia;
    return NivelStock.normal;
  }

  /// Devuelve la familia de café a la que pertenece el artículo, o cadena
  /// vacía si no pertenece a ninguna de las [_familiasMostradas].
  static String _familia(String nombre) {
    final normalizado = nombre.toLowerCase();
    for (final familia in _familiasMostradas) {
      if (normalizado.contains(familia)) return familia;
    }
    return '';
  }
}

String _numero(double valor) {
  if (valor == valor.roundToDouble()) return valor.toInt().toString();
  return valor.toStringAsFixed(2);
}
