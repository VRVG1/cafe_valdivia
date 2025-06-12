import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:sqflite/sqflite.dart';

class ProveedorHandler {
  final Future<Database> Function() _getDatabase;
  ProveedorHandler(this._getDatabase);

  Future<int> insert(Proveedor proveedor) async {
    final db = await _getDatabase();
    return await db.insert(
      'proveedores',
      proveedor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Proveedor>> getAll({int? limit, int? offest}) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'proveedores',
      limit: limit,
      offset: offest,
      orderBy: 'nombre ASC',
    );
    return maps.map((map) => Proveedor.fromMap(map)).toList();
  }

  Future<int> update(Proveedor proveedor) async {
    if (proveedor.idProveedor == null) {
      throw ArgumentError(
        'El proveedor debe tener un id_proveedor para actualizar',
      );
    }
    final db = await _getDatabase();
    return await db.update(
      'proveedores',
      proveedor.toMap(),
      where: 'id_proveedor = ?',
      whereArgs: [proveedor.idProveedor],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'proveedores',
      where: 'id_proveedor = ?',
      whereArgs: [id],
    );
  }

  Future<List<Proveedor>> buscar(
    String query, {
    int? limit,
    int? offset,
  }) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Proveedor',
      where: 'nombre LIKE ? OR telefono LIKE ? OR email LIKE ?',
      whereArgs: List.filled(4, '%query%'),
      limit: limit,
      offset: offset,
    );
    return maps.map((map) => Proveedor.fromMap(map)).toList();
  }

  Future<int> count() async {
    final db = await _getDatabase();
    final result = await db.rawQuery('SELECT COUNT(*) FROM proveedores');
    return Sqflite.firstIntValue(result) ?? 0;
    // return result.first['total'] as int? ?? 0;
  }
}
