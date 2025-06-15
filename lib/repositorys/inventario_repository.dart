import 'package:cafe_valdivia/services/db_helper.dart';

class InventarioRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Inventario';

  InventarioRepository(this.dbHelper);

  Future<double> getStock(int insumoId) async {
    final result = await dbHelper.query(
      tableName,
      where: 'id_insumo = ?',
      whereArgs: [insumoId],
      limit: 1,
    );

    return result.isEmpty ? 0.0 : (result.first['stock'] as num).toDouble();
  }

  Future<void> updateStock(int insumoId, double delta) async {
    await dbHelper.transaction((txn) async {
      final currentStock = await getStock(insumoId);
      final newStock = currentStock + delta;

      await txn.update(
        tableName,
        {'stock': newStock},
        where: 'id_insumo = ?',
        whereArgs: [insumoId],
      );
    });
  }
}
