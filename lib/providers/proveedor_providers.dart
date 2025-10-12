import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'proveedor_providers.g.dart';

@riverpod
class ProveedorDetail extends _$ProveedorDetail {
  @override
  Future<Proveedor> build(int id) async {
    final repository = ref.watch(proveedorRepositoryProvider);
    return repository.getById(id);
  }
}
