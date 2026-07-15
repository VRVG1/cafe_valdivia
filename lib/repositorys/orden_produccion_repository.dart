import 'package:cafe_valdivia/core/utils/exceptions.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/orden_produccion.dart';
import 'package:cafe_valdivia/core/models/orden_produccion_consumo.dart';
import 'package:sqflite/sqflite.dart';

class OrdenProduccionRepository extends BaseRepository<OrdenProduccion> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Orden_Produccion';
  @override
  final String idColumn = 'id_orden_produccion';

  OrdenProduccionRepository(this.dbHelper);

  @override
  OrdenProduccion fromJson(Map<String, dynamic> map) =>
      OrdenProduccion.fromJson(map);

  @override
  Map<String, dynamic> toJson(OrdenProduccion entity) => entity.toJson();

  @override
  int? getId(OrdenProduccion entity) => entity.idOrdenProduccion;

  Future<int> registrarOrdenProduccion({
    required OrdenProduccion orden,
    required List<OrdenProduccionConsumo> consumos,
  }) async {
    return await dbHelper.transaction<int>((txn) async {
      final ordenMap = orden.toJson();
      final ordenId = await txn.insert(
        tableName,
        ordenMap,
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );

      for (final consumo in consumos) {
        final consumoMap = consumo.toJson();
        consumoMap['id_orden_produccion'] = ordenId;
        await txn.insert(
          'Orden_Produccion_Consumo',
          consumoMap,
          conflictAlgorithm: ConflictAlgorithm.rollback,
        );
      }
      return ordenId;
    });
  }

  Future<Map<String, dynamic>> getFullOrdenProduccion(
    int ordenProduccionId,
  ) async {
    final db = await dbHelper.database;
    final result = await db.query(
      'v_produccion_resumen',
      where: 'id_orden_produccion = ?',
      whereArgs: [ordenProduccionId],
    );

    if (result.isEmpty) {
      throw RegistroNoEncontradoException(
        'Orden de producción con ID: $ordenProduccionId',
      );
    }

    final consumos = await db.query(
      'Orden_Produccion_Consumo',
      where: 'id_orden_produccion = ?',
      whereArgs: [ordenProduccionId],
    );

    final firstRow = result.first;
    return {
      'id_orden_produccion': firstRow['id_orden_produccion'],
      'fecha': firstRow['fecha'],
      'cantidad_producida': firstRow['cantidad_producida'],
      'costo_total_produccion': firstRow['costo_total_produccion'],
      'notas': firstRow['notas'],
      'receta': firstRow['receta'],
      'producto_producido': firstRow['producto_producido'],
      'cantidad_insumos_diferentes': firstRow['cantidad_insumos_diferentes'],
      'total_unidades_consumidas': firstRow['total_unidades_consumidas'],
      'costo_real_calculado': firstRow['costo_real_calculado'],
      'consumos': consumos,
    };
  }

  Future<List<Map<String, dynamic>>> getAllFullOrdenes() async {
    final db = await dbHelper.database;
    return await db.query('v_produccion_resumen', orderBy: 'fecha DESC');
  }

  Future<List<Map<String, dynamic>>> getAllFullOrdenesSearch({
    String? where,
    List<Object>? whereArgs,
  }) async {
    final db = await dbHelper.database;
    return await db.query(
      'v_produccion_resumen',
      orderBy: 'fecha DESC',
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<List<OrdenProduccionConsumo>> getConsumosByOrdenId(int ordenId) async {
    final result = await dbHelper.query(
      'Orden_Produccion_Consumo',
      where: 'id_orden_produccion = ?',
      whereArgs: [ordenId],
    );
    return result.map((map) => OrdenProduccionConsumo.fromJson(map)).toList();
  }

  Future<int> addConsumo(OrdenProduccionConsumo consumo) async {
    return await dbHelper.insert('Orden_Produccion_Consumo', consumo.toJson());
  }

  Future<int> updateConsumo(OrdenProduccionConsumo consumo) async {
    if (consumo.idConsumo == null) {
      throw OperacionInvalidaException('ID de consumo no puede ser nulo');
    }
    return await dbHelper.update(
      'Orden_Produccion_Consumo',
      consumo.toJson(),
      where: 'id_consumo = ?',
      whereArgs: [consumo.idConsumo],
    );
  }

  Future<int> deleteConsumo(int idConsumo) async {
    return await dbHelper.delete(
      'Orden_Produccion_Consumo',
      where: 'id_consumo = ?',
      whereArgs: [idConsumo],
    );
  }

  Future<List<OrdenProduccion>> searchByNotas(String query) async {
    return getAll(
      where: 'LOWER(notas) LIKE ?',
      whereArgs: ['%${query.toLowerCase()}%'],
    );
  }

  Future<List<Map<String, dynamic>>> getByDateRange({
    String? start,
    String? end,
    String? pattern,
    String? orderBy,
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    final db = await dbHelper.database;
    List<Map<String, dynamic>> result;
    if (start != null && end != null && pattern == "%%") {
      result = await db.query(
        'v_produccion_resumen',
        where: where ?? '(fecha >= ? AND fecha <= ?)',
        whereArgs: whereArgs ?? [start, end],
        orderBy: orderBy ?? 'fecha DESC',
      );
    } else if (pattern != null && start == null && end == null) {
      result = await db.query(
        'v_produccion_resumen',
        where:
            where ??
            '(costo_total_produccion LIKE ? OR producto_producido LIKE ?)',
        whereArgs: whereArgs ?? [pattern, pattern],
        orderBy: orderBy ?? 'fecha DESC',
      );
    } else {
      result = await db.query(
        'v_produccion_resumen',
        where:
            where ??
            '(fecha >= ? AND fecha <= ?) AND (costo_total_produccion LIKE ? OR producto_producido LIKE ?)',
        whereArgs: whereArgs ?? [start, end, pattern, pattern],
        orderBy: 'fecha DESC',
      );
    }
    if (result.isEmpty) {
      throw RegistroNoEncontradoException("No se encuentran registros");
    }
    return result;
  }
}
