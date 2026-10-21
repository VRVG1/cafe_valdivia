import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/Movimiento/movimiento_notifier.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// Gráfica de barras agrupadas con las ventas y compras de cada mes del año.
///
/// Por defecto muestra el año en curso completo (enero a diciembre); los meses
/// que todavía no tienen movimientos aparecen en cero.
class GraficaMensual extends ConsumerWidget {
  const GraficaMensual({super.key, this.anio});

  /// Año a graficar. Si es null se usa el año en curso.
  final int? anio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final anioTarget = anio ?? DateTime.now().year;
    final movimiento = ref.watch(movimientoMensualProvider(anioTarget));

    return Container(
      padding: AppPadding.allMd,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: AppRadius.lgCircular,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.bar_chart_rounded, size: 20, color: cs.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Ventas y compras por mes · $anioTarget",
                  style: tt.labelLarge?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _Leyenda(color: cs.primary, texto: "Ventas"),
              const SizedBox(width: 12),
              _Leyenda(color: cs.tertiary, texto: "Compras"),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 260,
            child: movimiento.when(
              data: (data) => _GraficaBarras(datos: data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Text(
                  "No disponible",
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Leyenda extends StatelessWidget {
  const _Leyenda({required this.color, required this.texto});

  final Color color;
  final String texto;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          texto,
          style: tt.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _GraficaBarras extends StatelessWidget {
  const _GraficaBarras({required this.datos});

  final List<Map<String, dynamic>> datos;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final maxValor = datos.fold<double>(0, (max, fila) {
      final ventas = _aDouble(fila['total_ventas']);
      final compras = _aDouble(fila['total_compras']);
      return [max, ventas, compras].reduce((a, b) => a > b ? a : b);
    });

    // Un poco de aire arriba para que la barra más alta no toque el borde.
    final maxY = maxValor <= 0 ? 100.0 : maxValor * 1.2;

    return BarChart(
      BarChartData(
        maxY: maxY,
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => cs.inverseSurface,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final fila = datos[group.x];
              final esVentas = rodIndex == 0;
              return BarTooltipItem(
                '${fila['nombre_mes']} ${fila['anio']}\n',
                TextStyle(
                  color: cs.onInverseSurface,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text:
                        '${esVentas ? "Ventas" : "Compras"}: ${_moneda(rod.toY)}',
                    style: TextStyle(
                      color: cs.onInverseSurface,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxY / 4,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: cs.outlineVariant.withAlpha(120), strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 56,
              interval: maxY / 4,
              getTitlesWidget: (value, meta) => Text(
                _compacto(value),
                style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (value, meta) {
                final indice = value.toInt();
                if (indice < 0 || indice >= datos.length) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    datos[indice]['nombre_mes'] as String,
                    style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                );
              },
            ),
          ),
        ),
        barGroups: [
          for (int i = 0; i < datos.length; i++)
            BarChartGroupData(
              x: i,
              barsSpace: 4,
              barRods: [
                BarChartRodData(
                  toY: _aDouble(datos[i]['total_ventas']),
                  color: cs.primary,
                  width: 16,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(3),
                  ),
                ),
                BarChartRodData(
                  toY: _aDouble(datos[i]['total_compras']),
                  color: cs.tertiary,
                  width: 16,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(3),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

double _aDouble(dynamic valor) {
  if (valor == null) return 0;
  if (valor is num) return valor.toDouble();
  return double.tryParse(valor.toString()) ?? 0;
}

String _moneda(double valor) =>
    NumberFormat.currency(locale: 'en_MX', symbol: '\$').format(valor);

/// Formato corto para los ejes: 12.3K, 1.2M.
String _compacto(double valor) {
  if (valor.abs() >= 1000000) {
    return '${(valor / 1000000).toStringAsFixed(1)}M';
  }
  if (valor.abs() >= 1000) {
    return '${(valor / 1000).toStringAsFixed(1)}K';
  }
  return valor.toStringAsFixed(0);
}
