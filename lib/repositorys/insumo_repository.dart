import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';

class InsumoRepository implements BaseRepository<Insumos> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Insumo';
  @override
  final String idColumn = 'id_insumo';

  final UnidadMedidaRepository unidadRepo;

  InsumoRepository(this.dbHelper, this.unidadRepo);

  @override
  Insumos fromMap(Map<String, dynamic> map) => Insumos.fromMap(map);

  @override
  Map<String, dynamic> toMap(Insumos entity) => entity.toMap();

  @override
  Future<int> create(Insumos entity) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, entity.toMap());
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);
  }

  @override
  Future<List<Insumos>> getAll({
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
  Future<Insumos> getById(int id) async {
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
  Future<int> update(Insumos entity) async {
    if (entity.id == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      toMap(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.id],
    );
  }

  Future<Insumos> getWithUnidad(int id) async {
    final insumo = await getById(id);
    insumo.unidad = await unidadRepo.getById(insumo.idUnidad);
    return insumo;
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
