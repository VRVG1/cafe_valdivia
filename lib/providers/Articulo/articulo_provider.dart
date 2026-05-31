import 'package:cafe_valdivia/core/utils/busqueda_helper.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/providers/providers.dart';

part 'articulo_provider.g.dart';

@riverpod
class ArticuloProvider extends _$ArticuloProvider {
  @override
  Future<List<Articulo>> build() async {
    final repo = ref.watch(articulosRepositoryProvider);
    return repo.getAll();
  }

  Future<void> create(Articulo articulo) async {
    await ref.read(articulosRepositoryProvider).create(articulo);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    ref.invalidate(articulosFiltradosProvider);
  }

  Future<void> updateElement(Articulo articulo) async {
    await ref.read(articulosRepositoryProvider).update(articulo);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(articulosRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

@riverpod
Future<Articulo> articuloDetail(Ref ref, int id) async {
  final repository = ref.watch(articulosRepositoryProvider);
  return repository.getById(id);
}

@riverpod
Future<List<Articulo>> articulosFiltrados(Ref ref) async {
  final filtro = ref.watch(filtroBusquedaProvider);
  final repo = ref.watch(articulosRepositoryProvider);

  return informacionFiltrada(
    query: filtro.getQuery(),
    getAll: () async => repo.getAll(),
    search: repo.search,
  );
}

@riverpod
Future<List<Articulo>> productosProvider(Ref ref) async {
  final repo = ref.watch(articulosRepositoryProvider);
  final List<Articulo> articulos = await repo.getAllProductos();
  appLogger.i(articulos);
  return articulos;
}
