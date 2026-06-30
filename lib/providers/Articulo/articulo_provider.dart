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
      return false;
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
