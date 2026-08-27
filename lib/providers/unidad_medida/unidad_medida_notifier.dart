import 'package:cafe_valdivia/core/models/unidad_medida.dart';
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

  Future<int> create(String nombre) async {
    final UnidadMedida unidadMedida = UnidadMedida(nombre: nombre);
    final int result = await ref
        .read(unidadMedidaRepositoryProvider)
        .create(unidadMedida);
    if (!ref.mounted) return result;
    ref.invalidateSelf();
    await future;
    return result;
  }

  Future<void> updateElement(UnidadMedida unidadMedida) async {
    await ref.read(unidadMedidaRepositoryProvider).update(unidadMedida);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    await future;
  }

  Future<void> delete(int id) async {
    await ref.read(unidadMedidaRepositoryProvider).delete(id);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    await future;
  }
}
