import 'package:flutter/material.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String mensaje,
  bool isError = false,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  final textColor =
      isError ? colorScheme.onErrorContainer : colorScheme.onTertiaryContainer;

  final backgroundColor =
      isError ? colorScheme.errorContainer : colorScheme.tertiaryContainer;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensaje, style: TextStyle(color: textColor, fontSize: 16)),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
    ),
  );
}
