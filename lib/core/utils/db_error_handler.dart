import 'package:cafe_valdivia/core/utils/exceptions.dart';

String traducirErrorBD(dynamic error) {
  final msg = error.toString();

  if (error is StockInsuficienteException) {
    return error.mensaje ?? "ERROR Desconocido";
  }
  if (error is RegistroNoEncontradoException) {
    return error.mensaje ?? "error desconocido";
  }
  if (error is OperacionInvalidaException) {
    return error.motivo ?? "error desconocido";
  }

  if (msg.contains('UNIQUE constraint failed')) {
    if (msg.contains('Cliente.email'))
      return 'Ya existe un cliente con ese email';
    if (msg.contains('Proveedor.email'))
      return 'Ya existe un proveedor con ese email';
    if (msg.contains('Articulo.nombre'))
      return 'Ya existe un artículo con ese nombre';
    return 'Ya existe un registro con ese valor';
  }

  if (msg.contains('FOREIGN KEY constraint failed')) {
    return 'No se puede eliminar porque está siendo usado en otros registros';
  }

  if (msg.contains('CHECK constraint failed')) {
    return 'El valor ingresado no es válido';
  }

  return 'Ocurrió un error inesperado. Intenta de nuevo.';
}
