import 'package:cafe_valdivia/core/utils/exceptions.dart';
import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/detalle_venta.dart';
import 'package:cafe_valdivia/core/models/venta.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:sqflite/sqflite.dart';

class VentaRepository extends BaseRepository<Venta> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Venta';
  @override
  final String idColumn = 'id_venta';
  @override
  String get entityName => 'Venta';

  final ClienteRepository clienteRepo;

  VentaRepository(this.dbHelper, this.clienteRepo);

  @override
  Venta fromJson(Map<String, dynamic> map) => Venta.fromJson(map);

  @override
  Map<String, dynamic> toJson(Venta entity) => entity.toJson();

  @override
  int? getId(Venta entity) => entity.idVenta;

  Map<String, dynamic> _ventaToJson(Venta entity) {
    final map = entity.toJson();
    if (map.containsKey('pagado') && map['pagado'] is bool) {
      map['pagado'] = (map['pagado'] as bool) ? 1 : 0;
    }
    return map;
  }

  @override
  Future<int> create(Venta entity) async {
    return await dbHelper.insert(tableName, _ventaToJson(entity));
  }

  @override
  Future<int> update(Venta entity) async {
    if (entity.idVenta == null)
      throw OperacionInvalidaException('ID de venta no puede ser nulo');
    return await dbHelper.update(
      tableName,
      _ventaToJson(entity),
      where: '$idColumn = ?',
      whereArgs: [entity.idVenta],
    );
  }

  Future<int> registrarNuevaVenta({
    required Venta venta,
    required List<DetalleVenta> detallesVenta,
  }) async {
    return await dbHelper.transaction<int>((txn) async {
      final ventaMap = venta.toJson();
      final ventaId = await txn.insert(
        tableName,
        ventaMap,
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );

      for (final DetalleVenta detalle in detallesVenta) {
        final Map<String, dynamic> copyDetalleVenta = detalle.toJson();
        copyDetalleVenta['id_venta'] = ventaId;

        await txn.insert(
          'Detalle_Venta',
          copyDetalleVenta,
          conflictAlgorithm: ConflictAlgorithm.rollback,
        );
      }
      return ventaId;
    });
  }

  Future<Map<String, dynamic>> getFullVenta({required int ventaId}) async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> result = await db.query(
      "V_Venta_Detallada",
      where: 'id_venta = ?',
      whereArgs: [ventaId],
    );

    if (result.isEmpty) {
      throw RegistroNoEncontradoException("Venta con ID: $ventaId");
    }

    double total = result.fold(
      0.0,
      (sum, subtotal) => sum + (subtotal['subtotal'] as num),
    );

    final infoVenta = {
      'id_venta': result.first['id_venta'],
      'fecha': result.first['fecha'],
      'detalles': result.first['detalles_venta'],
      'pagado': result.first['pagado'],
      'id_cliente': result.first['id_cliente'],
      'nombre_cliente': result.first['nombre_cliente'],
      'apellido_cliente': result.first['apellido_cliente'],
    };

    return <String, dynamic>{
      'venta': infoVenta,
      'detalles': result,
      'total': total.toStringAsFixed(2),
    };
  }

  Future<List<Map<String, dynamic>>> getFilteredFullVentas({
    String? start,
    String? end,
    String? pattern,
    String? orderBy,
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    // start ??= DateTime.now().toString();
    // end ??= DateTime.now().toString();
    final db = await dbHelper.database;
    List<Map<String, dynamic>> result;
    if (start != null && end != null && pattern == null) {
      result = await db.query(
        'V_Venta_Detallada',
        where: where ?? '(fecha >= ? AND fecha <= ?)',
        whereArgs: whereArgs ?? [start, end],
        orderBy: orderBy ?? 'fecha DESC',
      );
    } else if (pattern != null && start == null && end == null) {
      result = await db.query(
        'V_Venta_Detallada',
        where:
            where ??
            '(nombre_cliente LIKE ? OR apellido_cliente LIKE ? OR subtotal LIKE ?)',
        whereArgs: whereArgs ?? [pattern, pattern, pattern],
        orderBy: orderBy ?? 'fecha DESC',
      );
    } else {
      result = await db.query(
        'V_Venta_Detallada',
        where:
            where ??
            '(fecha >= ? AND fecha <= ?) AND (nombre_cliente LIKE ? OR apellido_cliente LIKE ? OR subtotal LIKE ?)',
        whereArgs: whereArgs ?? [start, end, pattern, pattern, pattern],
        orderBy: orderBy ?? 'fecha DESC',
      );
    }

    appLogger.d(result);

    if (result.isEmpty) {
      throw RegistroNoEncontradoException("No se encuentran registros");
    }

    final Map<int, List<Map<String, dynamic>>> agrupadas = {};
    for (final row in result) {
      final idVenta = row['id_venta'] as int;
      agrupadas.putIfAbsent(idVenta, () => []).add(row);
    }

    final List<Map<String, dynamic>> ventas = [];
    for (final entry in agrupadas.entries) {
      final rows = entry.value;
      double total = rows.fold(
        0.0,
        (sum, subtotal) => sum + (subtotal['subtotal'] as num),
      );

      final infoVenta = {
        'id_venta': rows.first['id_venta'],
        'fecha': rows.first['fecha'],
        'detalles': rows.first['detalles_venta'],
        'pagado': rows.first['pagado'],
        'id_cliente': rows.first['id_cliente'],
        'nombre_cliente': rows.first['nombre_cliente'],
        'apellido_cliente': rows.first['apellido_cliente'],
      };

      ventas.add({
        'venta': infoVenta,
        'detalles': rows,
        'total': total.toStringAsFixed(2),
      });
    }

    return ventas;
  }

  Future<List<Map<String, dynamic>>> getAllFullVentas() async {
    final maps = await dbHelper.query(tableName, orderBy: 'fecha DESC');
    return await Future.wait(
      maps.map((map) async {
        return await getFullVenta(ventaId: map['id_venta'] as int);
      }),
    );
  }

  Future<int> markAsPaid(int ventaId) async {
    return await dbHelper.update(
      tableName,
      {'pagado': 1},
      where: '$idColumn = ?',
      whereArgs: [ventaId],
    );
  }

  Future<int> markAsUnpaid(int ventaId) async {
    return await dbHelper.update(
      tableName,
      {'pagado': 0},
      where: '$idColumn = ?',
      whereArgs: [ventaId],
    );
  }

  Future<int> markAsNulled(int ventaId) async {
    return await dbHelper.update(
      tableName,
      {'estado': VentaEstado.cancelado.value},
      where: '$idColumn = ?',
      whereArgs: [ventaId],
    );
  }
}
