import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Pages/Venta/venta_seleccion_page.dart';
import 'package:cafe_valdivia/Pages/Clientes/agregar_cliente.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/providers/Cliente/cliente_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VentaSeleccionClientePage extends VentaSeleccionPage<Cliente> {
  VentaSeleccionClientePage({super.key})
    : super(
        provider: clientesFiltradosProvider,
        addElement: Agregarcliente(),
      );

  @override
  String get mensajeVacio => "No hay Clientes registrados";

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    return AppbarChips(
      extraFilters: [TipoBusqueda.email, TipoBusqueda.telefono],
    );
  }

  @override
  Widget Function(Cliente element) get titleBuilder =>
      (Cliente i) => Text('${i.nombre} ${i.apellido}');

  @override
  Widget Function(Cliente element)? get subtitleBuilder =>
      (Cliente i) => Text(i.telefono ?? '');
}
