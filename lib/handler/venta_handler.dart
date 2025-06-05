import "package:cafe_valdivia/models/venta.dart";
import "package:sqflite/sqflite.dart";

class VentaHandler {
  final Future<Database> Function() _getDatabase;
  VentaHandler(this._getDatabase);

  Future<int> insert(Venta sale) async {
    final db = await _getDatabase();
    return await db.insert(
      'Venta',
      sale.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Venta>> get() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Venta');
    return List.generate(maps.length, (i) {
      return Venta.fromMap(maps[i]);
    });
  }

  Future<Venta?> getById(int id) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Venta',
      where: 'id_venta = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Venta.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(Venta sale) async {
    final db = await _getDatabase();
    return await db.update(
      'Venta',
      sale.toMap(),
      where: 'id_venta = ?',
      whereArgs: [sale.idVenta],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete('Venta', where: 'id_venta = ?', whereArgs: [id]);
  }
}
