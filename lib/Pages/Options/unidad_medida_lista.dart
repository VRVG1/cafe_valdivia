import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/unidad_medida_notifier.dart';
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

  void _showFeedBackSnackBar({required String message, bool isError = false}) {
    if (!mounted) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color:
                isError
                    ? colorScheme.onErrorContainer
                    : colorScheme.onTertiaryContainer,
            fontSize: 16,
          ),
        ),
        backgroundColor:
            isError
                ? colorScheme.errorContainer
                : colorScheme.tertiaryContainer,
      ),
    );
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
            child: TextFormField(
              controller: _umController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Nombre de la Unidad',
                hintText: 'Ej. Kilogramo (Kg)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.scale_rounded),
              ),
              validator: (value) {
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
                    ref
                        .read(unidadMedidaNotifierProvider.notifier)
                        .updateUnidadMedida(updateUM)
                        .then((success) {
                          if (success && mounted) {
                            _showFeedBackSnackBar(
                              message: "Actualizado exitosamente",
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  } else {
                    ref
                        .read(unidadMedidaNotifierProvider.notifier)
                        .create(_umController.text)
                        .then((success) {
                          if (success && mounted) {
                            _showFeedBackSnackBar(
                              message: "Guardado exitosamente",
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  }
                }
              },
              child: Text(isEditing ? "Actualizar" : "Guardar"),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
        );
      },
    );
  }

  void _deleteUM(UnidadMedida um) async {
    try {
      await ref.read(unidadMedidaNotifierProvider.notifier).delete(um.id!);
      if (mounted) {
        _showFeedBackSnackBar(
          message: "La unidad de Medida se elimino correctamente.",
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        _showFeedBackSnackBar(
          message:
              "Error al eliminar la Unidad de Medida, Por favor, intenta de nuevo",
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
                borderRadius: BorderRadius.circular(28.0),
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
    ref.listen<AsyncValue>(unidadMedidaNotifierProvider, (_, state) {
      if (state is AsyncError) {
        _showFeedBackSnackBar(message: state.error.toString(), isError: true);
      }
    });

    final asyncUM = ref.watch(unidadMedidaNotifierProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddOrEditDialog,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("Unidad de Medida")),
      body: asyncUM.when(
        data: (uMs) {
          if (uMs.isEmpty) {
            return const Center(
              child: Text('No existen ninguna unidad de medida registrada'),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: uMs.length,
            itemBuilder: (context, index) {
              final um = uMs[index];
              // BorderRadius
              final bool isFirst = index == 0;
              final bool isLast = index == uMs.length - 1;

              final BorderRadius borderRadius;
              if (isFirst && isLast) {
                borderRadius = BorderRadius.circular(14.0);
              } else if (isFirst) {
                borderRadius = const BorderRadius.only(
                  topLeft: Radius.circular(14.0),
                  topRight: Radius.circular(14.0),
                );
              } else if (isLast) {
                borderRadius = const BorderRadius.only(
                  bottomLeft: Radius.circular(14.0),
                  bottomRight: Radius.circular(14.0),
                );
              } else {
                borderRadius = BorderRadius.all(Radius.circular(4.0));
              }
              return Card(
                color: colorScheme.surfaceContainerLowest,
                //color: surfaceContainerLowest
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 2.0,
                ),
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                child: Dismissible(
                  key: ValueKey(um.id),
                  direction: DismissDirection.horizontal,
                  dismissThresholds: const {
                    DismissDirection.startToEnd: 0.25,
                    DismissDirection.endToStart: 0.25,
                  },
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      // Deslizar de Derecha a Izquierda (Borrar)
                      _confirmationDelete(um);
                      // Devolver True para confirmar y remover el elemento
                      // visualmente
                      return false;
                    } else if (direction == DismissDirection.startToEnd) {
                      // Deslizar de Izquierda a Derecha (Modificar)
                      _showAddOrEditDialog(um: um);
                      // Devolver false para mantener el elemento en su lugar
                      return false;
                    }
                    return false;
                  },

                  background: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                    ),
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.edit,
                        color: colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),

                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                    ),
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.delete_rounded,
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    leading: Icon(
                      Icons.scale_rounded,
                      color: colorScheme.primary,
                    ),
                    title: Text(
                      um.nombre,
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () => _showAddOrEditDialog(um: um),
                  ),
                ),
              );
            },
          );
        },
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
