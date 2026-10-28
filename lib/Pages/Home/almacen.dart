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
/// La tabla muestra únicamente las familias indicadas en [_familias]. El
/// porcentaje de cada artículo se calcula contra el stock máximo manual de su
/// familia (100%), y ese porcentaje define el aviso visual
/// (normal / poco stock / crítico / sin stock).
class Almacen extends ConsumerWidget {
  const Almacen({super.key});

  /// Familias que aparecen en la tabla, junto con el stock que representa su
  /// 100%.
  ///
  /// La coincidencia se hace por fragmento del nombre (sin distinguir
  /// mayúsculas), así que cada entrada cubre todas sus variedades. El orden
  /// importa: si un nombre coincide con dos familias, gana la primera.
  ///
  /// Para agregar otro grupo, agrega una entrada aquí.
  static const List<_FamiliaStock> _familias = [
    _FamiliaStock('molido', 10),
    _FamiliaStock('verde', 10000),
    _FamiliaStock('tostado', 1000),
    _FamiliaStock('bola', 1000),
    _FamiliaStock('pergamino', 1000),
    _FamiliaStock('Bolita', 400),
    _FamiliaStock('Bolsa Cuarto', 100),
    _FamiliaStock('Bolsa Medio', 100),
    _FamiliaStock('Bolsa Kilo', 100),
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
        .where((a) => _familia(a.nombre) != null)
        .toList();

    if (familias.isEmpty) {
      return ErrorView(message: "No hay artículos en el almacén.");
    }

    // El 100% de cada familia es el stock máximo configurado manualmente.
    double porcentajeDe(Articulo articulo) {
      final familia = _familia(articulo.nombre);
      if (familia == null || familia.stockMaximo <= 0) return 0;
      return (articulo.stock / familia.stockMaximo * 100)
          .clamp(0, 100)
          .toDouble();
    }

    final porcentajes = <String, double>{
      for (final articulo in familias) articulo.nombre: porcentajeDe(articulo),
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

  /// Clasifica el artículo según su porcentaje de stock contra el máximo
  /// manual de su familia.
  NivelStock _nivel(double stock, double porcentaje) {
    if (stock <= 0) return NivelStock.sinStock;
    if (porcentaje < _umbralCritico) return NivelStock.critico;
    if (porcentaje < _umbralNormal) return NivelStock.advertencia;
    return NivelStock.normal;
  }

  /// Devuelve la familia a la que pertenece el artículo, o null si no coincide
  /// con ninguna de [_familias].
  static _FamiliaStock? _familia(String nombre) {
    for (final familia in _familias) {
      if (familia.coincide(nombre)) return familia;
    }
    return null;
  }
}

/// Familia de artículos que se muestra en la tabla del almacén.
class _FamiliaStock {
  /// Fragmento que debe contener el nombre del artículo. La comparación no
  /// distingue mayúsculas.
  final String nombre;

  /// Stock que representa el 100% de la familia.
  final double stockMaximo;

  const _FamiliaStock(this.nombre, this.stockMaximo);

  /// True si el nombre del artículo pertenece a esta familia.
  bool coincide(String nombreArticulo) =>
      nombreArticulo.toLowerCase().contains(nombre.toLowerCase());
}

String _numero(double valor) {
  if (valor == valor.roundToDouble()) return valor.toInt().toString();
  return valor.toStringAsFixed(2);
}
