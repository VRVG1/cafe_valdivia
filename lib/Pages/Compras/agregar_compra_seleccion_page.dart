import 'package:cafe_valdivia/Components/seleccion_page.dart';

abstract class AgregarCompraSeleccionPage<T> extends SeleccionPage<T> {
  const AgregarCompraSeleccionPage({
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
  String get debugKey => 'seleccion_compra';
}
