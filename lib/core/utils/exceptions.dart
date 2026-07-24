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

class RelacionExistenteException implements Exception {
  final String? mensaje;
  RelacionExistenteException([this.mensaje]);

  @override
  String toString() => mensaje ?? "No se puede eliminar porque tiene registros asociados";
}

class UnknowErrorException implements Exception {
  @override
  String toString() => "Error desconocido";
}
