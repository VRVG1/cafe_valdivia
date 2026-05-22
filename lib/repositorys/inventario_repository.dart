import 'package:cafe_valdivia/services/db_helper.dart';

class InventarioRepository {
  final DatabaseHelper dbHelper;

  InventarioRepository(this.dbHelper);

  Future<double> getStockArticulo({required int articuloId}) async {
    final result = await dbHelper.query(
      "V_Inventario_Articulo_Stock",
      where: 'id_articulo = ?',
      whereArgs: [articuloId],
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

  Future<List<Map<String, dynamic>>> getMovimientoArticuloDetallado({
    int? idArticulo,
  }) async {
    String? where;
    List<dynamic>? whereArgs;

    if (idArticulo != null) {
      where = 'idArticulo = ?';
      whereArgs = [idArticulo];
    }
    final List<Map<String, dynamic>> result = await dbHelper.query(
      "V_Movimiento_Articulo_Detallado",
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
      where = 'id_articulo = ?';
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
