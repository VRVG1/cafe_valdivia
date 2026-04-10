import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_page.dart';
import 'package:cafe_valdivia/Pages/Insumos/agregar_insumos_page.dart';
import 'package:cafe_valdivia/core/models/insumo.dart';
import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/providers/Insumo/insumo_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCompraSeleccionInsumoPage
    extends AgregarCompraSeleccionPage<Insumo> {
  AgregarCompraSeleccionInsumoPage({super.key})
    : super(
        provider: insumosFiltradosProvider,
        addElement: AgregarInsumoPage(),
      );

  @override
  String get mensajeVacio => "No hay Insumos registrados";

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    return AppbarChips(extraFilters: [TipoBusqueda.costo]);
  }

  @override
  Widget Function(Insumo element) get titleBuilder =>
      (Insumo i) => Text(i.nombre);

  @override
  Widget Function(Insumo element)? get subtitleBuilder =>
      (Insumo i) => Text(i.costoUnitario);
}
