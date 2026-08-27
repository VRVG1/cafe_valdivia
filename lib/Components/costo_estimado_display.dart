import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:flutter/material.dart';

/// Widget que muestra el costo estimado total de los componentes
/// de una receta en un contenedor con estilo decorativo.
///
/// Renderiza un [Container] con fondo semitransparente del color
/// tertiaryContainer, conteniendo un ícono de calculadora, la etiqueta
/// "Costo estimado" y el monto formateado en dólares.
///
/// ```dart
/// CostoEstimadoDisplay(
///   totalCostoEstimado: 150.00,
///   cs: Theme.of(context).colorScheme,
///   tt: Theme.of(context).textTheme,
/// )
/// ```
class CostoEstimadoDisplay extends StatelessWidget {
  const CostoEstimadoDisplay({
    super.key,
    required this.totalCostoEstimado,
    required this.cs,
    required this.tt,
  });

  /// Monto total del costo estimado formateado con 2 decimales.
  final double totalCostoEstimado;

  /// Esquema de colores del tema actual.
  final ColorScheme cs;

  /// Tema de tipografía del contexto actual.
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.allMd,
      decoration: BoxDecoration(
        color: cs.tertiaryContainer.withValues(alpha: 0.3),
        borderRadius: AppRadius.mdCircular,
      ),
      child: Row(
        children: [
          Icon(Icons.calculate_rounded, color: cs.tertiary),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Costo estimado",
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              Text(
                "\$${totalCostoEstimado.toStringAsFixed(2)}",
                style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
