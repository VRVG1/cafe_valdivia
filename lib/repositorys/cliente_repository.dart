import 'package:cafe_valdivia/handler/db_helper.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';

class ClienteRepository implements BaseRepository<Cliente> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Cliente';
  @override
  final String idColumn = 'id_cliente';

  ClienteRepository(this.dbHelper);

  @override
  Cliente fromMap(Map<String, dynamic> map) => Cliente.fromMap(map);

  @override
  Map<String, dynamic> toMap(Cliente entity) => entity.toMap();

  @override
  Future<int> create(Cliente entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toMap());
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);
  }

  @override
  Future<List<Cliente>> getAll({
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
  Future<Cliente> getById(int id) async {
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
  Future<int> update(Cliente entity) async {
    if (entity.id == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toMap(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.id],
    );
  }

  Future<List<Cliente>> search(String query) async {
    return getAll(
      where: 'nombre LIKE ? OR apellido LIKE ? OR telefono LIKE ?',
      whereArgs: ['%@query', '%@query', '%@query'],
    );
  }
}
