import 'package:cafe_valdivia/core/utils/busqueda_helper.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cafe_valdivia/core/models/insumo.dart';
import 'package:cafe_valdivia/providers/providers.dart';

part 'insumo_provider.g.dart';

@riverpod
class InsumoProvider extends _$InsumoProvider {
  @override
  Future<List<Insumo>> build() async {
    final repo = ref.watch(insumosRepositoryProvider);
    return repo.getAll();
  }

  Future<void> create(Insumo insumo) async {
    await ref.read(insumosRepositoryProvider).create(insumo);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    ref.invalidate(insumosFiltradosProvider);
  }

  Future<void> updateElement(Insumo insumo) async {
    await ref.read(insumosRepositoryProvider).update(insumo);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(insumosRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

@riverpod
Future<Insumo> insumoDetail(Ref ref, int id) async {
  final repository = ref.watch(insumosRepositoryProvider);
  return repository.getById(id);
}

@riverpod
Future<List<Insumo>> insumosFiltrados(Ref ref) async {
  final filtro = ref.watch(filtroBusquedaProvider);
  final repo = ref.watch(insumosRepositoryProvider);

  return informacionFiltrada(
    query: filtro.getQuery(),
    getAll: () async => repo.getAll(),
    search: repo.search,
  );
}
