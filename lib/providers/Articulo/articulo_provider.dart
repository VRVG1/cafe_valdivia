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
    return repo.getAllInsumos();
  }

  Future<int> create(Articulo articulo) async {
    final int result = await ref
        .read(articulosRepositoryProvider)
        .create(articulo);
    if (!ref.mounted) return result;
    ref.invalidateSelf();
    await future;
    return result;
  }

  Future<void> updateElement(Articulo articulo) async {
    await ref.read(articulosRepositoryProvider).update(articulo);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    await future;
  }

  Future<void> delete(int id) async {
    await ref.read(articulosRepositoryProvider).delete(id);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    ref.invalidate(productosProviderProvider);
  }
}

@riverpod
Future<Articulo> articuloDetail(Ref ref, int id) async {
  final repository = ref.watch(articulosRepositoryProvider);
  return repository.getById(id);
}

@riverpod
Future<List<Articulo>> articulosFiltrados(Ref ref) async {
  ref.watch(articuloProviderProvider);
  final repo = ref.watch(articulosRepositoryProvider);
  final filtro = ref.watch(filtroBusquedaProvider);
  final String query = filtro.getQuery();

  if (query.trim().isEmpty) {
    return repo.getAllInsumos();
  }
  final String pattern = "%$query%";
  final result = repo.searchInsumo(whereArgs: [pattern, pattern, pattern]);
  return result;
}

@riverpod
Future<List<Articulo>> productosFiltrados(Ref ref) async {
  ref.watch(articuloProviderProvider);
  final repo = ref.watch(articulosRepositoryProvider);
  final filtro = ref.watch(filtroBusquedaProvider);
  final String query = filtro.getQuery();

  if (query.trim().isEmpty) {
    return repo.getAllProductos();
  }
  final String pattern = "%$query%";
  final result = repo.searchProducto(
    whereArgs: [pattern, pattern, pattern, pattern],
  );
  return result;
}

@riverpod
Future<List<Articulo>> productosProvider(Ref ref) async {
  final repo = ref.watch(articulosRepositoryProvider);
  final List<Articulo> articulos = await repo.getAllProductos();
  return articulos;
}

@riverpod
Future<List<Articulo>> productosEIntermedioProvider(Ref ref) async {
  final repo = ref.watch(articulosRepositoryProvider);
  final List<Articulo> articulos = await repo
      .getAllProductosIntermedisoProductos();
  return articulos;
}
