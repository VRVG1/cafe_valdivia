import 'package:cafe_valdivia/services/db_helper.dart';

/// Repositorio de consulta agregada para el resumen de movimientos.
///
/// No extiende [BaseRepository] porque no opera sobre una tabla con entidad,
/// sino sobre la vista agregada `V_Movimiento_Mensual`.
class MovimientoRepository {
  final DatabaseHelper dbHelper;

  MovimientoRepository(this.dbHelper);

  /// Devuelve los movimientos de los 12 meses del año [anio].
  ///
  /// Si [anio] es null se usa el año en curso. La serie siempre incluye los
  /// 12 meses de enero a diciembre: los que no tienen movimientos (por ejemplo
  /// los meses futuros del año en curso) se devuelven con valores en cero.
  Future<List<Map<String, dynamic>>> movimientoMensual({
    int? anio,
  }) async {
    final db = await dbHelper.database;

    final anioTarget = anio ?? DateTime.now().year;
    final inicio = DateTime(anioTarget, 1, 1);
    final fin = DateTime(anioTarget, 12, 1);

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
    for (int mesNumero = 1; mesNumero <= 12; mesNumero++) {
      final mes = DateTime(anioTarget, mesNumero, 1);
      final periodo = _periodo(mes);
      resultado.add(
        porPeriodo[periodo] ??
            <String, dynamic>{
              'periodo': periodo,
              'anio': anioTarget,
              'mes': mesNumero,
              'nombre_mes': _nombreMes(mesNumero),
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
