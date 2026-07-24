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
    return repo.getAllInsumos();
  }

  Future<bool> create(Articulo articulo) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(articulosRepositoryProvider).create(articulo);
      if (!ref.mounted) return false;
      ref.invalidateSelf();
      ref.invalidate(articulosFiltradosProvider);
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> updateElement(Articulo articulo) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(articulosRepositoryProvider).update(articulo);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(articulosRepositoryProvider).delete(id);
      ref.invalidateSelf();
      ref.invalidate(productosProviderProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
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
