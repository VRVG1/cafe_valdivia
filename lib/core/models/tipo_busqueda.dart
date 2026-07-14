enum TipoBusqueda {
  nombre,
  email,
  telefono,
  costo,
  direccion,
  stock,
  unidadMedida,
  venta,
  fecha,
}

class FiltroBusqueda {
  final String query;
  final Set<TipoBusqueda> filtrosActivos;
  final DateTime? fechaInicial;
  final DateTime? fechaFinal;

  const FiltroBusqueda({
    this.query = '',
    this.filtrosActivos = const {TipoBusqueda.nombre},
    this.fechaInicial,
    this.fechaFinal,
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

  String getQuery() => query;

  String? get fechaInicialIso => fechaInicial != null
      ? '${fechaInicial!.year.toString().padLeft(4, '0')}-'
            '${fechaInicial!.month.toString().padLeft(2, '0')}-'
            '${fechaInicial!.day.toString().padLeft(2, '0')}T00:00:00.000Z'
      : null;

  String? get fechaFinalIso => fechaFinal != null
      ? '${fechaFinal!.year.toString().padLeft(4, '0')}-'
            '${fechaFinal!.month.toString().padLeft(2, '0')}-'
            '${fechaFinal!.day.toString().padLeft(2, '0')}T23:59:59.000Z'
      : null;

  FiltroBusqueda copyWith({
    String? query,
    Set<TipoBusqueda>? filtrosActivos,
    DateTime? fechaInicial,
    DateTime? fechaFinal,
  }) {
    return FiltroBusqueda(
      query: query ?? this.query,
      filtrosActivos: filtrosActivos ?? this.filtrosActivos,
      fechaInicial: fechaInicial ?? this.fechaInicial,
      fechaFinal: fechaFinal ?? this.fechaFinal,
    );
  }

  @override
  String toString() =>
      'FiltrosBusqueda(query: $query, filtros: $filtrosActivos, fechaInicial: $fechaInicial, fechaFinal: $fechaFinal)';
}
