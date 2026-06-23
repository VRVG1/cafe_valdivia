import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cliente_provider.g.dart';

@riverpod
class ClienteDetail extends _$ClienteDetail {
  @override
  Future<Cliente> build(int id) async {
    final repository = ref.watch(clienteRepositoryProvider);
    return repository.getById(id);
  }
}

final clienteKilosProvider = FutureProvider.family<Map<String, dynamic>?, int>((
  ref,
  id,
) async {
  final repo = ref.watch(clienteRepositoryProvider);
  final results = await repo.getAllWithKilosAndTotal(
    where: 'id_cliente = ?',
    whereArgs: [id],
  );
  return results.isNotEmpty ? results.first : null;
});

final clientesKilosListProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final repo = ref.watch(clienteRepositoryProvider);
  return repo.getAllWithKilosAndTotal();
});
