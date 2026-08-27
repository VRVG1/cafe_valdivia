import 'package:flutter/material.dart';

class TransactionHeaderCard extends StatelessWidget {
  final Widget? leading;
  final Widget child;
  final Widget? chip;

  const TransactionHeaderCard({
    super.key,
    this.leading,
    required this.child,
    this.chip,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 16),
          ],
          Expanded(child: child),
          if (chip != null) chip!,
        ],
      ),
    );
  }
}
