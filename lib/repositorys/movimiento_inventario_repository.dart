import 'package:cafe_valdivia/services/db_helper.dart';
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

  Future<void> registrarMovimiento(
    TipoMovimiento tipo,
    int insumoId,
    double cantidad,
    String motivo,
    int? idDetalleCompra,
  ) async {
    await dbHelper.insert(tableName, {
      'tipo': tipo,
      'id_insumo': insumoId,
      'cantidad': cantidad.abs(),
      'fecha': DateTime.now().toIso8601String(),
      'motivo': motivo,
      'id_detalle_compra': idDetalleCompra,
    });
  }

  Future<void> registrarAjuste(
    TipoMovimiento tipo,
    int insumoId,
    double cantidad,
    String motivo,
  ) async {
    await dbHelper.insert(tableName, {
      'id_insumo': insumoId,
      'tipo': tipo,
      'cantidad': cantidad.abs(),
      'fecha': DateTime.now().toIso8601String(),
      'motivo': motivo,
    });
  }
}
