import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'producto_notifier.g.dart';

@riverpod
class ProductoNotifier extends _$ProductoNotifier {
  @override
  Future<List<Producto>> build() async {
    final repo = ref.watch(productoRepositoryProvider);
    return repo.getAll();
  }

  Future<void> create(Producto producto) async {
    await ref.read(productoRepositoryProvider).create(producto);
    ref.invalidateSelf();
  }

  Future<void> updateProducto(Producto producto) async {
    await ref.read(productoRepositoryProvider).update(producto);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    await ref.read(productoRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}
