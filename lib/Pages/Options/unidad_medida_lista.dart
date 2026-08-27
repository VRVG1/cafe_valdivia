import 'package:cafe_valdivia/Components/app_build_text_field.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/core/utils/db_error_handler.dart';
import 'package:cafe_valdivia/providers/unidad_medida/unidad_medida_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnidadMedidaLista extends ConsumerStatefulWidget {
  const UnidadMedidaLista({super.key});

  @override
  ConsumerState<UnidadMedidaLista> createState() => _UnidadMedidaListaState();
}

class _UnidadMedidaListaState extends ConsumerState<UnidadMedidaLista> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _umController = TextEditingController();

  @override
  void dispose() {
    _umController.dispose();
    super.dispose();
  }

  void _showAddOrEditDialog({UnidadMedida? um}) {
    // Si estamos editando se llena el valor del controlador
    _umController.text = um?.nombre ?? '';
    final isEditing = um != null;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            isEditing ? "Editar Unidad de Medida" : "Agregar Unidad de Medida",
          ),
          content: Form(
            key: _formKey,
            child: AppBuildTextField(
              text: "Nombre de la Unidad",
              controller: _umController,
              icon: Icons.scale_rounded,
              autofocus: true,
              hintText: "Ej. Kilogramo (Kg)",
              customValidator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Este campo no puede estar vacio";
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text("Cancelar"),
            ),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  if (isEditing) {
                    final UnidadMedida updateUM = um.copyWith(
                      id: um.id,
                      nombre: _umController.text,
                    );
                    _actualizarUM(context, updateUM);
                  } else {
                    _crearUM(context);
                  }
                }
              },
              child: Text(isEditing ? "Actualizar" : "Guardar"),
            ),
          ],
          shape: RoundedRectangleBorder(borderRadius: AppRadius.modalCircular),
        );
      },
    );
  }

  Future<void> _actualizarUM(
    BuildContext dialogContext,
    UnidadMedida unidadMedida,
  ) async {
    try {
      await ref.read(unidadMedidaProvider.notifier).updateElement(unidadMedida);
      if (!dialogContext.mounted) return;
      showCustomSnackBar(
        context: dialogContext,
        mensaje: "Actualizado exitosamente",
      );
      Navigator.of(dialogContext).pop();
    } catch (e) {
      if (!dialogContext.mounted) return;
      showCustomSnackBar(
        context: dialogContext,
        mensaje: traducirErrorBD(e),
        isError: true,
      );
    }
  }

  Future<void> _crearUM(BuildContext dialogContext) async {
    try {
      await ref.read(unidadMedidaProvider.notifier).create(_umController.text);
      if (!dialogContext.mounted) return;
      showCustomSnackBar(
        context: dialogContext,
        mensaje: "Guardado exitosamente",
      );
      Navigator.of(dialogContext).pop();
    } catch (e) {
      if (!dialogContext.mounted) return;
      showCustomSnackBar(
        context: dialogContext,
        mensaje: traducirErrorBD(e),
        isError: true,
      );
    }
  }

  void _deleteUM(UnidadMedida um) async {
    try {
      await ref.read(unidadMedidaProvider.notifier).delete(um.id!);
      if (mounted) {
        showCustomSnackBar(
          context: context,
          mensaje: "La unidad de Medida se elimino correctamente.",
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
          context: context,
          mensaje: traducirErrorBD(e),
          isError: true,
        );
        Navigator.of(context).pop();
      }
    }
  }

  void _confirmationDelete(UnidadMedida um) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                "Eliminar Unidad de Medida?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text("Seguro que quieres eliminar la unidad de medidad"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancelar"),
                ),
                FilledButton(
                  onPressed: () => _deleteUM(um),
                  child: const Text("Eliminar"),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.modalCircular,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ref.listen<AsyncValue>(unidadMedidaProvider, (_, state) {
      if (state is AsyncError) {
        showCustomSnackBar(
          context: context,
          mensaje: state.error.toString(),
          isError: true,
        );
      }
    });

    final asyncUM = debugOverride(
      ref,
      'unidad_medida',
      ref.watch(unidadMedidaProvider),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Agregar unidad de medida",
        onPressed: _showAddOrEditDialog,
        child: Icon(Icons.add_rounded),
      ),
      appBar: AppBar(title: const Text("Unidad de Medida")),
      body: asyncUM.when(
        data: (uMs) {
          if (uMs.isEmpty) {
            return const Center(
              child: Text('No existen ninguna unidad de medida registrada'),
            );
          }

          return ListviewCustom<UnidadMedida>(
            data: uMs,
            keyBuilder: (um) => ValueKey(um.id),
            titleBuilder: (um) => Text(
              um.nombre,
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
            leadingBuilder: (um) =>
                Icon(Icons.scale_rounded, color: colorScheme.primary),
            onTapCallback: (um) => _showAddOrEditDialog(um: um),
            onEditDismissed: (um) async {
              _showAddOrEditDialog(um: um);
              return false;
            },
            onDeleteDismissed: (um) async {
              _confirmationDelete(um);
              return false;
            },
          );
        },
        error: (err, stack) => ErrorView(
          message: 'Error al cargar las unidades de medida',
          onRetry: () => ref.invalidate(unidadMedidaProvider),
        ),
        loading: () => SkeletonListTiles(n: 10),
      ),
    );
  }
}
