import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'producto_provider.g.dart';

@riverpod
class ProductoDetail extends _$ProductoDetail {
  @override
  Future<Producto> build(int id) async {
    final repository = ref.watch(productoRepositoryProvider);
    return repository.getById(id);
  }
}
