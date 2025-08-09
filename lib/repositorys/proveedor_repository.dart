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
  Proveedor fromMap(Map<String, dynamic> map) => Proveedor.fromMap(map);

  @override
  Map<String, dynamic> toMap(Proveedor entity) => entity.toMap();

  @override
  Future<int> create(Proveedor entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toMap());
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
    return result.map(fromMap).toList();
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
    return fromMap(result.first);
  }

  @override
  Future<int> update(Proveedor entity) async {
    if (entity.id == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toMap(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.id],
    );
  }

  Future<List<Proveedor>> search(String query) async {
    return getAll(
      where: 'nombre LIKE ? OR direccion LIKE ? OR telefono LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%'],
    );
  }
}
