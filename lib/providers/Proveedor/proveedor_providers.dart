import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:cafe_valdivia/providers/providers.dart';

part 'proveedor_providers.g.dart';

@riverpod
class ProveedorList extends _$ProveedorList {
  @override
  Future<List<Proveedor>> build() async {
    final repo = ref.watch(proveedorRepositoryProvider);
    return repo.getAll();
  }

  Future<bool> create(Proveedor proveedor) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(proveedorRepositoryProvider).create(proveedor);
      if (!ref.mounted) return false;
      ref.invalidateSelf();
      ref.invalidate(proveedoresFiltradosProvider);
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> updateElement(Proveedor proveedor) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(proveedorRepositoryProvider).update(proveedor);
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
      await ref.read(proveedorRepositoryProvider).delete(id);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
Future<Proveedor> proveedorDetail(Ref ref, int id) async {
  final repository = ref.watch(proveedorRepositoryProvider);
  return repository.getById(id);
}

@riverpod
Future<List<Proveedor>> proveedoresFiltrados(Ref ref) async {
  ref.watch(proveedorListProvider);
  final repo = ref.watch(proveedorRepositoryProvider);
  final filtro = ref.watch(filtroBusquedaProvider);
  final String query = filtro.getQuery();
  if (query.trim().isEmpty) {
    return repo.getAll();
  }
  final String pattern = "%$query%";
  final result = await repo.search(
    whereArgs: [pattern, pattern, pattern, pattern],
  );
  return result;
}
