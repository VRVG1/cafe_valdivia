import 'package:cafe_valdivia/Components/carta_resume.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Pages/Home/grafica_mensual.dart';
import 'package:cafe_valdivia/core/models/rango_fechas.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:cafe_valdivia/providers/Venta/venta_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

/// Lista de cartas de resumen que se muestran en el Home.
///
/// Cada carta resume un módulo de la aplicación (Ventas y Compras) usando los
/// datos reales expuestos por los providers, y debajo se muestra la gráfica
/// mensual de ventas y compras.
class Listhome extends ConsumerWidget {
  const Listhome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;

    final ventasPorDia = ref.watch(
      ventasPorDiaProvider(const RangoFechas('2026-10-19', '2026-10-25')),
    );
    final comprasPorDia = ref.watch(
      comprasPorDiaProvider(const RangoFechas('2026-10-19', '2026-10-25')),
    );

    final cartas = <Widget>[
      ventasPorDia.when(
        data: (data) {
          final total = data.fold<double>(
            0,
            (suma, venta) => suma + _aDouble(venta['total_venta']),
          );
          final ventas = data.fold<int>(
            0,
            (suma, venta) => suma + _aInt(venta['num_ventas']),
          );
          return _CartaResumen(
            icono: Icons.point_of_sale_rounded,
            titulo: "Ventas de la semana",
            valor: _moneda(total),
            detalle: "$ventas ventas registradas",
          );
        },
        loading: () => const _CartaResumen(
          icono: Icons.point_of_sale_rounded,
          titulo: "Ventas",
          cargando: true,
        ),
        error: (err, stack) => const _CartaResumen(
          icono: Icons.point_of_sale_rounded,
          titulo: "Ventas",
          valor: "—",
          detalle: "No disponible",
        ),
      ),
      comprasPorDia.when(
        data: (data) {
          final total = data.fold<double>(
            0,
            (suma, compra) => suma + _aDouble(compra['total_compra']),
          );
          final compras = data.fold<int>(
            0,
            (suma, compra) => suma + _aInt(compra['num_compras']),
          );
          return _CartaResumen(
            icono: Icons.add_shopping_cart_rounded,
            titulo: "Compras",
            valor: _moneda(total),
            detalle: "$compras compras registradas",
          );
        },
        loading: () => const _CartaResumen(
          icono: Icons.add_shopping_cart_rounded,
          titulo: "Compras",
          cargando: true,
        ),
        error: (err, stack) => const _CartaResumen(
          icono: Icons.add_shopping_cart_rounded,
          titulo: "Compras",
          valor: "—",
          detalle: "No disponible",
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.hLg,
          child: seccionEtiqueta("Resumen general", cs),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: AppPadding.hMd,
          child: LayoutBuilder(
            builder: (context, constraints) {
              const separacion = 12.0;
              final maxWidth = constraints.maxWidth;
              final columnas = maxWidth >= 560 ? 2 : 1;
              final anchoCarta =
                  (maxWidth - (columnas - 1) * separacion) / columnas;
              return Wrap(
                spacing: separacion,
                runSpacing: separacion,
                children: [
                  for (final carta in cartas)
                    SizedBox(width: anchoCarta, height: 120, child: carta),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Padding(padding: AppPadding.hMd, child: const GraficaMensual()),
      ],
    );
  }
}

/// Carta individual del resumen general.
class _CartaResumen extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String valor;
  final String detalle;
  final bool cargando;

  const _CartaResumen({
    required this.icono,
    required this.titulo,
    this.valor = "",
    this.detalle = "",
    this.cargando = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

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
              Icon(icono, size: 20, color: cs.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  titulo,
                  style: tt.labelLarge?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (cargando) ...[
            Shimmer.fromColors(
              baseColor: cs.primaryContainer.withAlpha(80),
              highlightColor: cs.onPrimary,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLine(width: 90, height: 22),
                  SizedBox(height: 8),
                  ShimmerLine(width: 120, height: 12),
                ],
              ),
            ),
          ] else ...[
            Text(
              valor,
              style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              detalle,
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
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

int _aInt(dynamic valor) {
  if (valor == null) return 0;
  if (valor is num) return valor.toInt();
  return int.tryParse(valor.toString()) ?? 0;
}

String _moneda(double valor) =>
    NumberFormat.currency(locale: 'en_MX', symbol: '\$').format(valor);
