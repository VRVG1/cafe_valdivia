import 'package:flutter/material.dart';

/// Muestra un diálogo [AlertDialog] para modificar la cantidad y el precio de un
/// elemento del carrito.
///
/// El precio se edita porque en compras/ventas el valor capturado en el
/// formulario puede diferir del que tiene el artículo almacenado (por ejemplo,
/// el proveedor subió el precio). Ese valor es el que se guarda en el detalle,
/// así que también debe poder corregirse después de agregar el ítem al carrito.
///
/// El diálogo contiene un [TextField] numérico prellenado con la cantidad
/// actual, otro con el precio actual y una vista previa del subtotal. Solo
/// cierra el diálogo y ejecuta [onUpdated] si los valores son válidos
/// (cantidad entera mayor a 0 y precio mayor a 0).
///
/// ```dart
/// showCartItemModifyDialog(
///   context: context,
///   item: carrito[i],
///   onUpdated: ({required int cantidad, required double precio}) {
///     setState(() {
///       carrito[i]['cantidad'] = cantidad;
///       carrito[i]['precio'] = precio;
///     });
///   },
/// );
/// ```
///
/// Retorna un [Future] que completa cuando el diálogo se cierra.
Future<void> showCartItemModifyDialog({
  required BuildContext context,
  required Map<String, dynamic> item,
  required void Function({required int cantidad, required double precio})
  onUpdated,
}) async {
  final cantidadController = TextEditingController(
    text: item['cantidad'].toString(),
  );
  final precioController = TextEditingController(
    text: (item['precio'] ?? 0).toString(),
  );
  // Vista previa del subtotal: se recalcula mientras se escribe para que el
  // usuario vea el total que va a guardar antes de aceptar.
  final subtotalPreview = ValueNotifier<double>(
    ((item['precio'] ?? 0) as double) * (item['cantidad'] as int),
  );

  void recalcularSubtotal() {
    final precio = double.tryParse(precioController.text) ?? 0;
    final cantidad = int.tryParse(cantidadController.text) ?? 0;
    subtotalPreview.value = precio * cantidad;
  }

  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text("Modificar cantidad y precio"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: cantidadController,
            keyboardType: TextInputType.number,
            onChanged: (_) => recalcularSubtotal(),
            decoration: const InputDecoration(
              labelText: "Cantidad",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: precioController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (_) => recalcularSubtotal(),
            decoration: const InputDecoration(
              labelText: "Precio",
              prefixText: "\$ ",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          // Se muestra el subtotal resultante para validar el cambio.
          ValueListenableBuilder<double>(
            valueListenable: subtotalPreview,
            builder: (context, subtotal, _) => Text(
              "Subtotal: \$${subtotal.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text("Cancelar"),
        ),
        FilledButton(
          onPressed: () {
            final cantidad = int.tryParse(cantidadController.text);
            final precio = double.tryParse(precioController.text);
            if (cantidad != null &&
                cantidad > 0 &&
                precio != null &&
                precio > 0) {
              onUpdated(cantidad: cantidad, precio: precio);
              Navigator.pop(ctx);
            }
          },
          child: const Text("Aceptar"),
        ),
      ],
    ),
  );

  subtotalPreview.dispose();
  cantidadController.dispose();
  precioController.dispose();
}
