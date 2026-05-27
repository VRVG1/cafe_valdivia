import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';

class ClienteRepository extends BaseRepository<Cliente> {
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
  int? getId(Cliente entity) => entity.idCliente;

  @override
  Future<int> create(Cliente entity) async {
    if (entity.nombre.trim().isEmpty) throw Exception('El nombre no puede estar vacío.');
    if (entity.apellido.trim().isEmpty) throw Exception('El apellido no puede estar vacío.');
    try {
      return await super.create(entity);
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        throw Exception('El correo ya existe.');
      }
      throw Exception('Error desconocido al guardar.');
    }
  }

  @override
  Future<int> update(Cliente entity) async {
    if (entity.nombre.trim().isEmpty) throw Exception('El nombre no puede estar vacío.');
    if (entity.apellido.trim().isEmpty) throw Exception('El apellido no puede estar vacío.');
    return await super.update(entity);
  }

  Future<List<Cliente>> search(String query) async {
    final pattern = '%$query%';
    return getAll(
      where: 'nombre LIKE ? OR apellido LIKE ? OR telefono LIKE ?',
      whereArgs: [pattern, pattern, pattern],
    );
  }
}
