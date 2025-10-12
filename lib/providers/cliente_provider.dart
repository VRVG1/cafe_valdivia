import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/providers/providers.dart';
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
