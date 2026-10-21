import 'package:cafe_valdivia/services/db_helper.dart';

/// Repositorio de consulta agregada para el resumen de movimientos.
///
/// No extiende [BaseRepository] porque no opera sobre una tabla con entidad,
/// sino sobre la vista agregada `V_Movimiento_Mensual`.
class MovimientoRepository {
  final DatabaseHelper dbHelper;

  MovimientoRepository(this.dbHelper);

  /// Devuelve los movimientos de los últimos [meses] meses, terminando en el
  /// mes actual.
  ///
  /// Los meses sin movimientos se incluyen con valores en cero para que la
  /// gráfica siempre tenga la misma cantidad de barras.
  Future<List<Map<String, dynamic>>> movimientoMensual({
    int meses = 12,
  }) async {
    final db = await dbHelper.database;

    final ahora = DateTime.now();
    final inicio = DateTime(ahora.year, ahora.month - (meses - 1), 1);
    final fin = DateTime(ahora.year, ahora.month, 1);

    final filas = await db.rawQuery('''
    SELECT periodo, anio, mes, nombre_mes,
           num_ventas, total_ventas,
           num_compras, total_compras
    FROM V_Movimiento_Mensual
    WHERE periodo BETWEEN ? AND ?
    ORDER BY periodo
  ''', [_periodo(inicio), _periodo(fin)]);

    final Map<String, Map<String, dynamic>> porPeriodo = {
      for (final fila in filas) fila['periodo'] as String: fila,
    };

    final List<Map<String, dynamic>> resultado = [];
    for (int i = 0; i < meses; i++) {
      final mes = DateTime(inicio.year, inicio.month + i, 1);
      final periodo = _periodo(mes);
      resultado.add(
        porPeriodo[periodo] ??
            <String, dynamic>{
              'periodo': periodo,
              'anio': mes.year,
              'mes': mes.month,
              'nombre_mes': _nombreMes(mes.month),
              'num_ventas': 0,
              'total_ventas': 0.0,
              'num_compras': 0,
              'total_compras': 0.0,
            },
      );
    }

    return resultado;
  }

  static String _periodo(DateTime fecha) =>
      '${fecha.year}-${fecha.month.toString().padLeft(2, '0')}';

  static const List<String> _meses = [
    'Ene',
    'Feb',
    'Mar',
    'Abr',
    'May',
    'Jun',
    'Jul',
    'Ago',
    'Sep',
    'Oct',
    'Nov',
    'Dic',
  ];

  static String _nombreMes(int mes) => _meses[mes - 1];
}
