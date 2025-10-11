import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'proveedor_notifier.g.dart';

@riverpod
class ProveedorNotifier extends _$ProveedorNotifier {
  @override
  Future<List<Proveedor>> build() async {
    final repo = ref.watch(proveedorRepositoryProvider);
    return repo.getAll();
  }

  Future<void> create(Proveedor proveedor) async {
    await ref.read(proveedorRepositoryProvider).create(proveedor);
    ref.invalidateSelf();
  }

  Future<void> updateProveedor(Proveedor proveedor) async {
    await ref.read(proveedorRepositoryProvider).update(proveedor);
    ref.invalidateSelf();
  }

  Future<void> deleteProveedor(int id) async {
    await ref.read(proveedorRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}
