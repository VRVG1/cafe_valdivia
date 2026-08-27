import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receta_provider.g.dart';

@riverpod
class RecetaProvider extends _$RecetaProvider {
  @override
  Future<List<Receta>> build() async {
    final repo = ref.watch(recetaRepositoryProvider);
    return repo.getAll();
  }

  Future<int> create(Receta receta, [List<RecetaDetalle>? detalles]) async {
    final repo = ref.read(recetaRepositoryProvider);
    final int result = detalles != null
        ? await repo.registrarNuevaReceta(receta: receta, detalles: detalles)
        : await repo.create(receta);
    if (!ref.mounted) return result;
    ref.invalidateSelf();
    await future;
    return result;
  }

  Future<void> updateElement(
    Receta receta, [
    List<RecetaDetalle>? detalles,
  ]) async {
    final repo = ref.read(recetaRepositoryProvider);
    if (detalles != null) {
      await repo.updateReceta(receta: receta, detalles: detalles);
    } else {
      await repo.update(receta);
    }
    if (!ref.mounted) return;
    ref.invalidateSelf();
    await future;
  }

  Future<void> delete(int id) async {
    await ref.read(recetaRepositoryProvider).delete(id);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    await future;
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

@riverpod
Future<List<Receta>> recetasFiltrados(Ref ref) async {
  ref.watch(recetaProviderProvider);
  final repo = ref.watch(recetaRepositoryProvider);
  final filtro = ref.watch(filtroBusquedaProvider);
  final String query = filtro.getQuery();

  if (query.trim().isEmpty) {
    return repo.getAll();
  }
  return repo.search(query);
}
