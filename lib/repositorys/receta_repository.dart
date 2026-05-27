import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/receta.dart';

class RecetaRepository implements BaseRepository<Receta> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Receta';
  @override
  final String idColumn = 'id_receta';

  RecetaRepository(this.dbHelper);

  @override
  Receta fromJson(Map<String, dynamic> map) => Receta.fromJson(map);

  @override
  Map<String, dynamic> toJson(Receta entity) => entity.toJson();

  @override
  Future<int> create(Receta entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toJson());
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);
  }

  @override
  Future<List<Receta>> getAll({
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
  Future<Receta> getById(int id) async {
    final result = await dbHelper.query(
      tableName,
      where: '$idColumn = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) throw Exception('Receta no encontrada');
    return fromJson(result.first);
  }

  @override
  Future<int> update(Receta entity) async {
    if (entity.idReceta == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idReceta],
    );
  }

  Future<List<Receta>> search(String query) async {
    return getAll(
      where: 'LOWER(nombre) LIKE ?',
      whereArgs: ['%${query.toLowerCase()}%'],
    );
  }
}
