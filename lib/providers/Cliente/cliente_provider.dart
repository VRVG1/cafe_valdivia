import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/utils/busqueda_helper.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cliente_provider.g.dart';

@riverpod
class ClienteNotifier extends _$ClienteNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.read(clienteRepositoryProvider);
    return repo.getAllWithKilosAndTotal();
  }

  Future<bool> create(Cliente cliente) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(clienteRepositoryProvider).create(cliente);
      if (!ref.mounted) return false;
      ref.invalidateSelf();
      await future;
      if (!ref.mounted) return false;
      ref.invalidate(clientesFiltradosProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> updateElement(Cliente cliente) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(clienteRepositoryProvider).update(cliente);
      if (!ref.mounted) return false;
      ref.invalidateSelf();
      await future;
      if (!ref.mounted) return false;
      ref.invalidate(clientesFiltradosProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(clienteRepositoryProvider).delete(id);
      if (!ref.mounted) return false;
      ref.invalidateSelf();
      await future;
      if (!ref.mounted) return false;
      ref.invalidate(clientesFiltradosProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
      return false;
    }
  }
}

@riverpod
class ClienteDetail extends _$ClienteDetail {
  @override
  Future<Cliente> build(int id) async {
    final repository = ref.watch(clienteRepositoryProvider);
    return repository.getById(id);
  }
}

@riverpod
Future<Map<String, dynamic>?> clienteKilos(Ref ref, int id) async {
  final repo = ref.watch(clienteRepositoryProvider);
  final results = await repo.getAllWithKilosAndTotal(
    where: 'id_cliente = ?',
    whereArgs: [id],
  );
  return results.isNotEmpty ? results.first : null;
}

@riverpod
Future<List<Map<String, dynamic>>> clientesWithKilosFiltrados(Ref ref) async {
  ref.watch(clienteProvider);
  final repo = ref.watch(clienteRepositoryProvider);
  final filtro = ref.watch(filtroBusquedaProvider);
  final query = filtro.getQuery();

  if (query.trim().isEmpty) {
    return repo.getAllWithKilosAndTotal();
  }
  final pattern = "%$query%";

  final result = await repo.getAllWithKilosAndTotal(
    where:
        'nombre LIKE ? OR apellido LIKE ? OR telefono LIKE ? OR email LIKE ?',
    whereArgs: [pattern, pattern, pattern, pattern],
  );
  return result;
}

@riverpod
Future<List<Cliente>> clientesFiltrados(Ref ref) async {
  final filtro = ref.watch(filtroBusquedaProvider);
  final repo = ref.watch(clienteRepositoryProvider);
  return informacionFiltrada<Cliente>(
    query: filtro.getQuery(),
    getAll: () async => repo.getAll(),
    search: repo.search,
  );
}
