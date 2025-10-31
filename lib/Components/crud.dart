import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<bool?> mostrarDialogoConfirmacion({
  required BuildContext context,
  required String titulo,
  required String contenido,
  required String textoBotonConfirmacion,
  required VoidCallback onConfirm,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(contenido),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(dialogContext).pop(false); // Cierra el diálogo
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor:
                  textoBotonConfirmacion == 'Eliminar'
                      ? Theme.of(context).colorScheme.onErrorContainer
                      : null,
              backgroundColor:
                  textoBotonConfirmacion == 'Eliminar'
                      ? Theme.of(context).colorScheme.errorContainer
                      : null,
              elevation: 0,
            ),
            onPressed: () {
              onConfirm();
              Navigator.of(dialogContext).pop(true); // Cierra el diálogo
            },
            child: Text(textoBotonConfirmacion),
          ),
        ],
      );
    },
  );
}

Future<bool> delete({
  required BuildContext context,
  required WidgetRef ref,
  required provider,
  required int id,
  required String mensajeExito,
  required String mensajeError,
}) async {
  try {
    await ref.read(provider.notifier).delete(id);
    if (context.mounted) {
      showCustomSnackBar(context: context, mensaje: mensajeExito);
      //Navigator.of(context).pop(); // Regresar a la pantalla anterior
    }
    return true;
  } catch (e) {
    appLogger.e(e);
    if (context.mounted) {
      showCustomSnackBar(
        context: context,
        mensaje: mensajeError,
        isError: true,
      );
    }
    return false;
  }
}

void create<T extends BaseModel>({
  required BuildContext context,
  required WidgetRef ref,
  required provider,
  required T element,
  required String mensajeExito,
  required String mensajeError,
}) async {
  try {
    await ref.read(provider.notifier).create(element);
    if (context.mounted) {
      showCustomSnackBar(context: context, mensaje: mensajeExito);
      Navigator.of(context).pop(); // Regresar a la pantalla anterior
    }
  } catch (e, st) {
    appLogger.e(
      "Error al crear ${element.runtimeType}: ${e.toString()}  ${st.toString()}",
    );

    if (context.mounted) {
      showCustomSnackBar(
        context: context,
        mensaje: mensajeError,
        isError: true,
      );
    }
  }
}

Future<bool> update<T extends BaseModel>({
  required BuildContext context,
  required WidgetRef ref,
  required provider,
  required T element,
  required String mensajeExito,
  required String mensajeError,
}) async {
  try {
    await ref.read(provider.notifier).updateElement(element);
    if (context.mounted) {
      showCustomSnackBar(context: context, mensaje: mensajeExito);
      Navigator.of(context).pop(); // Regresar a la pantalla anterior
    }
    return true;
  } catch (e, st) {
    appLogger.e(
      "Error al actualizar ${element.runtimeType}: ${e.toString()}  ${st.toString()}",
    );
    if (context.mounted) {
      showCustomSnackBar(
        context: context,
        mensaje: mensajeError,
        isError: true,
      );
    }

    return false;
  }
}
