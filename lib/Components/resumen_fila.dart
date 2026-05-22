import 'package:flutter/material.dart';

Widget resumenFila({
  required String label,
  required String value,
  bool isTotal = false,
  Color? valueColor,
  required ColorScheme cs,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 15,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
            color: cs.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 15,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
            color: valueColor ?? cs.onSurface,
          ),
        ),
      ],
    ),
  );
}
