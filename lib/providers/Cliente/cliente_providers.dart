import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/utils/busqueda_helper.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cliente_providers.g.dart';

@riverpod
Future<List<Cliente>> clientesFiltrados(Ref ref) async {
  final filtro = ref.watch(filtroBusquedaProvider);
  final repo = ref.watch(clienteRepositoryProvider);

  return informacionFiltrada<Cliente>(
    query: filtro.getQuery(),
    getAll: () async => repo.getAll(),
    search: repo.search,
  );
}
