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
    ref.invalidateSelf();
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
