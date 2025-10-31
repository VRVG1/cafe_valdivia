import 'package:cafe_valdivia/models/base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarDetalles<T extends BaseModel> extends ConsumerWidget
    implements PreferredSizeWidget {
  final String title;
  final T? model;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  const AppBarDetalles({
    super.key,
    required this.title,
    this.model,
    this.onEditPressed,
    this.onDeletePressed,
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
          icon: const Icon(Icons.edit_rounded),
          color: theme.colorScheme.primary,
          onPressed: onEditPressed,
        ),
        // Botón de Menú (Eliminar)
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert_rounded),
          onSelected: (String result) async {
            if (result == 'eliminar') {
              onDeletePressed;
            }
          },
          itemBuilder:
              (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'eliminar',
                  child: Row(children: [Text('Eliminar')]),
                ),
              ],
        ),
      ],
    );
  }
}
