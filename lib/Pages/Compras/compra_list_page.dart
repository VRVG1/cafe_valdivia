import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_page.dart';
import 'package:cafe_valdivia/Pages/Compras/detalle_compra_page.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/Compra/compra_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompraListPage extends ConsumerWidget {
  const CompraListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCompra = debugOverride(
      ref,
      'compras',
      ref.watch(compraProvider),
    );
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Agregar Compra",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AgregarCompraPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),

      body: asyncCompra.when(
        data: (compras) {
          if (compras.isEmpty) {
            return const Center(child: Text('No hay compras para mostrar.'));
          }
          return ListviewCustom<Map<String, dynamic>>(
            data: compras,
            keyBuilder: (Map<String, dynamic> compra) {
              return ValueKey<Object>(
                compra['id_compra'] != null
                    ? 'compra-${compra['id_compra']}'
                    : compra.hashCode,
              );
            },
            leadingBuilder: (Map<String, dynamic> compra) => Icon(
              Icons.inventory_2_rounded,
              color: (compra['pagado'] == 1) ? cs.tertiary : cs.error,
            ),
            titleBuilder: (Map<String, dynamic> compra) => Text(
              compra['nombre_proveedor'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitleBuilder: (Map<String, dynamic> compra) =>
                Text(fecha(compra['fecha'])),
            trailingBuilder: (Map<String, dynamic> compra) =>
                Text("\$${compra['total_compra'].toString()}"),
            onTapCallback: (Map<String, dynamic> compra) {
              if (compra['id_compra'] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetalleCompraPage(id: compra['id_compra']),
                  ),
                );
              }
            },
          );
        },
        error: (err, stack) => ErrorView(
          message: 'Error al cargar las compras',
          onRetry: () => ref.invalidate(compraProvider),
        ),
        loading: () => SkeletonListTiles(n: 10),
      ),
    );
  }
}
