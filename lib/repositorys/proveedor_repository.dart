import 'package:sqflite/sqflite.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/core/utils/exceptions.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';

class ProveedorRepository extends BaseRepository<Proveedor> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Proveedor';
  @override
  final String idColumn = 'id_proveedor';

  ProveedorRepository(this.dbHelper);

  @override
  Proveedor fromJson(Map<String, dynamic> map) => Proveedor.fromJson(map);

  @override
  Map<String, dynamic> toJson(Proveedor entity) => entity.toJson();

  @override
  int? getId(Proveedor entity) => entity.idProveedor;

  @override
  Future<int> create(Proveedor entity) async {
    try {
      return await super.create(entity);
    } on DatabaseException catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        appLogger.e(e);
        throw OperacionInvalidaException('El email del proveedor ya existe.');
      }
      rethrow;
    }
  }

  Future<List<Proveedor>> search(String query) async {
    return getAll(
      where:
          'LOWER(nombre) LIKE ? OR LOWER(direccion) LIKE ? OR LOWER(telefono) LIKE ? OR LOWER(email) LIKE ?',
      whereArgs: [
        '%${query.toLowerCase()}%',
        '%${query.toLowerCase()}%',
        '%${query.toLowerCase()}%',
        '%${query.toLowerCase()}%',
      ],
    );
  }
}
