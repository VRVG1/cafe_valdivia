import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movimiento_notifier.g.dart';

/// Resumen mensual de ventas y compras para la gráfica del Home.
@riverpod
Future<List<Map<String, dynamic>>> movimientoMensual(
  Ref ref,
  int meses,
) async {
  final repo = ref.watch(movimientoRepositoryProvider);
  return repo.movimientoMensual(meses: meses).catchError((error) {
    appLogger.e(error);
    return <Map<String, dynamic>>[];
  });
}
