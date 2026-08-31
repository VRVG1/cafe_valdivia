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

  Future<int> create(Venta venta, List<DetalleVenta> detallesVenta) async {
    final int result = await ref
        .read(ventaRepositoryProvider)
        .registrarNuevaVenta(venta: venta, detallesVenta: detallesVenta);
    if (!ref.mounted) return result;
    ref.invalidateSelf();
    await future;
    return result;
  }

  Future<Map<String, dynamic>> getFullVenta(int idVenta) async {
    return await ref
        .read(ventaRepositoryProvider)
        .getFullVenta(ventaId: idVenta);
  }

  Future<void> markAsPaid(int idVenta) async {
    await ref.read(ventaRepositoryProvider).markAsPaid(idVenta);
    if (!ref.mounted) return;
    ref.invalidate(ventaDetalladaProvider);
    ref.invalidateSelf();
    await future;
  }

  Future<void> markAsUnpaid(int idVenta) async {
    await ref.read(ventaRepositoryProvider).markAsUnpaid(idVenta);
    if (!ref.mounted) return;
    ref.invalidate(ventaDetalladaProvider);
    ref.invalidateSelf();
    await future;
  }

  Future<void> markAsNulled(int idVenta) async {
    await ref.read(ventaRepositoryProvider).markAsNulled(idVenta);
    if (!ref.mounted) return;
    ref.invalidateSelf();
    await future;
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
  final bool tieneQuery = query.trim().isNotEmpty;
  final String? pattern = tieneQuery ? "%$query%" : null;

  if (!tieneQuery && !tieneFecha) {
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
