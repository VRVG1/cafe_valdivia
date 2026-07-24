import 'package:cafe_valdivia/core/utils/exceptions.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
import 'package:cafe_valdivia/services/db_helper.dart';

abstract class BaseRepository<T> {
  DatabaseHelper get dbHelper;
  String get tableName;
  String get idColumn;

  T fromJson(Map<String, dynamic> map);
  Map<String, dynamic> toJson(T entity);

  String get entityName => tableName;
  int? getId(T entity) => null;

  // ===== CREATE =====
  Future<int> create(T entity) async {
    final data = sanitizeMapForDb(toJson(entity));
    data['activo'] = 1;
    data['updated_at'] = DateTime.now().toIso8601String();
    return await dbHelper.insert(tableName, data);
  }

  // ===== GET BY ID (solo activos) =====
  Future<T> getById(int id) async {
    final result = await dbHelper.query(
      tableName,
      where: '$idColumn = ? AND activo = 1',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) throw RegistroNoEncontradoException(entityName);
    return fromJson(result.first);
  }

  // ===== GET ALL (solo activos) =====
  Future<List<T>> getAll({String? where, List<Object?>? whereArgs}) async {
    const String softDeleteFilter = 'activo = 1';
    String? finalWhere;
    List<Object?>? finalWhereArgs;

    if (where != null && where.isNotEmpty) {
      finalWhere = '$softDeleteFilter AND ($where)';
      finalWhereArgs = whereArgs;
    } else {
      finalWhere = softDeleteFilter;
      finalWhereArgs = null;
    }

    final result = await dbHelper.query(
      tableName,
      where: finalWhere,
      whereArgs: finalWhereArgs,
    );
    return result.map(fromJson).toList();
  }

  // ===== GET ALL INCLUIDO ELIMINADOS =====
  Future<List<T>> getAllWithDeleted({String? where, List<Object?>? whereArgs}) async {
    final result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return result.map(fromJson).toList();
  }

  // ===== GET SOLO ELIMINADOS =====
  Future<List<T>> getAllDeleted({String? where, List<Object?>? whereArgs}) async {
    const String deletedFilter = 'activo = 0';
    String? finalWhere;
    List<Object?>? finalWhereArgs;

    if (where != null && where.isNotEmpty) {
      finalWhere = '$deletedFilter AND ($where)';
      finalWhereArgs = whereArgs;
    } else {
      finalWhere = deletedFilter;
      finalWhereArgs = null;
    }

    final result = await dbHelper.query(
      tableName,
      where: finalWhere,
      whereArgs: finalWhereArgs,
    );
    return result.map(fromJson).toList();
  }

  // ===== UPDATE CON TIMESTAMP =====
  Future<int> update(T entity) async {
    final entityId = getId(entity);
    if (entityId == null) {
      throw OperacionInvalidaException('ID no puede ser nulo');
    }
    final data = sanitizeMapForDb(toJson(entity));
    data['updated_at'] = DateTime.now().toIso8601String();
    return await dbHelper.update(
      tableName,
      data,
      where: '$idColumn = ?',
      whereArgs: [entityId],
    );
  }

  // ===== SOFT DELETE =====
  Future<int> delete(int id) async {
    return await dbHelper.update(
      tableName,
      {
        'activo': 0,
        'deleted_at': DateTime.now().toIso8601String(),
      },
      where: '$idColumn = ?',
      whereArgs: [id],
    );
  }

  // ===== RESTAURAR =====
  Future<int> restore(int id) async {
    return await dbHelper.update(
      tableName,
      {
        'activo': 1,
        'deleted_at': null,
      },
      where: '$idColumn = ?',
      whereArgs: [id],
    );
  }

  // ===== ELIMINACIÓN PERMANENTE =====
  Future<int> forceDelete(int id) async {
    try {
      return await dbHelper.delete(
        tableName,
        where: '$idColumn = ?',
        whereArgs: [id],
      );
    } catch (error) {
      appLogger.e(error);
      if (error.toString().contains('FOREIGN KEY constraint failed')) {
        throw RelacionExistenteException(
          'No se puede eliminar porque tiene registros asociados',
        );
      }
      throw UnknowErrorException();
    }
  }
}
