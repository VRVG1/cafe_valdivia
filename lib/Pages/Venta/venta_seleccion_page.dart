import 'package:cafe_valdivia/Components/seleccion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class VentaSeleccionPage<T> extends SeleccionPage<T> {
  const VentaSeleccionPage({
    super.key,
    required super.provider,
    required super.addElement,
    super.subtitleBuilder,
    super.leadingBuilder,
    super.trailingBuilder,
    super.keyBuilder,
    super.onTapCallback,
    super.onEditDismissed,
    super.onDeleteDismissed,
    super.controller,
    super.footer,
    super.header,
  });

  @override
  String get debugKey => 'seleccion_venta';
}
