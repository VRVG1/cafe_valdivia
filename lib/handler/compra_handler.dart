import 'package:cafe_valdivia/models/compra.dart';
import 'package:sqflite/sqflite.dart';

class CompraHandler {
  final Future<Database> Function() _getDatabase;
  CompraHandler(this._getDatabase);

  Future<int> insert(Compra purchase) async {
    final db = await _getDatabase();
    return await db.insert(
      'Compra',
      purchase.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Compra>> get() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Compra');
    return List.generate(maps.length, (i) {
      return Compra.fromMap(maps[i]);
    });
  }

  Future<Compra?> getById(int id) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Compra',
      where: 'id_compra = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Compra.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(Compra purchase) async {
    final db = await _getDatabase();
    return await db.update(
      'Compra',
      purchase.toMap(),
      where: 'id_compra = ?',
      whereArgs: [purchase.idCompra],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete('Compra', where: 'id_compra = ?', whereArgs: [id]);
  }
}
