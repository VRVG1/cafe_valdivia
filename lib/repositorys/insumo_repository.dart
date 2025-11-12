import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';

class InsumosRepository implements BaseRepository<Insumo> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Insumo';
  @override
  final String idColumn = 'id_insumo';

  final UnidadMedidaRepository unidadRepo;

  InsumosRepository(this.dbHelper, this.unidadRepo);

  @override
  Insumo fromJson(Map<String, dynamic> map) => Insumo.fromJson(map);

  @override
  Map<String, dynamic> toJson(Insumo entity) => entity.toJson();

  @override
  Future<int> create(Insumo entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toJson());
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);
  }

  @override
  Future<List<Insumo>> getAll({String? where, List<Object?>? whereArgs}) async {
    final result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return result.map(fromJson).toList();
  }

  @override
  Future<Insumo> getById(int id) async {
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
  Future<int> update(Insumo entity) async {
    if (entity.idInsumo == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idInsumo],
    );
  }

  Future<(UnidadMedida, List<Insumo>)> getInsumoByIdUnidad({
    required int idUnidad,
  }) async {
    final List<Map<String, dynamic>> result = await dbHelper.query(
      tableName,
      where: "id_unidad = ?",
      whereArgs: [idUnidad],
    );
    final UnidadMedida unidad = await unidadRepo.getById(idUnidad);
    final List<Insumo> lista = result.map(fromJson).toList();
    return (unidad, lista);
  }

  Future<double> getCostoPromedio(int insumoId) async {
    final db = await dbHelper.database;

    // Obtener el costo promedio ponderado de las utimas compras
    final result = await db.rawQuery(
      '''
      SELECT SUM(dc.cantidad * dc.precio_unitario_compra) / SUM(dc.cantidad) as costo_promedio
      FROM Detalle_Compra dc
      WHERE dc.id_insumo = ?
      AND dc.cantidad > 0
      ''',
      [insumoId],
    );
    return result.first['costo_promedio'] as double? ?? 0.0;
  }
}
