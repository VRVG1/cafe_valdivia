import 'package:sqflite/sqflite.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';

class ProveedorRepository implements BaseRepository<Proveedor> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Proveedor';
  @override
  final String idColumn = 'id_proveedor';

  ProveedorRepository(this.dbHelper);

  @override
  Proveedor fromJson(Map<String, dynamic> map) => Proveedor.fromJson(map);

  @override
  Map<String, dynamic> toJson(Proveedor entity) => entity.toJson();

  @override
  Future<int> create(Proveedor entity) async {
    try {
      final db = await dbHelper.database;
      return await db.insert(tableName, entity.toJson());
    } on DatabaseException catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        appLogger.e(e);
        throw Exception('El email del proveedor ya existe.');
      }
      rethrow;
    }
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);
  }

  @override
  Future<List<Proveedor>> getAll({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return result.map(fromJson).toList();
  }

  @override
  Future<Proveedor> getById(int id) async {
    final result = await dbHelper.query(
      tableName,
      where: '$idColumn = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) throw Exception('Proveedor no encontrado');
    return fromJson(result.first);
  }

  @override
  Future<int> update(Proveedor entity) async {
    if (entity.idProveedor == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idProveedor],
    );
  }

  Future<List<Proveedor>> search(String query) async {
    return getAll(
      where:
          'LOWER(nombre) LIKE ? OR LOWER(direccion) LIKE ? OR LOWER(telefono) LIKE ? OR LOWER(email) LIKE ?',
      whereArgs: [
        '%${query.toLowerCase()}%',
        '%${query.toLowerCase()}%',
        '%${query.toLowerCase()}%',
        '%${query.toLowerCase()}%',
      ],
    );
  }
}
