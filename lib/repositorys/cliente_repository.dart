import 'package:cafe_valdivia/services/db_helper.dart';
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
  Cliente fromJson(Map<String, dynamic> map) => Cliente.fromJson(map);

  @override
  Map<String, dynamic> toJson(Cliente entity) => entity.toJson();

  @override
  Future<int> create(Cliente entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toJson());
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
    return result.map(fromJson).toList();
  }

  @override
  Future<Cliente> getById(int id) async {
    final result = await dbHelper.query(
      tableName,
      where: '$idColumn = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) throw Exception('Cliente no encontrada');
    return fromJson(result.first);
  }

  @override
  Future<int> update(Cliente entity) async {
    if (entity.idCliente == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idCliente],
    );
  }

  Future<List<Cliente>> search(String query) async {
    return getAll(
      where: 'nombre LIKE ? OR apellido LIKE ? OR telefono LIKE ?',
      whereArgs: ['%$query', '%$query', '%$query'],
    );
  }
}
