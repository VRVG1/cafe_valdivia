import 'package:flutter/material.dart';

/// Muestra un diálogo de confirmación con campos opcionales de
/// pago (toggle "¿Pagado?") y descripción extra.
///
/// Retorna `true` si el usuario presiona "Aceptar", `false` si
/// presiona "Cancelar" o cierra el diálogo.
///
/// ## Parámetros
/// - [context]: Contexto de construcción del diálogo.
/// - [titulo]: Texto del encabezado del [AlertDialog].
/// - [cuerpo]: Texto descriptivo mostrado en el contenido.
/// - [esPagado]: Estado actual del toggle de pago.
/// - [onPagadoChanged]: Callback invocado al cambiar el toggle.
/// - [descripcionController]: [TextEditingController] para el campo
///   de información extra.
/// - [mostrarSegundoBoton]: Si es `true`, muestra el botón "Cancelar".
///   Por defecto `true`.
/// - [mostrarCamposExtra]: Si es `true`, muestra el toggle de pago y
///   el campo de descripción. Por defecto `true`.
///
/// ```dart
/// final confirmado = await showConfirmPayModal(
///   context: context,
///   titulo: "Realizar Venta",
///   cuerpo: "¿Confirmar venta por \$150.00?",
///   esPagado: _esPagado,
///   onPagadoChanged: (v) => setState(() => _esPagado = v),
///   descripcionController: _descripcionController,
/// );
/// ```
Future<bool> showConfirmPayModal({
  required BuildContext context,
  required String titulo,
  required String cuerpo,
  required bool esPagado,
  required ValueChanged<bool> onPagadoChanged,
  required TextEditingController descripcionController,
  bool mostrarSegundoBoton = true,
  bool mostrarCamposExtra = true,
}) async {
  final result = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(titulo),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(cuerpo),
                  if (mostrarCamposExtra) ...[
                    const SizedBox(height: 20),
                    SwitchListTile(
                      title: const Text("¿Pagado?"),
                      value: esPagado,
                      onChanged: (bool value) {
                        setState(() {
                          onPagadoChanged(value);
                        });
                      },
                    ),
                    TextField(
                      controller: descripcionController,
                      decoration: const InputDecoration(
                        labelText: 'Información extra',
                        hintText: 'Escribe aquí...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              if (mostrarSegundoBoton)
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Cancelar"),
                ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Aceptar"),
              ),
            ],
          );
        },
      );
    },
  );
  return result ?? false;
}
