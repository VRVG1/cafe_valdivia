import "package:cafe_valdivia/models/producto.dart";
import "package:sqflite/sqflite.dart";

class ProductoHandler {
  final Future<Database> Function() _getDatabase;
  ProductoHandler(this._getDatabase);

  Future<int> insert(Producto producto) async {
    final db = await _getDatabase();
    return await db.insert(
      'Producto',
      producto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Producto>> get() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Producto');
    return List.generate(maps.length, (i) {
      return Producto.fromMap(maps[i]);
    });
  }

  Future<Producto?> getById(int id) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Producto',
      where: 'id_producto = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Producto.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(Producto producto) async {
    final db = await _getDatabase();
    return await db.update(
      'Producto',
      producto.toMap(),
      where: 'id_producto = ?',
      whereArgs: [producto.idProducto],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Producto',
      where: 'id_producto = ?',
      whereArgs: [id],
    );
  }
}
