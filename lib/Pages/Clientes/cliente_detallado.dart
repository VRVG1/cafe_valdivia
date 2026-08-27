import 'package:cafe_valdivia/Components/app_bar_detalles.dart';
import 'package:cafe_valdivia/Components/crud.dart';
import 'package:cafe_valdivia/Components/detail_element.dart';
import 'package:cafe_valdivia/Components/details_container.dart';
import 'package:cafe_valdivia/Components/entity_header.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Clientes/editarClienteDetallada.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
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
                  id: cliente.id ?? clienteId,
                  mensajeExito: "El cliente se ha borrado con exito",
                );
                return exito;
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
                      EntityHeader(
                        initials:
                            "${cliente['nombre'].isNotEmpty ? cliente['nombre'][0] : ''}${cliente['apellido'].isNotEmpty ? cliente['apellido'][0] : ''}",
                        name:
                            "${cliente['nombre'].isNotEmpty ? cliente['nombre'] : ''} ${cliente['apellido'].isNotEmpty ? cliente['apellido'] : ''}",
                      ),
                      const SizedBox(height: 48),
                      DetailsContainer(
                        title: "Datos de Contacto",
                        elements: [
                          DetailElement(
                            icon: Icon(Icons.phone_android_rounded),
                            title: Text("Teléfono"),
                            description: Text(
                              cliente['telefono'].isNotEmpty
                                  ? cliente['telefono']
                                  : 'xxxxxxxxxx',
                            ),
                          ),
                          DetailElement(
                            icon: Icon(Icons.email_rounded),
                            title: Text("Email"),
                            description: Text(
                              cliente['email'].isNotEmpty
                                  ? cliente['email']
                                  : '404@404.com',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      DetailsContainer(
                        title: "Ventas Totales",
                        elements: [
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
