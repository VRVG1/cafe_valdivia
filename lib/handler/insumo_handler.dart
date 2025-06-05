import "package:cafe_valdivia/models/insumos.dart";
import "package:sqflite/sqflite.dart";

class InsumoHandler {
  final Future<Database> Function() _getDatabase;
  InsumoHandler(this._getDatabase);

  Future<int> insert(Insumos insumo) async {
    final db = await _getDatabase();
    return await db.insert(
      'Insumo',
      insumo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Insumos>> get() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Insumo');
    return List.generate(maps.length, (i) {
      return Insumos.fromMap(maps[i]);
    });
  }

  Future<Insumos?> getById(int id) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Insumo',
      where: 'id_insumo = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Insumos.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(Insumos insumo) async {
    final db = await _getDatabase();
    return await db.update(
      'Insumo',
      insumo.toMap(),
      where: 'id_insumo = ?',
      whereArgs: [insumo.idInsumo],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete('Insumo', where: 'id_insumo = ?', whereArgs: [id]);
  }
}
