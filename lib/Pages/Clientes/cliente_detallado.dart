import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Clientes/editarClienteDetallada.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/providers/Cliente/cliente_notifier.dart';
import 'package:cafe_valdivia/providers/Cliente/cliente_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClienteDetallado extends ConsumerWidget {
  final int clienteId;

  const ClienteDetallado({super.key, required this.clienteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final asyncCliente = debugOverride(
      ref,
      'cliente_detalle',
      ref.watch(clienteKilosProvider(clienteId)),
    );

    String getKilos(AsyncValue<Map<String, dynamic>?> asyncKilos) {
      final data = asyncKilos.asData?.value;
      final String kilo = data != null ? data['kilos'].toString() : "X";
      return kilo;
    }

    String getTotal(AsyncValue<Map<String, dynamic>?> asyncKilos) {
      final data = asyncKilos.asData?.value;
      final total = data?['total'] ?? 0;
      return '\$${(total as num).toStringAsFixed(2)}';
    }

    return Scaffold(
      appBar: AppBarDetalles<Cliente>(
        title: "Cliente",
        hasMenu: true,
        onPrimaryPressed: () {
          final data = asyncCliente.asData?.value;
          final Cliente? cliente = data != null ? Cliente.fromJson(data) : null;
          if (cliente != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditarClienteDetallado(cliente: cliente),
              ),
            ).then((_) => ref.invalidate(clienteDetailProvider(clienteId)));
          }
        },
        onDeletePressed: () {
          final data = asyncCliente.asData?.value;
          final Cliente? cliente = data != null ? Cliente.fromJson(data) : null;
          if (cliente != null) {
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
                  id: cliente.idCliente ?? clienteId,
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
      ),
      body: asyncCliente.when(
        loading: () => const SkeletonClienteDetalle(rowDetails: 2),
        error: (err, stack) => ErrorView(
          message: 'Error al cargar el cliente',
          description: err.toString(),
        ),
        data: (cliente) {
          final asyncKilos = ref.watch(clienteKilosProvider(clienteId));

          return cliente != null
              ? RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(clienteDetailProvider(clienteId)),
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
                            "${cliente['nombre'].isNotEmpty ? cliente['nombre'][0] : ''}${cliente['apellido'].isNotEmpty ? cliente['apellido'][0] : ''}",
                            style: theme.textTheme.displayMedium?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "${cliente['nombre'].isNotEmpty ? cliente['nombre'] : ''} ${cliente['apellido'].isNotEmpty ? cliente['apellido'] : ''}",
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
                            value: cliente['telefono'].isNotEmpty
                                ? cliente['telefono']
                                : 'xxxxxxxxxx',
                          ),
                          const SizedBox(height: 16),
                          _buildDataTile(
                            context: context,
                            icon: Icons.email_rounded,
                            label: "Email",
                            value: cliente['email'].isNotEmpty
                                ? cliente['email']
                                : '404@404.com',
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
                            value: getKilos(asyncKilos),
                            unit: "KG",
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: 16),
                          _buildSalesCard(
                            context: context,
                            label: "Monto",
                            value: getTotal(asyncKilos),
                            unit: "MXN",
                            color: theme.colorScheme.secondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : ErrorView(message: "No se pudo cargar el Cliente");
        },
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
        borderRadius: AppRadius.modalCircular,
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
          borderRadius: AppRadius.lgCircular,
        ),
        child: Padding(
          padding: AppPadding.allMd,
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
