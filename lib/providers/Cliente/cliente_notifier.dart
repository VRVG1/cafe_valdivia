import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cliente_notifier.g.dart';

@riverpod
class ClienteNotifier extends _$ClienteNotifier {
  @override
  Future<List<Cliente>> build() async {
    final repo = ref.watch(clienteRepositoryProvider);
    return repo.getAll();
  }

  Future<bool> create(Cliente cliente) async {
    //state = const AsyncValue.loading();
    try {
      await ref.read(clienteRepositoryProvider).create(cliente);
      ref.invalidateSelf();
      return true;
    } catch (e, st) {
      if (ref.mounted) {
        state = AsyncValue.error(e, st);
      }
      return false;
    }
  }

  Future<bool> updateElement(Cliente cliente) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(clienteRepositoryProvider).update(cliente);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      if (ref.mounted) {
        state = AsyncValue.error(e, st);
      }
      return false;
    }
  }

  Future<bool> delete(int id) async {
    //state = const AsyncValue.loading();
    try {
      await ref.read(clienteRepositoryProvider).delete(id);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      if (ref.mounted) {
        state = AsyncValue.error(e, st);
      }
      return false;
    }
  }
}
