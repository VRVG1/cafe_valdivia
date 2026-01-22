import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';

class ProductoRepository implements BaseRepository<Producto> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Producto';
  @override
  final String idColumn = 'id_producto';

  final InsumosRepository insumoRepo;

  ProductoRepository(this.dbHelper, this.insumoRepo);

  @override
  Producto fromJson(Map<String, dynamic> map) => Producto.fromJson(map);

  @override
  Map<String, dynamic> toJson(Producto entity) => entity.toJson();

  @override
  Future<int> create(Producto entity) async {
    try {
      final db = await dbHelper.database;
      return await db.insert(tableName, entity.toJson());
    } catch (e) {
      // Verificamos si es un error de restricción de base de datos
      if (e.toString().contains('UNIQUE constraint failed')) {
        throw Exception('El nombre del producto ya existe.');
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
  Future<List<Producto>> getAll({
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
  Future<Producto> getById(int id) async {
    final result = await dbHelper.query(
      tableName,
      where: '$idColumn = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) throw Exception('Unidad no encontrada');
    return fromJson(result.first);
  }

  @override
  Future<int> update(Producto entity) async {
    if (entity.idProducto == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idProducto],
    );
  }

  Future<(Insumo, List<Producto>)> getProductoByInsumoId({
    required int idInsumo,
    int? idProducto,
  }) async {
    List<String?> whereInicial = ["idInsumo = ?"];
    List<int?> whereArgs = [idInsumo];

    if (idProducto != null) {
      whereArgs.add(idProducto);
      whereInicial.add("idProducto = ?");
    }
    final String where = whereInicial.join("AND");

    final List<Map<String, dynamic>> result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    final Insumo insumo = await insumoRepo.getById(idInsumo);
    final List<Producto> lista = result.map(fromJson).toList();
    return (insumo, lista);
  }
}
