//Helper generico para el manejo de las busquedas
// SI query esta vacio, regresa todos los datos

import 'package:riverpod_annotation/riverpod_annotation.dart';

Future<List<T>> informacionFiltrada<T>({
  required String query,
  required Future<List<T>> Function() getAll,
  required Future<List<T>> Function(String query) search,
}) async {
  return query.trim().isEmpty ? getAll() : search(query);
}

// Extencion para convertir los resultados directamente a AsyncValue
extension AsyncValueHelper<T> on Future<List<T>> {
  AsyncValue<List<T>> toAsyncValue() {
    /// No se como poner esto ya que necesito el .guard
    throw UnimplementedError();
  }
}
