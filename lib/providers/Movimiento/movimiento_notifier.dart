import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movimiento_notifier.g.dart';

/// Resumen mensual de ventas y compras para la gráfica del Home.
///
/// Devuelve los 12 meses del año [anio]; los meses sin movimientos vienen en
/// cero, incluidos los meses futuros del año en curso.
@riverpod
Future<List<Map<String, dynamic>>> movimientoMensual(
  Ref ref,
  int anio,
) async {
  final repo = ref.watch(movimientoRepositoryProvider);
  return repo.movimientoMensual(anio: anio).catchError((error) {
    appLogger.e(error);
    return <Map<String, dynamic>>[];
  });
}
