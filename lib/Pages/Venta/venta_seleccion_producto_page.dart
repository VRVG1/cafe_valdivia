import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_seleccion_page.dart';
import 'package:cafe_valdivia/Pages/Producto/producto_agregar_page.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VentaSeleccionProductoPage extends VentaSeleccionPage<Articulo> {
  VentaSeleccionProductoPage({super.key})
    : super(
        provider: productosProviderProvider,
        addElement: ProductoAgregarPage(),
      );

  @override
  String get mensajeVacio => "No hay Productos registrados";

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    return AppbarChips();
  }

  @override
  Widget Function(Articulo element) get titleBuilder =>
      (Articulo i) => Text(i.nombre);

  @override
  Widget Function(Articulo element)? get subtitleBuilder =>
      (Articulo i) => Text('\$${i.precioVenta.toStringAsFixed(2)}');
}
