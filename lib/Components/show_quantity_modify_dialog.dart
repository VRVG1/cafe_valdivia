import 'package:flutter/material.dart';

/// Muestra un diálogo [AlertDialog] para modificar la cantidad de un
/// elemento del carrito.
///
/// El diálogo contiene un [TextField] numérico prellenado con la
/// cantidad actual del item, y dos botones: "Cancelar" y "Aceptar".
/// Solo cierra el diálogo y ejecuta [onUpdated] si el nuevo valor
/// es un entero mayor a 0.
///
/// ```dart
/// showQuantityModifyDialog(
///   context: context,
///   item: carrito[i],
///   onUpdated: (nuevaCantidad) {
///     setState(() => carrito[i]['cantidad'] = nuevaCantidad);
///   },
/// );
/// ```
///
/// Retorna un [Future] que completa cuando el diálogo se cierra.
Future<void> showQuantityModifyDialog({
  required BuildContext context,
  required Map<String, dynamic> item,
  required ValueChanged<int> onUpdated,
}) async {
  final controller = TextEditingController(text: item['cantidad'].toString());

  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("Modificar cantidad"),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Nueva cantidad",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text("Cancelar"),
        ),
        FilledButton(
          onPressed: () {
            final nueva = int.tryParse(controller.text);
            if (nueva != null && nueva > 0) {
              onUpdated(nueva);
              Navigator.pop(ctx);
            }
          },
          child: Text("Aceptar"),
        ),
      ],
    ),
  );
}
