class StockInsuficienteException implements Exception {
  final String mensaje;
  StockInsuficienteException(this.mensaje);
}

class RegistroNoEncontradoException implements Exception {
  final String mensaje;
  RegistroNoEncontradoException(this.mensaje);

  @override
  String toString() => 'No se encontreo $mensaje';
}

class OperacionInvalidaException implements Exception {
  final String motivo;
  OperacionInvalidaException(this.motivo);
}
