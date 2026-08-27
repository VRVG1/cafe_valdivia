import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:flutter/material.dart';

/// Widget que muestra una barra horizontal centrada como indicador
/// de arrastre para un [DraggableScrollableSheet].
///
/// Se renderiza como un rectángulo redondeado de 32x4 píxeles
/// con el color [ColorScheme.outlineVariant], utilizado como
/// "handle" visual en la parte superior de hojas modales arrastrables.
///
/// ```dart
/// CartModalHandle(cs: Theme.of(context).colorScheme)
/// ```
class CartModalHandle extends StatelessWidget {
  const CartModalHandle({super.key, required this.cs});

  /// Esquema de colores utilizado para determinar el color de la barra.
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: 32,
        height: 4,
        decoration: BoxDecoration(
          color: cs.outlineVariant,
          borderRadius: AppRadius.xxsCircular,
        ),
      ),
    );
  }
}
