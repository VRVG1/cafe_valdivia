import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Pages/Insumos/editar_insumo_page.dart';
import 'package:cafe_valdivia/Pages/Insumos/unidad_medida_nombre.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/providers/insumo_notifier.dart';
import 'package:cafe_valdivia/providers/insumo_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsumoDetalladoPage extends ConsumerWidget {
  final int insumoId;

  const InsumoDetalladoPage({super.key, required this.insumoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncInsumo = ref.watch(insumoDetailProvider(insumoId));

    return asyncInsumo.when(
      data: (insumo) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Insumo",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_rounded),
              color: theme.colorScheme.primary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditarInsumoPage(insumo: insumo),
                  ),
                ).then((_) => ref.invalidate(insumoDetailProvider(insumoId)));
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert_rounded),
              onSelected: (String result) {
                if (result == 'eliminar') {
                  _mostrarDialogoConfirmacion(context, ref, insumo);
                  mostrarDialogoConfirmacion(
                    context: context,
                    titulo: "Eliminar Insumo",
                    contenido: "Esta accion no se puede revertir",
                    textoBotonConfirmacion: "Eliminar",
                    onConfirm: () async {
                      final bool exito = await delete(
                        context: context,
                        ref: ref,
                        provider: insumoProvider,
                        id: insumo.idInsumo!, //TODO: es idInsumo o idUnidad??
                        mensajeExito: "El cliente se ha borrado con exito",
                        mensajeError:
                            "Error al eliminar el cliente,Por favor, intente de nuevo",
                      );
                      if (exito && context.mounted) {
                        //TODO: No se porque tengo que poner aqui dos pop
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }
                    },
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'eliminar',
                  child: Row(children: [Text('Eliminar')]),
                ),
              ],
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async => ref.invalidate(insumoDetailProvider(insumoId)),
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  radius: 64,
                  child: Text(
                    insumo.nombre[0].toUpperCase(),
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                insumo.nombre,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              DetailsContainer(
                title: "Detalles",
                elements: [
                  DetailElement(
                    icon: Icon(Icons.label_rounded),
                    title: Text("Nombre"),
                    description: Text(insumo.nombre),
                  ),
                  DetailElement(
                    icon: Icon(Icons.balance_rounded),
                    title: Text("Unidad de Medida"),
                    description: UnidadMedidaNombre(
                      unidadMedidaId: insumo.idUnidad,
                    ),
                  ),
                  DetailElement(
                    icon: Icon(Icons.description_rounded),
                    title: Text("Descripcion"),
                    description: Text(insumo.descripcion ?? "No especificado"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                "Error al cargar el insumo",
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "Error: $err",
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(insumoDetailProvider(insumoId)),
                child: const Text("Reintentar"),
              ),
            ],
          ),
        ),
      ),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

void _mostrarDialogoConfirmacion(
  BuildContext context,
  WidgetRef ref,
  Insumo insumo,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Eliminar Insumo"),
        content: Text("¿Estás seguro de eliminar ${insumo.nombre}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              ref.read(insumoDetailProvider(insumo.idInsumo!).future).then((_) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              });
            },
            child: const Text("Eliminar"),
          ),
        ],
      );
    },
  );
}
