import "package:cafe_valdivia/models/detalle_venta.dart";
import "package:sqflite/sqflite.dart";

class DetalleVentaHandler {
  final Future<Database> Function() _getDatabase;
  DetalleVentaHandler(this._getDatabase);

  Future<int> insert(DetalleVenta detalleVenta) async {
    final db = await _getDatabase();
    return await db.insert(
      'Detalle_Venta',
      detalleVenta.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<DetalleVenta>> get() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Detalle_Venta');
    return List.generate(maps.length, (i) {
      return DetalleVenta.fromMap(maps[i]);
    });
  }

  Future<DetalleVenta?> getByVentaId(int ventaId) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Detalle_Venta',
      where: 'id_venta = ?',
      whereArgs: [ventaId],
    );
    if (maps.isNotEmpty) {
      return DetalleVenta.fromMap(maps.first);
    }
    return null;
  }

  Future<DetalleVenta?> getById(int id) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Detalle_Venta',
      where: 'id_venta = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return DetalleVenta.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(DetalleVenta detalleVenta) async {
    final db = await _getDatabase();
    return await db.update(
      'Detalle_Venta',
      detalleVenta.toMap(),
      where: 'id_detalle_venta = ?',
      whereArgs: [detalleVenta.idDetalleVenta],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Detalle_Venta',
      where: 'id_detalle_venta = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteVentaDetalladaByVenta(int ventaId) async {
    final db = await _getDatabase();
    return await db.delete(
      'Detalle_Venta',
      where: 'id_venta = ?',
      whereArgs: [ventaId],
    );
  }
}
