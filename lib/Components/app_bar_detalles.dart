import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarDetalles<T> extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final bool hasMenu;
  final IconData iconShow;
  final T? model;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onDeletePressed;

  const AppBarDetalles({
    super.key,
    required this.title,
    this.model,
    this.onPrimaryPressed,
    this.onDeletePressed,
    this.iconShow = Icons.edit_rounded,
    this.hasMenu = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      elevation: 0,
      actions: [
        // Botón de Edición
        IconButton(
          tooltip: "Editar",
          icon: Icon(iconShow),
          color: theme.colorScheme.primary,
          onPressed: onPrimaryPressed,
        ),
        if (hasMenu)
          PopupMenuButton<String>(
            tooltip: "Más opciones",
            icon: const Icon(Icons.more_vert_rounded),
            onSelected: (String result) async {
              if (result == 'Eliminar') {
                onDeletePressed?.call();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Eliminar',
                child: Row(children: [Text('Eliminar')]),
              ),
            ],
          ),
      ],
    );
  }
}
