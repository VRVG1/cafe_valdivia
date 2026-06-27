import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';

class DetailsContainer<T> extends ConsumerWidget {
  final List<Widget> elements;
  final String title;
  final bool padding;
  final bool color;

  const DetailsContainer({
    super.key,
    required this.elements,
    required this.title,
    this.padding = true,
    this.color = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.only(left: 8.0, right: 12.0),
          child: Text(
            title,
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: color ? colorScheme.surfaceContainerHigh : null,
            borderRadius: AppRadius.lgCircular,
          ),
          child: padding
              ? Padding(
                  padding: AppPadding.allMd,
                  child: Column(children: elements),
                )
              : Column(children: elements),
        ),
      ],
    );
  }
}
