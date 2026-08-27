import 'package:flutter/material.dart';

/// Botón con forma de estrella (StarBorder) utilizado para acciones
/// expresivas de cantidad rápida (+1, +6, +12, +24, toggle negativo).
///
/// Renderiza un [IconButton] cuyo icono es un contenedor con forma
/// de estrella decorada con sombra, conteniendo una etiqueta de texto
/// centrada.
///
/// ```dart
/// ExpressiveButton(
///   label: "+1",
///   color: cs.primaryContainer,
///   points: 14,
///   bg: cs.onPrimaryContainer,
///   onPressed: () => incrementar(1),
/// )
/// ```
class ExpressiveButton extends StatelessWidget {
  const ExpressiveButton({
    super.key,
    required this.label,
    required this.color,
    required this.points,
    required this.bg,
    required this.onPressed,
  });

  /// Texto mostrado dentro de la estrella (ej. "+1", "-6", "+").
  final String label;

  /// Color de fondo de la forma de estrella.
  final Color color;

  /// Número de puntas de la estrella.
  final double points;

  /// Color del texto de la etiqueta.
  final Color bg;

  /// Callback invocado al presionar el botón.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Accion especial",
      onPressed: onPressed,
      icon: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: color,
          shape: StarBorder(
            points: points,
            innerRadiusRatio: 0.8,
            pointRounding: 0.4,
          ),
          shadows: <BoxShadow>[
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: bg),
        ),
      ),
    );
  }
}
