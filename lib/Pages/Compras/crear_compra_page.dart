import 'package:cafe_valdivia/Pages/Compras/add_insumo_dialog.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/crear_compra_notifier.dart';
import 'package:cafe_valdivia/providers/proveedor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrearCompraPage extends ConsumerStatefulWidget {
  const CrearCompraPage({super.key});

  @override
  ConsumerState<CrearCompraPage> createState() => _CrearCompraPageState();
}

class _CrearCompraPageState extends ConsumerState<CrearCompraPage> {
  final _formKey = GlobalKey<FormState>();

  void _close() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nueva Compra'),
        leading: IconButton(onPressed: _close, icon: Icon(Icons.close)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildActionButtons(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //  Selector de Proveedor
              Consumer(
                builder: (context, ref, child) {
                  final asyncProveedor = ref.watch(proveedorProvider);
                  final selectedProveedor =
                      ref.watch(crearCompraProvider).proveedor;

                  return asyncProveedor.when(
                    data: (proveedores) {
                      return DropdownMenu<Proveedor>(
                        label: const Text('Proveedor'),
                        leadingIcon: const Icon(Icons.person_search_rounded),
                        expandedInsets: EdgeInsets.zero,
                        initialSelection: selectedProveedor,
                        dropdownMenuEntries:
                            proveedores.map((proveedor) {
                              return DropdownMenuEntry<Proveedor>(
                                value: proveedor,
                                label: proveedor.nombre,
                              );
                            }).toList(),
                      );
                    },
                    error: (err, stack) => Center(child: Text('Error: $err')),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
              const SizedBox(height: 24),

              //  Lista de Insumo Agregados
              Text('Insumo', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              _buildListInsumo(context),
              const SizedBox(height: 16),

              //  Botón para añadir insumos
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AddInsumoDialog(),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Añadir Insumo'),
                ),
              ),
              const SizedBox(height: 32),

              //  Total de la compra
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total: \$0.00', // TODO: Obtener del notifier
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildActionButtons(BuildContext context) {
  final theme = Theme.of(context);
  return FilledButton(
    onPressed: () {},
    child:
        false
            ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: theme.colorScheme.onSecondaryContainer,
                strokeWidth: 2,
              ),
            )
            : const Text("Guardar"),
  );
}

Widget _buildListInsumo(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      // Usar .slect para solo observar la lista de items.
      // Esto evita que el widget se reconstruya si cambia otra
      // cosa, como el proveedor.
      final items = ref.watch(
        crearCompraProvider.select((state) => state.items),
      );
      if (items.isEmpty) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text('Aqui se mostrarán los insumos agregados.'),
          ),
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final subtotal = item.cantidad * item.precioUnitarioCompra;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              title: Text(item.insumo?.nombre ?? 'Insumo no encontrado'),
              subtitle: Text(
                '${item.cantidad} x \$${item.precioUnitarioCompra.toStringAsFixed(2)}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${subtotal.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      ref
                          .read(crearCompraProvider.notifier)
                          .eliminarItem(item.idInsumo);
                    },
                    icon: const Icon(Icons.delete_outlined, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
