import 'package:cafe_valdivia/core/utils/exceptions.dart';
import 'package:cafe_valdivia/services/db_helper.dart';

abstract class BaseRepository<T> {
  DatabaseHelper get dbHelper;
  String get tableName;
  String get idColumn;

  T fromJson(Map<String, dynamic> map);
  Map<String, dynamic> toJson(T entity);

  String get entityName => tableName;
  int? getId(T entity) => null;

  Future<int> create(T entity) async {
    return await dbHelper.insert(tableName, toJson(entity));
  }

  Future<T> getById(int id) async {
    final result = await dbHelper.query(
      tableName,
      where: '$idColumn = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) throw RegistroNoEncontradoException(entityName);
    return fromJson(result.first);
  }

  Future<List<T>> getAll({String? where, List<Object?>? whereArgs}) async {
    final result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return result.map(fromJson).toList();
  }

  Future<int> update(T entity) async {
    final entityId = getId(entity);
    if (entityId == null) throw OperacionInvalidaException('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entityId],
    );
  }

  Future<int> delete(int id) async {
    return await dbHelper.delete(
      tableName,
      where: '$idColumn = ?',
      whereArgs: [id],
    );
  }
}
