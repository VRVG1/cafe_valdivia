import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/core/utils/db_error_handler.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget _botonConSemantics({
  required String label,
  required String hint,
  required Widget child,
}) {
  return Semantics(button: true, label: label, hint: hint, child: child);
}

Future<bool?> mostrarDialogoConfirmacion({
  required BuildContext context,
  required String titulo,
  required String contenido,
  required String textoBotonConfirmacion,
  required Future<bool> Function() onConfirm,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(contenido),
        actions: <Widget>[
          _botonConSemantics(
            label: "Cancelar",
            hint: "Cerrar el diálogo sin realizar cambios",
            child: TextButton(
              autofocus: true,
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop(false); // Cierra el diálogo
              },
            ),
          ),
          _botonConSemantics(
            label: "textoBotonConfirmacion",
            hint: "Confirmar la accion",
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: textoBotonConfirmacion == 'Eliminar'
                    ? Theme.of(context).colorScheme.onErrorContainer
                    : null,
                backgroundColor: textoBotonConfirmacion == 'Eliminar'
                    ? Theme.of(context).colorScheme.errorContainer
                    : null,
                elevation: 0,
              ),
              onPressed: () async {
                final resultado = await onConfirm();
                Navigator.of(dialogContext).pop(resultado);
              },
              child: Text(textoBotonConfirmacion),
            ),
          ),
        ],
      );
    },
  );
}

Future<bool> mostrarDialogoDescartarCambios(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('¿Descartar cambios?'),
          content: const Text(
            'Hay cambios sin guardar. Si sales, se perderán.',
          ),
          actions: [
            _botonConSemantics(
              label: "Cancelar",
              hint: "Cancel la accion de retroceso",
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
            ),
            _botonConSemantics(
              label: "Descartar",
              hint: "Cancela los cambios",
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Descartar'),
              ),
            ),
          ],
        ),
      ) ??
      false;
}

Future<bool> delete({
  required BuildContext context,
  required WidgetRef ref,
  required provider,
  required int id,
  required String mensajeExito,
  required String mensajeError,
  bool detalle = true,
}) async {
  try {
    await ref.read(provider.notifier).delete(id);
    if (context.mounted) {
      showCustomSnackBar(context: context, mensaje: mensajeExito);
      if (detalle) {
        Navigator.of(context).pop(); // Regresar a la pantalla anterior
      }
    }
    appLogger.i("Se borro un elemento: $provider");
    return true;
  } catch (e, st) {
    if (context.mounted) {
      showCustomSnackBar(
        context: context,
        mensaje: traducirErrorBD(e),
        isError: true,
      );
    }
    appLogger.e("Error al borro un elemento: $provider");
    return false;
  }
}

Future<bool> create<T>({
  required BuildContext context,
  required WidgetRef ref,
  required provider,
  required T element,
  required String mensajeExito,
  required String mensajeError,
  bool detalles = false,
  List<T>? detallesElement,
}) async {
  try {
    if (detalles) {
      await ref.read(provider.notifier).create(element, detallesElement);
    } else {
      await ref.read(provider.notifier).create(element);
    }
    if (context.mounted) {
      showCustomSnackBar(context: context, mensaje: mensajeExito);
      if (!detalles) {
        Navigator.of(context).pop(element); // Regresar a la pantalla anterior
      }
    }
    return true;
  } catch (e, st) {
    if (e.toString().contains("existe")) {
      List<String> cortado = e.toString().split(" ");
      String duplicado = cortado.sublist(1, cortado.length).join(" ");
      showCustomSnackBar(context: context, mensaje: duplicado, isError: true);
    } else if (context.mounted) {
      showCustomSnackBar(
        context: context,
        mensaje: mensajeError,
        isError: true,
      );
    }
    return false;
  }
}

Future<bool> update<T>({
  required BuildContext context,
  required WidgetRef ref,
  required provider,
  required T element,
  String? mensajeExito,
  String? mensajeError,
}) async {
  try {
    await ref.read(provider.notifier).updateElement(element);
    if (context.mounted) {
      mensajeExito != null
          ? showCustomSnackBar(context: context, mensaje: mensajeExito ?? "")
          : null;
      Navigator.of(context).pop(); // Regresar a la pantalla anterior
    }
    return true;
  } catch (e, st) {
    if (context.mounted) {
      mensajeExito != null
          ? showCustomSnackBar(
              context: context,
              mensaje: mensajeError ?? "",
              isError: true,
            )
          : null;
    }

    return false;
  }
}
