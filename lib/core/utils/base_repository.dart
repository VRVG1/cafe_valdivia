import 'package:cafe_valdivia/services/db_helper.dart';

abstract class BaseRepository<T> {
  final DatabaseHelper dbHelper;
  final String tableName;
  final String idColumn;

  BaseRepository(this.dbHelper, this.tableName, this.idColumn);

  Future<int> create(T entity);
  Future<T> getById(int id);
  Future<List<T>> getAll({String? where, List<Object?>? whereArgs});
  Future<int> update(T entity);
  Future<int> delete(int id);

  T fromJson(Map<String, dynamic> map);
  Map<String, dynamic> toJson(T entity);
}
