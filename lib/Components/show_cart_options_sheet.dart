import 'package:flutter/material.dart';

/// Muestra un [BottomSheet] con opciones para un elemento del carrito:
/// "Modificar cantidad" y "Eliminar del carrito".
///
/// Al tocar "Modificar cantidad", se cierra el bottom sheet y se invoca
/// [onModify]. Al tocar "Eliminar del carrito", se cierra y se invoca
/// [onRemove].
///
/// ```dart
/// showCartOptionsSheet(
///   context: context,
///   item: carrito[i],
///   onModify: () => showQuantityModifyDialog(...),
///   onRemove: () => setState(() => carrito.remove(item)),
/// );
/// ```
///
/// Retorna un [Future] que completa cuando el bottom sheet se cierra.
Future<void> showCartOptionsSheet({
  required BuildContext context,
  required Map<String, dynamic> item,
  required VoidCallback onModify,
  required VoidCallback onRemove,
}) async {
  return showModalBottomSheet(
    context: context,
    builder: (ctx) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              item['nombre'],
              style: Theme.of(ctx).textTheme.titleMedium,
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit_rounded),
            title: Text("Modificar cantidad"),
            onTap: () {
              Navigator.pop(ctx);
              onModify();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.delete_rounded,
              color: Theme.of(ctx).colorScheme.error,
            ),
            title: Text(
              "Eliminar del carrito",
              style: TextStyle(color: Theme.of(ctx).colorScheme.error),
            ),
            onTap: () {
              Navigator.pop(ctx);
              onRemove();
            },
          ),
          SizedBox(height: 8),
        ],
      ),
    ),
  );
}
