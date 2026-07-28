import 'package:cafe_valdivia/core/utils/exceptions.dart';
import 'package:cafe_valdivia/core/models/converters.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
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

  final ArticuloRepository articuloRepo;

  OrdenProduccionRepository(this.dbHelper, this.articuloRepo);

  @override
  OrdenProduccion fromJson(Map<String, dynamic> map) =>
      OrdenProduccion.fromJson(map);

  @override
  Map<String, dynamic> toJson(OrdenProduccion entity) => entity.toJson();

  @override
  int? getId(OrdenProduccion entity) => entity.idOrdenProduccion;

  Future<bool> validarStockConsumos(
    List<OrdenProduccionConsumo> consumos,
  ) async {
    for (final consumo in consumos) {
      final articulo = await articuloRepo.getById(consumo.idArticulo);
      if (articulo.stock < consumo.cantidadUsada) {
        return false;
      }
    }
    return true;
  }

  Future<int> registrarOrdenProduccion({
    required OrdenProduccion orden,
    required List<OrdenProduccionConsumo> consumos,
  }) async {
    final stockOk = await validarStockConsumos(consumos);
    if (!stockOk) {
      for (final consumo in consumos) {
        final articulo = await articuloRepo.getById(consumo.idArticulo);
        if (articulo.stock < consumo.cantidadUsada) {
          throw StockInsuficienteException(
            'Stock insuficiente para "${articulo.nombre}" '
            // '(ID: ${articulo.idArticulo}). '
            'Stock actual: ${articulo.stock}, '
            'requerido: ${consumo.cantidadUsada}',
          );
        }
      }
    }

    return await dbHelper.transaction<int>((txn) async {
      final ordenMap = sanitizeMapForDb(orden.toJson());
      ordenMap['activo'] = 1;
      ordenMap['updated_at'] = DateTime.now().toIso8601String();
      final ordenId = await txn.insert(
        tableName,
        ordenMap,
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );

      for (final consumo in consumos) {
        final consumoMap = sanitizeMapForDb(consumo.toJson());
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
    try {
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
        where: 'id_orden_produccion = ? AND activo = 1',
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
    } catch (e) {
      if (e is RegistroNoEncontradoException) rethrow;
      appLogger.e('Error al obtener orden de producción detallada: $e');
      throw UnknowErrorException();
    }
  }

  Future<List<Map<String, dynamic>>> getAllFullOrdenes() async {
    try {
      final db = await dbHelper.database;
      return await db.query('v_produccion_resumen', orderBy: 'fecha DESC');
    } catch (e) {
      appLogger.e('Error al obtener órdenes de producción: $e');
      throw UnknowErrorException();
    }
  }

  Future<List<Map<String, dynamic>>> getAllFullOrdenesSearch({
    String? where,
    List<Object>? whereArgs,
  }) async {
    try {
      final db = await dbHelper.database;
      return await db.query(
        'v_produccion_resumen',
        orderBy: 'fecha DESC',
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      appLogger.e('Error al buscar órdenes de producción: $e');
      throw UnknowErrorException();
    }
  }

  Future<List<OrdenProduccionConsumo>> getConsumosByOrdenId(int ordenId) async {
    try {
      final result = await dbHelper.query(
        'Orden_Produccion_Consumo',
        where: 'id_orden_produccion = ? AND activo = 1',
        whereArgs: [ordenId],
      );
      return result.map((map) => OrdenProduccionConsumo.fromJson(map)).toList();
    } catch (e) {
      appLogger.e('Error al obtener consumos: $e');
      throw UnknowErrorException();
    }
  }

  Future<int> addConsumo(OrdenProduccionConsumo consumo) async {
    try {
      final data = sanitizeMapForDb(consumo.toJson());
      data['activo'] = 1;
      return await dbHelper.insert('Orden_Produccion_Consumo', data);
    } catch (e) {
      appLogger.e('Error al agregar consumo: $e');
      final msg = e.toString();
      if (msg.contains('Stock insuficiente')) {
        throw StockInsuficienteException(msg);
      }
      if (msg.contains('FOREIGN KEY constraint failed')) {
        throw OperacionInvalidaException('El artículo no existe');
      }
      throw UnknowErrorException();
    }
  }

  Future<int> updateConsumo(OrdenProduccionConsumo consumo) async {
    if (consumo.idConsumo == null) {
      throw OperacionInvalidaException('ID de consumo no puede ser nulo');
    }
    try {
      return await dbHelper.update(
        'Orden_Produccion_Consumo',
        consumo.toJson(),
        where: 'id_consumo = ?',
        whereArgs: [consumo.idConsumo],
      );
    } catch (e) {
      appLogger.e('Error al actualizar consumo: $e');
      final msg = e.toString();
      if (msg.contains('Stock insuficiente')) {
        throw StockInsuficienteException(msg);
      }
      throw UnknowErrorException();
    }
  }

  Future<int> deleteConsumo(int idConsumo) async {
    try {
      return await dbHelper.update(
        'Orden_Produccion_Consumo',
        {'activo': 0, 'deleted_at': DateTime.now().toIso8601String()},
        where: 'id_consumo = ?',
        whereArgs: [idConsumo],
      );
    } catch (e) {
      appLogger.e('Error al eliminar consumo: $e');
      throw UnknowErrorException();
    }
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
    try {
      final db = await dbHelper.database;
      List<Map<String, dynamic>> result;
      if (start != null &&
          end != null &&
          (pattern == null || pattern == "%%")) {
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
              '(costo_total_produccion LIKE ? OR producto_producido LIKE ? OR receta LIKE ? OR notas LIKE ?)',
          whereArgs: whereArgs ?? [pattern, pattern, pattern, pattern],
          orderBy: orderBy ?? 'fecha DESC',
        );
      } else {
        result = await db.query(
          'v_produccion_resumen',
          where:
              where ??
              '(fecha >= ? AND fecha <= ?) AND (costo_total_produccion LIKE ? OR producto_producido LIKE ? OR receta LIKE ? OR notas LIKE ?)',
          whereArgs:
              whereArgs ?? [start, end, pattern, pattern, pattern, pattern],
          orderBy: 'fecha DESC',
        );
      }
      if (result.isEmpty) {
        throw RegistroNoEncontradoException("No se encuentran registros");
      }
      return result;
    } catch (e) {
      if (e is RegistroNoEncontradoException) rethrow;
      appLogger.e('Error al filtrar órdenes de producción: $e');
      throw UnknowErrorException();
    }
  }
}
