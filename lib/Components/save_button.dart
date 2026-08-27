import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String semanticsLabel;

  const SaveButton({
    super.key,
    required this.isLoading,
    this.onPressed,
    this.semanticsLabel = "Guardar",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: semanticsLabel,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: theme.colorScheme.onSecondaryContainer,
                  strokeWidth: 2,
                ),
              )
            : const Text("Guardar"),
      ),
    );
  }
}
