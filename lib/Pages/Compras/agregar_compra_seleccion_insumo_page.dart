import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_page.dart';
import 'package:cafe_valdivia/Pages/Articulos/agregar_articulos_page.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCompraSeleccionArticuloPage
    extends AgregarCompraSeleccionPage<Articulo> {
  AgregarCompraSeleccionArticuloPage({super.key})
    : super(
        provider: articulosFiltradosProvider,
        addElement: AgregarArticuloPage(),
      );

  @override
  String get mensajeVacio => "No hay Articulos registrados";

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    return AppbarChips(extraFilters: [TipoBusqueda.costo]);
  }

  @override
  Widget Function(Articulo element) get titleBuilder =>
      (Articulo i) => Text(i.nombre);

  @override
  Widget Function(Articulo element)? get subtitleBuilder =>
      (Articulo i) => Text(i.costoUnitario.toString());
}
