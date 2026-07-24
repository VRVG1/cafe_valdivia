import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receta_provider.g.dart';

@riverpod
class RecetaProvider extends _$RecetaProvider {
  @override
  Future<List<Receta>> build() async {
    final repo = ref.watch(recetaRepositoryProvider);
    return repo.getAll();
  }

  Future<bool> create(Receta receta, [List<RecetaDetalle>? detalles]) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.watch(recetaRepositoryProvider);
      if (detalles != null) {
        await repo.registrarNuevaReceta(receta: receta, detalles: detalles);
      } else {
        await repo.create(receta);
      }
      if (!ref.mounted) return false;
      ref.invalidateSelf();
      await future;
      return false;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> updateElement(Receta receta) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(recetaRepositoryProvider).update(receta);
      ref.invalidateSelf();
      await future;
      return false;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(recetaRepositoryProvider).delete(id);
      ref.invalidateSelf();
      await future;
      return false;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}

@riverpod
Future<Receta> recetaDetail(Ref ref, int id) async {
  final repo = ref.watch(recetaRepositoryProvider);
  return repo.getById(id);
}

@riverpod
Future<List<RecetaDetalle>> recetaDetalles(Ref ref, int recetaId) async {
  final repo = ref.watch(recetaRepositoryProvider);
  return repo.getRecetaDetalles(recetaId);
}
