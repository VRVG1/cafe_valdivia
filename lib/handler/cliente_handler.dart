import "package:cafe_valdivia/models/cliente.dart";
import "package:sqflite/sqflite.dart";

class ClienteHandler {
  final Future<Database> Function() _getDatabase;
  ClienteHandler(this._getDatabase);

  Future<int> insert(Cliente cliente) async {
    final db = await _getDatabase();
    return await db.insert(
      'Cliente',
      cliente.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Cliente>> get() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Cliente');
    return List.generate(maps.length, (i) {
      return Cliente.fromMap(maps[i]);
    });
  }

  Future<Cliente?> getById(int id) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Cliente',
      where: 'id_cliente = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Cliente.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(Cliente cliente) async {
    final db = await _getDatabase();
    return await db.update(
      'Cliente',
      cliente.toMap(),
      where: 'id_cliente = ?',
      whereArgs: [cliente.idCliente],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete('Cliente', where: 'id_cliente = ?', whereArgs: [id]);
  }
}
