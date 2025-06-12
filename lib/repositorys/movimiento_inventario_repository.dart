import 'package:cafe_valdivia/handler/db_helper.dart';
import 'package:cafe_valdivia/models/movimiento_invetario.dart';

class MovimientoInventarioRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Movimiento_Inventario';

  MovimientoInventarioRepository(this.dbHelper);

  Future<List<MovimientoInvetario>> getByInsumo(int insumoId) async {
    final result = await dbHelper.query(
      tableName,
      where: 'id_insumo = ?',
      whereArgs: [insumoId],
      orderBy: 'fecha DESC',
    );

    return result.map((map) => MovimientoInvetario.fromMap(map)).toList();
  }

  Future<void> registrarAjuste(
    int insumoId,
    double cantidad,
    String motivo,
  ) async {
    await dbHelper.insert(tableName, {
      'id_insumo': insumoId,
      'tipo': 'Ajuste',
      'cantidad': cantidad.abs(),
      'fecha': DateTime.now().toIso8601String(),
      'motivo': motivo,
    });
  }
}
