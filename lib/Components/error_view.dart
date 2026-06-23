import 'dart:math';

import 'package:flutter/material.dart';

const List<String> _caritas = [
  "(；￣Д￣)",
  "(ᗒᗣᗕ)՞",
  "(＞﹏＜)",
  "(」°ロ°)」",
  "(〃＞＿＜;〃)",
  "(・`ω´・)",
  "(`ー´)",
  "( ` ω ´ )",
  "(╥﹏╥)",
  "(>_<)",
  "(｡•́︿•̀｡)",
  "(ಥ﹏ಥ)",
  "(>﹏<)",
  "(x_x)",
  "(×﹏×)",
  "＼(〇_ｏ)／",
  "(・_・;)",
  "¯_(ツ)_/¯",
  "(＠_＠)",
  "(￣ω￣;)",
  "(￣～￣;)",
  "(￢_￢)",
  "(o_O)",
  "(O_O;)",
  "(⊙_⊙)",
];

class ErrorDropdownField extends StatelessWidget {
  final String label;
  final String? message;
  final IconData? leadingIcon;
  final bool showCarita;

  const ErrorDropdownField({
    super.key,
    required this.label,
    this.message,
    this.leadingIcon,
    this.showCarita = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final carita = showCarita
        ? _caritas[Random().nextInt(_caritas.length)]
        : null;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: cs.error.withAlpha(80)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, color: cs.error, size: 20),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$label\n',
                    style: TextStyle(
                      fontSize: 12,
                      color: cs.error.withAlpha(180),
                    ),
                  ),
                  TextSpan(
                    text: message ?? 'Error al cargar',
                    style: TextStyle(fontSize: 16, color: cs.error),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            carita ?? '⚠️',
            style: TextStyle(
              fontSize: carita != null ? 18 : 16,
              color: cs.error,
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorRetryField extends StatelessWidget {
  final String label;
  final String? message;
  final VoidCallback onRetry;
  final IconData? leadingIcon;
  final bool showCarita;

  const ErrorRetryField({
    super.key,
    required this.label,
    required this.onRetry,
    this.message,
    this.leadingIcon,
    this.showCarita = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final carita = showCarita
        ? _caritas[Random().nextInt(_caritas.length)]
        : null;

    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onRetry,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: cs.error.withAlpha(80)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: Row(
          children: [
            if (leadingIcon != null) ...[
              Icon(leadingIcon, color: cs.error, size: 20),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$label\n',
                      style: TextStyle(
                        fontSize: 12,
                        color: cs.error.withAlpha(180),
                      ),
                    ),
                    TextSpan(
                      text: message ?? 'Error al cargar',
                      style: TextStyle(fontSize: 16, color: cs.error),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              carita ?? '🔄',
              style: TextStyle(
                fontSize: carita != null ? 18 : 16,
                color: cs.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  final String message;
  final String? description;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.message,
    this.description,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _caritas[Random().nextInt(_caritas.length)],
              style: TextStyle(
                color: cs.onPrimaryContainer,
                fontSize: tt.displaySmall!.fontSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(message, style: tt.titleMedium, textAlign: TextAlign.center),
            if (description != null) ...[
              const SizedBox(height: 8),
              Text(
                description!,
                style: tt.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text("Reintentar"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
