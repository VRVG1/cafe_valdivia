enum TipoBusqueda { nombre, email, telefono }

class FiltroBusqueda {
  final String query;
  final Set<TipoBusqueda> filtrosActivos;

  const FiltroBusqueda({
    this.query = '',
    this.filtrosActivos = const {TipoBusqueda.nombre},
  });

  FiltroBusqueda agregarFiltro(TipoBusqueda filtro) {
    final nuevoSet = Set<TipoBusqueda>.from(filtrosActivos)..add(filtro);
    return copyWith(filtrosActivos: nuevoSet);
  }

  FiltroBusqueda removerFiltro(TipoBusqueda filtro) {
    final nuevoSet = Set<TipoBusqueda>.from(filtrosActivos)..remove(filtro);
    return copyWith(filtrosActivos: nuevoSet);
  }

  FiltroBusqueda toggleFiltro(TipoBusqueda filtro) {
    final nuevoSet = Set<TipoBusqueda>.from(filtrosActivos);
    nuevoSet.contains(filtro) ? nuevoSet.remove(filtro) : nuevoSet.add(filtro);
    return copyWith(filtrosActivos: nuevoSet);
  }

  bool tieneFiltro(TipoBusqueda filtro) => filtrosActivos.contains(filtro);

  FiltroBusqueda copyWith({String? query, Set<TipoBusqueda>? filtrosActivos}) {
    return FiltroBusqueda(
      query: query ?? this.query,
      filtrosActivos: filtrosActivos ?? this.filtrosActivos,
    );
  }

  @override
  String toString() =>
      'FiltrosBusqueda(query: $query, filtros: $filtrosActivos)';
}
