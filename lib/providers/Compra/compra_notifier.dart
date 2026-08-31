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

  Future<int> create(Compra compra, List<DetalleCompra> detallesCompra) async {
    final int result = await ref
        .read(compraRepositoryProvider)
        .registrarNuevaCompra(compra: compra, detallesCompra: detallesCompra);
    if (!ref.mounted) return result;
    ref.invalidateSelf();
    await future;
    return result;
  }

  Future<Map<String, dynamic>> getFullCompra(int idCompra) async {
    return await ref.read(compraRepositoryProvider).getFullCompra(idCompra);
    //ref.invalidateSelf();
  }

  Future<void> markAsPaid(int idCompra) async {
    await ref.read(compraRepositoryProvider).markAsPaid(idCompra);
    if (!ref.mounted) return;
    ref.invalidate(compraDetalladaProvider);
    ref.invalidateSelf();
    await future;
  }

  Future<void> markAsUnPaid(int idCompra) async {
    await ref.read(compraRepositoryProvider).markAsUnpaid(idCompra);
    if (!ref.mounted) return;
    ref.invalidate(compraDetalladaProvider);
    ref.invalidateSelf();
    await future;
  }

  Future<void> delete(int idCompra) async {
    // TODO: Implementar el soft delete
    await future;
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
  final pattern = query;

  if (query.trim().isEmpty && !tieneFecha) {
    return repo.getAllNombreProveedor();
  }

  String? start;
  String? end;
  if (tieneFecha) {
    start = filtro.fechaInicialIso;
    end = filtro.fechaFinalIso;
  }

  final result = repo
      .getAllNombreProveedorFiltrado(start: start, end: end, pattern: pattern)
      .catchError((error) {
        appLogger.e(error);
        return <Map<String, dynamic>>[];
      });
  return result;
}
