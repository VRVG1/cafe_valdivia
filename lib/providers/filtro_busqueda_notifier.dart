import 'package:cafe_valdivia/utils/tipo_busqueda.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtro_busqueda_notifier.g.dart';

@Riverpod(keepAlive: true)
class FiltroBusquedaNotifier extends _$FiltroBusquedaNotifier {
  @override
  FiltroBusqueda build() {
    return const FiltroBusqueda();
  }

  void toggleFiltro(TipoBusqueda filtro) {
    state = state.toggleFiltro(filtro);
  }

  void agregarFiltro(TipoBusqueda filtro) {
    state = state.agregarFiltro(filtro);
  }

  void removerFiltro(TipoBusqueda filtro) {
    state = state.removerFiltro(filtro);
  }
}
