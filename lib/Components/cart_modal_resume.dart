import 'package:flutter/material.dart';

/// Widget que muestra el resumen financiero del carrito en una fila
/// con el total de productos a la izquierda y el total en dinero a la derecha.
///
/// Se utiliza como header dentro de un [DraggableScrollableSheet] para
/// mostrar al usuario un resumen rápido del contenido del carrito.
///
/// ```dart
/// CartModalResume(
///   cs: colorScheme,
///   tt: textTheme,
///   totalProductos: 5,
///   totalDinero: 150.00,
/// )
/// ```
class CartModalResume extends StatelessWidget {
  const CartModalResume({
    super.key,
    required this.cs,
    required this.tt,
    required this.totalProductos,
    required this.totalDinero,
  });

  /// Esquema de colores del tema actual.
  final ColorScheme cs;

  /// Tema de tipografía del contexto actual.
  final TextTheme tt;

  /// Cantidad total de productos en el carrito.
  final int totalProductos;

  /// Suma total del precio de todos los productos del carrito.
  final double totalDinero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Total productos: $totalProductos ",
                style: tt.titleMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
          Text(
            "\$${totalDinero.toStringAsFixed(2)}",
            style: tt.headlineMedium?.copyWith(
              color: cs.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
