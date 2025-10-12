import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Pages/Proveedor/proveedor_detallado.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/proveedor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProveedorLista extends ConsumerStatefulWidget {
  const ProveedorLista({super.key});

  @override
  ProveedorListaState createState() => ProveedorListaState();
}

class ProveedorListaState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final asyncProveedor = ref.watch(proveedorProvider);

    return asyncProveedor.when(
      data: (proveedores) {
        if (proveedores.isEmpty) {
          return const Center(child: Text('No hay proveedors para mostrar.'));
        }

        return ListviewCustom<Proveedor>(
          data: proveedores,
          keyBuilder: (proveedor) {
            return ValueKey(
              proveedor.id != null
                  ? 'proveedor-${proveedor.id}'
                  : proveedor.hashCode,
            );
          },
          titleBuilder:
              (proveedor) => Text(
                proveedor.nombre.isNotEmpty ? proveedor.nombre : 'Jonh Doe',
              ),
          leadingBuilder:
              (proveedor) => CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text(
                  proveedor.getIniciales().isNotEmpty
                      ? proveedor.getIniciales()
                      : "JD",
                  style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
                ),
              ),
          subtitleBuilder:
              (proveedor) => Text(
                proveedor.telefono.toString().isNotEmpty
                    ? proveedor.telefono.toString()
                    : "xxxxxxxxxx",
              ),
          onTapCallback:
              (proveedor) => {
                if (proveedor.id != null)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ProveedorDetallado(proveedorId: proveedor.id!),
                      ),
                    ),
                  },
              },
        );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
