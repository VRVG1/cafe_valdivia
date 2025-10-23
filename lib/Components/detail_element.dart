import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailElement extends ConsumerWidget {
  final Widget icon;
  final Widget title;
  final Widget description;

  const DetailElement({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTheme(
          data: IconThemeData(color: colorScheme.onSurfaceVariant),
          child: icon,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle(
                style: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                child: title,
              ),
              const SizedBox(height: 2),
              DefaultTextStyle(
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                child: description,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
