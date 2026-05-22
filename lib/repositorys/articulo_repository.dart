import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';

class ArticuloRepository implements BaseRepository<Articulo> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Articulo';
  @override
  final String idColumn = 'id_articulo';

  final UnidadMedidaRepository unidadRepo;

  ArticuloRepository(this.dbHelper, this.unidadRepo);

  @override
  Articulo fromJson(Map<String, dynamic> map) => Articulo.fromJson(map);

  @override
  Map<String, dynamic> toJson(Articulo entity) => entity.toJson();

  @override
  Future<int> create(Articulo entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toJson());
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);
  }

  @override
  Future<List<Articulo>> getAll({
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
  Future<Articulo> getById(int id) async {
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
  Future<int> update(Articulo entity) async {
    if (entity.idArticulo == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idArticulo],
    );
  }

  // VIEWS
  Future<(UnidadMedida, List<Articulo>)> getArticuloByIdUnidad({
    required int idUnidad,
  }) async {
    final List<Map<String, dynamic>> result = await dbHelper.query(
      tableName,
      where: "id_unidad = ?",
      whereArgs: [idUnidad],
    );
    final UnidadMedida unidad = await unidadRepo.getById(idUnidad);
    final List<Articulo> lista = result.map(fromJson).toList();
    return (unidad, lista);
  }

  Future<double> getCostoPromedio(int articuloId) async {
    final db = await dbHelper.database;

    // Obtener el costo promedio ponderado de las utimas compras
    final result = await db.rawQuery(
      '''
      SELECT SUM(dc.cantidad * dc.precio_unitario_compra) / SUM(dc.cantidad) as costo_promedio
      FROM Detalle_Compra dc
      WHERE dc.id_articulo = ?
      AND dc.cantidad > 0
      ''',
      [articuloId],
    );
    return result.first['costo_promedio'] as double? ?? 0.0;
  }

  Future<List<Articulo>> search(String query) async {
    return getAll(
      where: 'LOWER(nombre) LIKE ? OR LOWER(costo_unitario) LIKE ?',

      whereArgs: ['%${query.toLowerCase()}%', '%${query.toLowerCase()}%'],
    );
  }
}
