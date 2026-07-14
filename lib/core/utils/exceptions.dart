class StockInsuficienteException implements Exception {
  final String? mensaje;
  StockInsuficienteException(this.mensaje);

  @override
  String toString() => mensaje ?? "PANIC";
}

class RegistroNoEncontradoException implements Exception {
  final String? mensaje;
  RegistroNoEncontradoException(this.mensaje);

  @override
  String toString() => mensaje ?? "PANIC";
}

class OperacionInvalidaException implements Exception {
  final String? motivo;
  OperacionInvalidaException(this.motivo);

  @override
  String toString() => motivo ?? "PANIC";
}
