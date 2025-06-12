import 'package:cafe_valdivia/handler/db_helper.dart';
import 'package:cafe_valdivia/models/insumo_producto.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';

class ProdutoRepository implements BaseRepository<Producto> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Producto';
  @override
  final String idColumn = 'id_producto';

  final InsumoRepository insumoRepo;

  ProdutoRepository(this.dbHelper, this.insumoRepo);

  @override
  Producto fromMap(Map<String, dynamic> map) => Producto.fromMap(map);

  @override
  Map<String, dynamic> toMap(Producto entity) => entity.toMap();

  @override
  Future<int> create(Producto entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toMap());
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
    return result.map(fromMap).toList();
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
    return fromMap(result.first);
  }

  @override
  Future<int> update(Producto entity) async {
    if (entity.id == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toMap(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.id],
    );
  }

  Future<Producto> getWithInsumo(int id) async {
    final producto = await getById(id);
    final relaciones = await dbHelper.query(
      'Insumo_Producto',
      where: '$idColumn = ?',
      whereArgs: [id],
    );

    producto.insumos = await Future.wait(
      relaciones.map((relacionesMap) async {
        final relacion = InsumoProducto.fromMap(relacionesMap);
        relacion.insumo = await insumoRepo.getById(relacion.idInsumo);
        return relacion;
      }),
    );
    return producto;
  }
}
