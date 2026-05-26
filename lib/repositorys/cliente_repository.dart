import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
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
    if (entity.nombre.trim().isEmpty) throw Exception('El nombre no puede estar vacío.');
    if (entity.apellido.trim().isEmpty) throw Exception('El apellido no puede estar vacío.');
    try {
      final db = await dbHelper.database;
      return await db.insert(tableName, entity.toJson());
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        throw Exception('El correo ya existe.');
      }
      throw Exception('Error desconocido al guardar.');
    }
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
    if (result.isEmpty) throw Exception('Cliente no encontrado');
    return fromJson(result.first);
  }

  @override
  Future<int> update(Cliente entity) async {
    if (entity.idCliente == null) throw Exception('ID no puede ser nulo');
    if (entity.nombre.trim().isEmpty) throw Exception('El nombre no puede estar vacío.');
    if (entity.apellido.trim().isEmpty) throw Exception('El apellido no puede estar vacío.');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idCliente],
    );
  }

  Future<List<Cliente>> search(String query) async {
    final pattern = '%$query%';
    return getAll(
      where: 'nombre LIKE ? OR apellido LIKE ? OR telefono LIKE ?',
      whereArgs: [pattern, pattern, pattern],
    );
  }
}
