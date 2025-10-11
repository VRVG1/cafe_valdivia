import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'insumo_notifier.g.dart';

@riverpod
class InsumoNotifier extends _$InsumoNotifier {
  @override
  Future<List<Insumos>> build() async {
    final repo = ref.watch(insumoRepositoryProvider);
    return repo.getAll();
  }

  Future<void> create(Insumos insumo) async {
    await ref.read(insumoRepositoryProvider).create(insumo);
    ref.invalidateSelf();
  }

  Future<void> updateInsumo(Insumos insumo) async {
    await ref.read(insumoRepositoryProvider).update(insumo);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(insumoRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}
