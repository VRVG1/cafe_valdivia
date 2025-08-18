import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';

class UnidadMedidaRepository implements BaseRepository<UnidadMedida> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Unidad_Medida';
  @override
  final String idColumn = 'id_unidad';

  UnidadMedidaRepository(this.dbHelper);

  @override
  UnidadMedida fromMap(Map<String, dynamic> map) => UnidadMedida.fromMap(map);

  @override
  Map<String, dynamic> toMap(UnidadMedida entity) => entity.toMap();

  @override
  Future<int> create(UnidadMedida entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toMap());
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);
  }

  @override
  Future<List<UnidadMedida>> getAll({
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
  Future<UnidadMedida> getById(int id) async {
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
  Future<int> update(UnidadMedida entity) async {
    if (entity.id == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toMap(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.id],
    );
  }
}
