import 'package:cafe_valdivia/core/models/orden_produccion.dart';
import 'package:cafe_valdivia/core/models/orden_produccion_consumo.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orden_produccion_notifier.g.dart';

@riverpod
class OrdenProduccionNotifier extends _$OrdenProduccionNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.watch(ordenProduccionRepositoryProvider);
    return repo.getAllFullOrdenes();
  }

  Future<bool> create(
    OrdenProduccion orden,
    List<OrdenProduccionConsumo> consumos,
  ) async {
    state = const AsyncValue.loading();
    try {
      await ref
          .read(ordenProduccionRepositoryProvider)
          .registrarOrdenProduccion(orden: orden, consumos: consumos);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> updateElement(OrdenProduccion orden) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(ordenProduccionRepositoryProvider).update(orden);
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
      await ref.read(ordenProduccionRepositoryProvider).delete(id);
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
Future<Map<String, dynamic>> ordenProduccionDetallada(Ref ref, int id) async {
  final repository = ref.watch(ordenProduccionRepositoryProvider);
  return repository.getFullOrdenProduccion(id);
}
