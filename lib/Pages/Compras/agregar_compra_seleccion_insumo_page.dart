import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_page.dart';
import 'package:cafe_valdivia/core/models/insumo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCompraSeleccionInsumoPage
    extends AgregarCompraSeleccionPage<Insumo> {
  const AgregarCompraSeleccionInsumoPage({
    super.key,
    required super.asyncData,
    required super.provider,
  });

  @override
  String get mensajeVacio => "No hay Insumos registrados";

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    return AppbarChips();
  }

  @override
  Widget Function(Insumo element) get titleBuilder =>
      (Insumo i) => Text(i.nombre);

  @override
  Widget Function(Insumo element)? get subtitleBuilder =>
      (Insumo i) => Text(i.costoUnitario);
}
