import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:cafe_valdivia/Pages/Venta/agregar_venta_page.dart';
import 'package:cafe_valdivia/Pages/Venta/detalle_venta_page.dart';
import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/core/utils/tranformar_fecha.dart';
import 'package:cafe_valdivia/providers/Venta/venta_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VentaListaPage extends ConsumerWidget {
  const VentaListaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVentas = debugOverride(
      ref,
      'ventas',
      ref.watch(ventasfiltradosProvider),
    );
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppbarChips(
        labelText: "Buscar Venta...",
        extraFilters: [TipoBusqueda.fecha],
        backOption: false,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Agregar Venta",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AgregarVentaPage(),

              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: asyncVentas.when(
        data: (ventas) {
          if (ventas.isEmpty) {
            return const Center(child: Text('No hay ventas para mostrar.'));
          }
          return ListviewCustom<Map<String, dynamic>>(
            data: ventas,
            keyBuilder: (Map<String, dynamic> venta) {
              final id = venta['venta']?['id_venta'];
              return ValueKey<Object>(
                id != null ? 'venta-$id' : venta.hashCode,
              );
            },
            leadingBuilder: (Map<String, dynamic> venta) {
              final pagado = venta['venta']?['pagado'];
              return Icon(
                Icons.point_of_sale_rounded,
                color: pagado == 1 ? cs.tertiary : cs.error,
              );
            },
            titleBuilder: (Map<String, dynamic> venta) {
              final info = venta['venta'] ?? venta;
              final nombre = info['nombre_cliente'] ?? 'Sin cliente';
              final apellido = info['apellido_cliente'] ?? '';
              return Text(
                '$nombre $apellido',
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            },
            subtitleBuilder: (Map<String, dynamic> venta) {
              final info = venta['venta'] ?? venta;
              return Text(fecha(info['fecha'] ?? ''));
            },
            trailingBuilder: (Map<String, dynamic> venta) {
              return Text(
                '\$${venta['total']?.toString() ?? '0.00'}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: cs.primary,
                ),
              );
            },
            onTapCallback: (Map<String, dynamic> venta) {
              final id = venta['venta']?['id_venta'];
              if (id != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleVentaPage(id: id),
                  ),
                );
              }
            },
          );
        },
        error: (err, stack) => ErrorView(
          message: 'Error al cargar las ventas',
          onRetry: () => ref.invalidate(ventaProvider),
        ),
        loading: () => SkeletonListTiles(n: 10),
      ),
    );
  }
}
