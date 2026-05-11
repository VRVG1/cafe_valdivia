import 'package:flutter/material.dart';

Widget cartaResume({
  double discount = 0,
  double impuesto = 0,
  required double grandTotal,
  required ColorScheme cs,
  required List<Widget> children,
}) {
  return Container(
    padding: const EdgeInsets.all(16), //Symetric?
    decoration: BoxDecoration(
      color: cs.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(children: children),
  );
}

Widget seccionEtiqueta(String label, ColorScheme cs) {
  return Text(
    label.toUpperCase(),
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: cs.primary,
    ),
  );
}
