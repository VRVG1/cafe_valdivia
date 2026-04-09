import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/core/utils/busqueda_helper.dart';
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

  Future<void> create(Proveedor proveedor) async {
    await ref.read(proveedorRepositoryProvider).create(proveedor);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    ref.invalidate(proveedoresFiltradosProvider);
  }

  Future<void> updateElement(Proveedor proveedor) async {
    await ref.read(proveedorRepositoryProvider).update(proveedor);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(proveedorRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

@riverpod
Future<Proveedor> proveedorDetail(Ref ref, int id) async {
  final repository = ref.watch(proveedorRepositoryProvider);
  return repository.getById(id);
}

@riverpod
Future<List<Proveedor>> proveedoresFiltrados(Ref ref) async {
  final filtro = ref.watch(filtroBusquedaProvider);
  final repo = ref.watch(proveedorRepositoryProvider);

  return informacionFiltrada<Proveedor>(
    query: filtro.getQuery(),
    getAll: () async => repo.getAll(),
    search: repo.search,
  );
}
