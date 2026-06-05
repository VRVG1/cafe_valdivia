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

  Future<void> create(
    OrdenProduccion orden,
    List<OrdenProduccionConsumo> consumos,
  ) async {
    await ref
        .read(ordenProduccionRepositoryProvider)
        .registrarOrdenProduccion(orden: orden, consumos: consumos);
    ref.invalidateSelf();
  }

  Future<void> updateElement(OrdenProduccion orden) async {
    await ref.read(ordenProduccionRepositoryProvider).update(orden);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(ordenProduccionRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

@riverpod
Future<Map<String, dynamic>> ordenProduccionDetallada(
  Ref ref,
  int id,
) async {
  final repository = ref.watch(ordenProduccionRepositoryProvider);
  return repository.getFullOrdenProduccion(id);
}
