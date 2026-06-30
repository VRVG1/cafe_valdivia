class StockInsuficienteException implements Exception {
  final String mensaje;
  StockInsuficienteException(this.mensaje);

  @override
  String toString() => 'Stock insuficiente: $mensaje';
}

class RegistroNoEncontradoException implements Exception {
  final String mensaje;
  RegistroNoEncontradoException(this.mensaje);

  @override
  String toString() => 'No se encontró: $mensaje';
}

class OperacionInvalidaException implements Exception {
  final String motivo;
  OperacionInvalidaException(this.motivo);

  @override
  String toString() => 'Operación inválida: $motivo';
}
