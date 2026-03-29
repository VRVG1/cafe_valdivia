import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Pages/Compras/agregar_compra_seleccion_page.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/providers/Proveedor/proveedor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCompraPageProveedorLista
    extends AgregarCompraSeleccionPage<Proveedor> {
  AgregarCompraPageProveedorLista({super.key})
    : super(provider: proveedorListProvider);

  @override
  String get mensajeVacio => "No hay Proveedor registrados";

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    return AppbarChips();
  }

  @override
  Widget Function(Proveedor element) get titleBuilder =>
      (Proveedor i) => Text(i.nombre);

  @override
  Widget Function(Proveedor element)? get subtitleBuilder =>
      (Proveedor i) => Text(i.telefono);
}
