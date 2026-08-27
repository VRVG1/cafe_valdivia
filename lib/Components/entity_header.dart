import 'package:flutter/material.dart';

class EntityHeader extends StatelessWidget {
  final String initials;
  final String name;
  final bool compact;

  const EntityHeader({
    super.key,
    required this.initials,
    required this.name,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final radius = compact ? 80.0 : 64.0;
    final avatarTextStyle = compact
        ? theme.textTheme.displayLarge
        : theme.textTheme.displayMedium;
    final nameTextStyle = compact
        ? theme.textTheme.headlineSmall
        : theme.textTheme.displaySmall;
    final gap = compact ? 16.0 : 24.0;

    return Column(
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: cs.primaryContainer,
            radius: radius,
            child: Text(
              initials,
              style: avatarTextStyle?.copyWith(
                color: cs.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: gap),
        Text(
          name,
          style: nameTextStyle?.copyWith(
            fontWeight: compact ? FontWeight.bold : FontWeight.w700,
            color: cs.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
