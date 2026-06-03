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

  Future<void> create(Receta receta, [List<RecetaDetalle>? detalles]) async {
    final repo = ref.watch(recetaRepositoryProvider);
    if (detalles != null) {
      await repo.registrarNuevaReceta(receta: receta, detalles: detalles);
    } else {
      await repo.create(receta);
    }
    if (!ref.mounted) return;
    ref.invalidateSelf();
  }

  Future<void> updateElement(Receta receta) async {
    await ref.read(recetaRepositoryProvider).update(receta);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(recetaRepositoryProvider).delete(id);
    ref.invalidateSelf();
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
