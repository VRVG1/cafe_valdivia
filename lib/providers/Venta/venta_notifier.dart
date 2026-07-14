import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/core/models/venta.dart';
import 'package:cafe_valdivia/core/models/detalle_venta.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'venta_notifier.g.dart';

@riverpod
class VentaNotifier extends _$VentaNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.watch(ventaRepositoryProvider);
    return repo.getAllFullVentas();
  }

  Future<void> create(Venta venta, List<DetalleVenta> detallesVenta) async {
    await ref
        .read(ventaRepositoryProvider)
        .registrarNuevaVenta(venta: venta, detallesVenta: detallesVenta);
    ref.invalidateSelf();
  }

  Future<Map<String, dynamic>> getFullVenta(int idVenta) async {
    return await ref
        .read(ventaRepositoryProvider)
        .getFullVenta(ventaId: idVenta);
  }

  Future<bool> markAsPaid(int idVenta) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(ventaRepositoryProvider).markAsPaid(idVenta);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> markAsUnpaid(int idVenta) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(ventaRepositoryProvider).markAsUnpaid(idVenta);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> markAsNulled(int idVenta) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(ventaRepositoryProvider).markAsNulled(idVenta);
      ref.invalidateSelf();
      await future;
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
Future<Map<String, dynamic>> ventaDetallada(Ref ref, int id) async {
  final repository = ref.watch(ventaRepositoryProvider);
  return repository.getFullVenta(ventaId: id);
}

@riverpod
Future<List<Map<String, dynamic>>> ventasfiltrados(Ref ref) async {
  ref.watch(ventaProvider);
  final repo = ref.watch(ventaRepositoryProvider);
  final filtro = ref.watch(filtroBusquedaProvider);
  final String query = filtro.getQuery();
  final bool tieneFecha = filtro.tieneFiltro(TipoBusqueda.fecha);
  final String pattern = "%$query%";

  if (query.trim().isEmpty && !tieneFecha) {
    return repo.getAllFullVentas();
  }
  String? start;
  String? end;
  if (tieneFecha) {
    start = filtro.fechaInicialIso;
    end = filtro.fechaFinalIso;
  }
  final result = repo
      .getFilteredFullVentas(start: start, end: end, pattern: pattern)
      .catchError((error) {
        appLogger.e(error);
        return <Map<String, dynamic>>[];
      });
  return result;
}
