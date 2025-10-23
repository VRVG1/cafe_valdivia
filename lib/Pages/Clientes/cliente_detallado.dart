import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Pages/Clientes/editarClienteDetallada.dart';
import 'package:cafe_valdivia/providers/cliente_notifier.dart';
import 'package:cafe_valdivia/providers/cliente_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClienteDetallado extends ConsumerWidget {
  final int clienteId;

  const ClienteDetallado({super.key, required this.clienteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncCliente = ref.watch(clienteDetailProvider(clienteId));

    return asyncCliente.when(
      loading:
          () => Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator()),
          ),
      error:
          (err, stack) => Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: Center(child: Text("Error: $err")),
          ),
      data:
          (cliente) => Scaffold(
            appBar: AppBar(
              title: Text(
                "Cliente",
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
                        builder:
                            (context) =>
                                EditarClienteDetallado(cliente: cliente),
                      ),
                    ).then(
                      (_) => ref.invalidate(clienteDetailProvider(clienteId)),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert_rounded),
                  onSelected: (String result) async {
                    if (result == 'eliminar') {
                      mostrarDialogoConfirmacion(
                        context: context,
                        titulo: "Seguro que quiere eliminar este cliente?",
                        contenido: "Esta accion no se puede deshacer",
                        textoBotonConfirmacion: "Eliminar",
                        onConfirm: () async {
                          final bool exito = await delete(
                            context: context,
                            ref: ref,
                            provider: clienteProvider,
                            id: cliente.id!,
                            mensajeExito: "El cliente se ha borrado con exito",
                            mensajeError:
                                "Error al eliminar el cliente,Por favor, intente de nuevo",
                          );
                          if (exito && context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                      );
                    }
                  },
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'eliminar',
                          child: Row(children: [Text('Eliminar')]),
                        ),
                      ],
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh:
                  () async => ref.invalidate(clienteDetailProvider(clienteId)),
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
                        cliente.getIniciales(),
                        style: theme.textTheme.displayMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    cliente.toString(),
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  _buildInfoSection(
                    context: context,
                    title: "Datos de Contacto",
                    children: [
                      _buildDataTile(
                        context: context,
                        icon: Icons.phone_android_rounded,
                        label: "Teléfono",
                        value: cliente.telefono.toString(),
                      ),
                      const SizedBox(height: 16),
                      _buildDataTile(
                        context: context,
                        icon: Icons.email_rounded,
                        label: "Email",
                        value: cliente.email ?? 'No especificado',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildInfoSection(
                    context: context,
                    title: "Ventas Totales",
                    children: [
                      _buildSalesCard(
                        context: context,
                        label: "Kilos",
                        value: "100", // TODO: Replace with actual data
                        unit: "KG",
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      _buildSalesCard(
                        context: context,
                        label: "Monto",
                        value: "\${100}", // TODO: Replace with actual data
                        unit: "MXN",
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildSalesCard({
    required BuildContext context,
    required String label,
    required String value,
    required String unit,
    required Color color,
  }) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: color.withAlpha(40),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(color: color),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          Text(
            unit,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoSection({
  required BuildContext context,
  required String title,
  required List<Widget> children,
}) {
  final ThemeData theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsetsGeometry.only(left: 8.0, right: 12.0),
        child: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: children),
        ),
      ),
    ],
  );
}

Widget _buildDataTile({
  required BuildContext context,
  required IconData icon,
  required String label,
  required String value,
}) {
  final ThemeData theme = Theme.of(context);
  return Row(
    children: [
      Icon(icon, color: theme.colorScheme.onSurfaceVariant),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              value,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
