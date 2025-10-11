import 'package:cafe_valdivia/providers/database_provider.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@riverpod
ClienteRepository clienteRepository(ClienteRepositoryRef ref) {
  final dbHelper = ref.watch(databaseHelperProvider);
  return ClienteRepository(dbHelper);
}

@riverpod
ProveedorRepository proveedorRepository(ProveedorRepositoryRef ref) {
  final dbHelper = ref.watch(databaseHelperProvider);
  return ProveedorRepository(dbHelper);
}

@riverpod
UnidadMedidaRepository unidadMedidaRepository(UnidadMedidaRepositoryRef ref) {
  final dbHelper = ref.watch(databaseHelperProvider);
  return UnidadMedidaRepository(dbHelper);
}

@riverpod
InsumoRepository insumoRepository(InsumoRepositoryRef ref) {
  final dbHelper = ref.watch(databaseHelperProvider);
  final unidadMedidaRepo = ref.watch(unidadMedidaRepositoryProvider);
  return InsumoRepository(dbHelper, unidadMedidaRepo);
}

@riverpod
CompraRepository compraRepository(CompraRepositoryRef ref) {
  final dbHelper = ref.watch(databaseHelperProvider);
  final proveedorRepo = ref.watch(proveedorRepositoryProvider);
  final insumoRepo = ref.watch(insumoRepositoryProvider);
  return CompraRepository(dbHelper, proveedorRepo, insumoRepo);
}
