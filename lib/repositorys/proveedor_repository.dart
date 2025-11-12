import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';

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
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toJson());
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
    if (result.isEmpty) throw Exception('Unidad no encontrada');
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
      where: 'LOWER(nombre) LIKE ? OR LOWER(direccion) LIKE ? OR LOWER(telefono) LIKE ? OR LOWER(email) LIKE ?',
      whereArgs: ['%${query.toLowerCase()}%', '%${query.toLowerCase()}%', '%${query.toLowerCase()}%', '%${query.toLowerCase()}%'],
    );
  }
}
