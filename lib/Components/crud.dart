import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void mostrarDialogoConfirmacion({
  required BuildContext context,
  required String titulo,
  required String contenido,
  required String textoBotonConfirmacion,
  required VoidCallback onConfirm,
}) {
  showDialog<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(contenido),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Cierra el diálogo
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
              Navigator.of(dialogContext).pop(); // Cierra el diálogo
              onConfirm();
            },
            child: Text(textoBotonConfirmacion),
          ),
        ],
      );
    },
  );
}

void delete({
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
      Navigator.of(context).pop(); // Regresar a la pantalla anterior
    }
  } catch (e) {
    if (context.mounted) {
      showCustomSnackBar(context: context, mensaje: mensajeError);
    }
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
  } catch (e) {
    appLogger.e("Error al crear ${element.runtimeType}: ${e.toString()}");

    if (context.mounted) {
      showCustomSnackBar(context: context, mensaje: mensajeError);
    }
  }
}
  // Future<void> _guardarCliente() async {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     final cliente = Cliente(
  //       nombre: _nombreController.text,
  //       apellido: _apellidoController.text,
  //       telefono: _telefonoController.text,
  //       email: _correoController.text,
  //     );
  //     await ref.read(clienteProvider.notifier).create(cliente);
  //     // await Future.delayed(const Duration(seconds: 5));
  //     _mensajeExito();
  //   }
  // }
