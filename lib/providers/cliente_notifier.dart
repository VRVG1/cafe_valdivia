import 'package:cafe_valdivia/models/cliente.dart';
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

  Future<void> create(Cliente cliente) async {
    await ref.read(clienteRepositoryProvider).create(cliente);
    ref.invalidateSelf();
  }

  Future<void> updateElement(Cliente cliente) async {
    await ref.read(clienteRepositoryProvider).update(cliente);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(clienteRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}
