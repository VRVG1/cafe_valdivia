import "package:cafe_valdivia/models/insumo_producto.dart";
import "package:sqflite/sqflite.dart";

class InsumoProductoHandler {
  final Future<Database> Function() _getDatabase;
  InsumoProductoHandler(this._getDatabase);

  Future<int> insert(InsumoProducto insumoProducto) async {
    final db = await _getDatabase();
    return await db.insert(
      'Insumo_Producto',
      insumoProducto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<InsumoProducto>> get() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Insumo_Producto');
    return List.generate(maps.length, (i) {
      return InsumoProducto.fromMap(maps[i]);
    });
  }

  Future<List<InsumoProducto>> getByProductoId(int productoId) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Insumo_Producto',
      where: 'id_producto = ?',
      whereArgs: [productoId],
    );
    return List.generate(maps.length, (i) {
      return InsumoProducto.fromMap(maps[i]);
    });
  }

  Future<List<InsumoProducto>> getByInsumoId(int insumoId) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Insumo_Producto',
      where: 'id_insumo = ?',
      whereArgs: [insumoId],
    );
    return List.generate(maps.length, (i) {
      return InsumoProducto.fromMap(maps[i]);
    });
  }

  Future<InsumoProducto?> getById(int id) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Insumo_Producto',
      where: 'id_insumo_producto = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return InsumoProducto.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(InsumoProducto insumoProducto) async {
    final db = await _getDatabase();
    return await db.update(
      'Insumo_Producto',
      insumoProducto.toMap(),
      where: 'id_insumo_producto = ?',
      whereArgs: [insumoProducto.idInsumoProducto],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Insumo_Producto',
      where: 'id_insumo_producto = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteInsumoProductoByProductoYInsumo(
    int productoId,
    int insumoId,
  ) async {
    final db = await _getDatabase();
    return await db.delete(
      'Insumo_Producto',
      where: 'id_producto = ? AND id_insumo = ?',
      whereArgs: [productoId, insumoId],
    );
  }
}
