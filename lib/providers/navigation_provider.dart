import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Estado de navegación global de la app.
///
/// Centraliza el índice de la página activa del panel principal para que
/// cualquier página (incluida su propia AppBar/drawer) pueda cambiar de
/// sección sin depender del widget `NavigationScreen` de forma directa.
class NavigationState extends Notifier<int> {
  @override
  int build() => 0;

  /// Cambia a la sección indicada por [index].
  void goTo(int index) => state = index;
}

/// Proveedor que expone el índice de la página activa.
///
/// Las secciones del menú (Home, Compras, Clientes, ...) conviven en un
/// único Scaffold; este provider permite que un drawer ubicado dentro de
/// cualquiera de las páginas modifique la sección visible.
final navigationProvider =
    NotifierProvider<NavigationState, int>(NavigationState.new);
