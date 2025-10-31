import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unidad_medida_notifier.g.dart';

@riverpod
class UnidadMedidaNotifier extends _$UnidadMedidaNotifier {
  @override
  Future<List<UnidadMedida>> build() async {
    final repo = ref.watch(unidadMedidaRepositoryProvider);
    return repo.getAll();
  }

  Future<bool> create(String nombre) async {
    state = const AsyncValue.loading();
    try {
      final UnidadMedida unidadMedida = UnidadMedida(nombre: nombre);
      await ref.read(unidadMedidaRepositoryProvider).create(unidadMedida);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> updateElement(UnidadMedida unidadMedida) async {
    state = const AsyncValue.loading();
    try {
      ref.read(unidadMedidaRepositoryProvider).update(unidadMedida);
      ref.invalidateSelf();
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
    // ref.read(unidadMedidaRepositoryProvider).update(unidadMedida);
    // ref.invalidateSelf();
  }

  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(unidadMedidaRepositoryProvider).delete(id);
      ref.invalidateSelf();
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
