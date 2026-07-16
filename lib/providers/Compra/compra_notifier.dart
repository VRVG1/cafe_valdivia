import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'compra_notifier.g.dart';

@riverpod
class CompraNotifier extends _$CompraNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.watch(compraRepositoryProvider);
    return repo.getAllNombreProveedor();
  }

  Future<bool> create(Compra compra, List<DetalleCompra> detallesCompra) async {
    state = const AsyncValue.loading();
    try {
      await ref
          .read(compraRepositoryProvider)
          .registrarNuevaCompra(compra: compra, detallesCompra: detallesCompra);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<Map<String, dynamic>> getFullCompra(int idCompra) async {
    return await ref.read(compraRepositoryProvider).getFullCompra(idCompra);
    //ref.invalidateSelf();
  }

  Future<bool> markAsPaid(int idCompra) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(compraRepositoryProvider).markAsPaid(idCompra);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> markAsUnPaid(int idCompra) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(compraRepositoryProvider).markAsUnpaid(idCompra);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> delete(int idCompra) async {
    state = const AsyncValue.loading();
    try {
      // await ref.read(compraRepositoryProvider).delete(idCompra);
      // ref.invalidateSelf();
      // print("Implementar el soft delete");
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
Future<Map<String, dynamic>> compraDetallada(Ref ref, int id) async {
  final repository = ref.watch(compraRepositoryProvider);
  return repository.getFullCompra(id);
}

@riverpod
Future<List<Map<String, dynamic>>> compraFiltrados(Ref ref) {
  ref.watch(compraProvider);
  final repo = ref.watch(compraRepositoryProvider);
  final filtro = ref.watch(filtroBusquedaProvider);
  final query = filtro.getQuery();
  final bool tieneFecha = filtro.tieneFiltro(TipoBusqueda.fecha);
  final pattern = "%$query%";

  if (query.trim().isEmpty && !tieneFecha) {
    return repo.getAllNombreProveedor(pattern: pattern);
  }

  String? start;
  String? end;
  if (tieneFecha) {
    start = filtro.fechaInicialIso;
    end = filtro.fechaFinalIso;
  }

  final result = repo
      .getAllNombreProveedor(start: start, end: end, pattern: pattern)
      .catchError((error) {
        appLogger.e(error);
        return <Map<String, dynamic>>[];
      });
  return result;
}
