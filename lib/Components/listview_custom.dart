import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListviewCustom<T> extends ConsumerWidget {
  final List<T> data;

  final Widget Function(T element) titleBuilder;
  final Widget? Function(T element)? subtitleBuilder;
  final Widget Function(T element)? leadingBuilder;
  final Widget Function(T element)? trailingBuilder;
  final Key Function(T element) keyBuilder;
  final ScrollController? controller;
  final Widget? footer;
  final Widget? header;

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
    this.controller,
    this.footer,
    this.header,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool hasHeader = header != null;
    final bool hasFooter = footer != null;
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      physics: const ClampingScrollPhysics(),
      itemCount: data.length + (hasFooter ? 1 : 0) + (hasHeader ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (hasHeader && index == 0) {
          return header;
        }
        if (hasFooter && index == data.length + (hasHeader ? 1 : 0)) {
          return footer;
        }
        final int dataIndex = hasHeader ? index - 1 : index;
        final T element = data[dataIndex];
        final bool isFirst = dataIndex == 0;
        final bool isLast = dataIndex == data.length - 1;

        final BorderRadius borderRadius;
        if (isFirst && isLast) {
          borderRadius = BorderRadius.circular(24.0);
        } else if (isFirst) {
          borderRadius = const BorderRadius.vertical(
            top: Radius.circular(24.0),
            bottom: Radius.circular(8.0),
          );
        } else if (isLast) {
          borderRadius = const BorderRadius.vertical(
            top: Radius.circular(8.0),
            bottom: Radius.circular(24.0),
          );
        } else {
          borderRadius = BorderRadius.circular(8);
        }

        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : 4),
          child: Material(
            borderRadius: borderRadius,
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
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

              background: Material(
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: colorScheme.tertiaryContainer,
                    borderRadius: borderRadius,
                  ),
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.edit,
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
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
              child: Material(
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
                  onTap: onTapCallback == null
                      ? null
                      : () => onTapCallback!(element),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
