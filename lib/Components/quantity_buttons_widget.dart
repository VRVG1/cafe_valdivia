import 'package:cafe_valdivia/Components/expressive_button.dart';
import 'package:flutter/material.dart';

/// Fila de botones estrella para ajuste rápido de cantidades.
///
/// Muestra 5 botones: +1, +6, +12, +24 y un toggle de signo negativo.
/// Cuando el modo negativo está activado, los botones restan en lugar
/// de sumar.
///
/// ```dart
/// QuantityButtonsWidget(
///   isNegative: _isNegative,
///   onIncrement: (valor) => _incrementarCantidad(valor),
///   onToggleNegative: () => setState(() => _isNegative = !_isNegative),
/// )
/// ```
class QuantityButtonsWidget extends StatelessWidget {
  const QuantityButtonsWidget({
    super.key,
    required this.isNegative,
    required this.onIncrement,
    required this.onToggleNegative,
  });

  /// Indica si el modo negativo está activado (resta cantidades).
  final bool isNegative;

  /// Callback invocado con el delta de cantidad a aplicar.
  /// Ejemplo: onIncrement(6) suma 6, onIncrement(-6) resta 6.
  final ValueChanged<int> onIncrement;

  /// Callback invocado al presionar el botón de toggle de signo.
  final VoidCallback onToggleNegative;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsetsGeometry.only(top: 8.0),
      child: Card(
        color: cs.surfaceContainerLowest,
        elevation: 0,
        child: SizedBox(
          width: 60.0,
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ExpressiveButton(
                label: isNegative ? "-1" : "+1",
                color: cs.primaryContainer,
                points: 14,
                bg: cs.onPrimaryContainer,
                onPressed: () => onIncrement(isNegative ? -1 : 1),
              ),
              ExpressiveButton(
                label: isNegative ? "-6" : "+6",
                color: cs.primaryContainer,
                points: 14,
                bg: cs.onPrimaryContainer,
                onPressed: () => onIncrement(isNegative ? -6 : 6),
              ),
              ExpressiveButton(
                label: isNegative ? "-12" : "+12",
                color: cs.primaryContainer,
                points: 14,
                bg: cs.onPrimaryContainer,
                onPressed: () => onIncrement(isNegative ? -12 : 12),
              ),
              ExpressiveButton(
                label: isNegative ? "-24" : "+24",
                color: cs.primaryContainer,
                points: 14,
                bg: cs.onPrimaryContainer,
                onPressed: () => onIncrement(isNegative ? -24 : 24),
              ),
              ExpressiveButton(
                label: isNegative ? "+" : "-",
                color: isNegative ? cs.tertiaryContainer : cs.errorContainer,
                points: 14,
                bg: isNegative ? cs.onTertiaryContainer : cs.onErrorContainer,
                onPressed: onToggleNegative,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
