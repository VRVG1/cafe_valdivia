import 'package:cafe_valdivia/services/db_helper.dart';

class InventarioRepository {
  final DatabaseHelper dbHelper;

  InventarioRepository(this.dbHelper);

  Future<double> getStockInsumo({required int insumoId}) async {
    final result = await dbHelper.query(
      "V_Inventario_Insumo_Stock",
      where: 'id_insumo = ?',
      whereArgs: [insumoId],
      limit: 1,
    );
    return result.isEmpty
        ? 0.0
        : (result.first['stock_actual'] as num).toDouble();
  }

  Future<double> getStockProducto({required int idProducto}) async {
    final List<Map<String, dynamic>> result = await dbHelper.query(
      "V_Inventario_Producto_Stock",
      where: 'id_producto = ?',
      whereArgs: [idProducto],
      limit: 1,
    );

    return result.isEmpty
        ? 0.0
        : (result.first['stock_actual'] as num).toDouble();
  }

  Future<List<Map<String, dynamic>>> getMovimientoInsumoDetallado({
    int? idInsumo,
  }) async {
    String? where;
    List<dynamic>? whereArgs;

    if (idInsumo != null) {
      where = 'idInsumo = ?';
      whereArgs = [idInsumo];
    }
    final List<Map<String, dynamic>> result = await dbHelper.query(
      "V_Movimiento_Insumo_Detallado",
      where: where,
      whereArgs: whereArgs,
      orderBy: 'fecha DESC',
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> getMovimientoProductoDetallado({
    int? idProducto,
  }) async {
    String? where;
    List<dynamic>? whereArgs;

    if (idProducto != null) {
      where = 'id_insumo = ?';
      whereArgs = [idProducto];
    }
    final List<Map<String, dynamic>> result = await dbHelper.query(
      "V_Movimiento_Producto_Detallado",
      where: where,
      whereArgs: whereArgs,
      orderBy: 'fecha DESC',
    );

    return result;
  }
}
