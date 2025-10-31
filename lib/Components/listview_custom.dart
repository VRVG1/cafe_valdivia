import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListviewCustom<T> extends ConsumerWidget {
  final List<T> data;

  final Widget Function(T element) titleBuilder;
  final Widget? Function(T element)? subtitleBuilder;
  final Widget Function(T element)? leadingBuilder;
  final Widget Function(T element)? trailingBuilder;
  final Key Function(T element) keyBuilder;

  // Functions
  final void Function(T element)? onTapCallback;
  final Future<bool?> Function(T element)? onEditDismissed;
  final Future<bool?> Function(T element)? onDeleteDismissed;

  const ListviewCustom({
    super.key,
    required this.data,
    required this.titleBuilder,
    this.subtitleBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
    required this.keyBuilder,
    this.onTapCallback,
    this.onEditDismissed,
    this.onDeleteDismissed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      physics: const ClampingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final T element = data[index];
        final bool isFirst = index == 0;
        final bool isLast = index == data.length - 1;

        final BorderRadius borderRadius;
        if (isFirst && isLast) {
          borderRadius = BorderRadius.circular(12.0);
        } else if (isFirst) {
          borderRadius = const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          );
        } else if (isLast) {
          borderRadius = const BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          );
        } else {
          borderRadius = BorderRadius.all(Radius.circular(4.0));
        }

        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : 3),
          child: Dismissible(
            key: keyBuilder(element),
            dismissThresholds: const {
              DismissDirection.startToEnd: 0.25,
              DismissDirection.endToStart: 0.25,
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                // Deslizar de Derecha a Izquierda (Borrar)
                return onDeleteDismissed?.call(element) ?? false;
              } else if (direction == DismissDirection.startToEnd) {
                // Deslizar de Izquierda a Derecha (Modificar)
                return onEditDismissed?.call(element) ?? false;
              }
              return false;
            },

            background: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer,
                borderRadius: borderRadius,
              ),
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.edit, color: colorScheme.onTertiaryContainer),
              ),
            ),

            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: borderRadius,
              ),
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.delete_rounded,
                color: colorScheme.onErrorContainer,
              ),
            ),
            direction: DismissDirection.horizontal,
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              tileColor: colorScheme.surfaceContainerLowest,
              leading: leadingBuilder?.call(element),
              title: titleBuilder(element),
              subtitle: subtitleBuilder?.call(element),
              trailing: trailingBuilder?.call(element),
              onTap:
                  onTapCallback == null ? null : () => onTapCallback!(element),
            ),
          ),
        );
      },
    );
  }
}
