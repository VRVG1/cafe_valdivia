import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'proveedor_providers.g.dart';

@Riverpod(keepAlive: false)
Future<Proveedor> proveedorDetail(ProveedorDetailRef ref, int id) async {
  final repository = ref.watch(proveedorRepositoryProvider);
  return repository.getById(id);
}
