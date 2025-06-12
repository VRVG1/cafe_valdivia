import "package:cafe_valdivia/models/detalle_venta.dart";
import "package:cafe_valdivia/models/venta.dart";
import "package:sqflite/sqflite.dart";

class VentaHandler {
  final Future<Database> Function() _getDatabase;
  VentaHandler(this._getDatabase);

  // =======================
  // Operaciones de Negocio
  // =======================

  Future<int> createCompleteVenta({
    required Venta venta,
    required List<DetalleVenta> detalles,
  }) async {
    final db = await _getDatabase();
    int ventaId = 0;
    await db.transaction((txn) async {
      // 1. Insertar venta principal
      ventaId = await _insert(venta, txn: txn);

      // 2. Insertar detalles de venta
      for (final detalle in detalles) {
        await _insertDetalleVenta(
          detalle.copyWith(idVenta: ventaId),
          ventaId,
          txn: txn,
        );
        await _refistrarSalidaInventario(
          idProducto: detalle.idProducto,
          cantidad: detalle.cantidad,
          fecha: venta.fecha,
          idVenta: ventaId,
          txn: txn,
        );
      }
    });
    return ventaId;
  }

  // Eliminar venta y todos sus registros relacionados (transacción)
  Future<void> deleteCompleteVenta(int ventaId) async {
    final db = await _getDatabase();

    await db.transaction((txn) async {
      // 1. Eliminar movimientos de inventario relacionados
      await _deleteMovimientosInvetario(ventaId, txn: txn);

      // 2. Eliminar detalles de venta
      await _deleteDetallesVenta(ventaId, txn: txn);

      // 3. Eliminar venta principal
      await _delete(ventaId, txn: txn);
    });
  }

  // Obtener una venta con todos sus detalles e información relacionada
  Future<Map<String, dynamic>> getVentaCompleta(int id) async {
    final db = await _getDatabase();
    // 1. Obtener la venta principal
    final venta = await _getVentaById(id, db);
    if (venta == null) {
      throw Exception('Venta no encontrada');
    }
    //2. Obtener detalles
    final detalles = await getDetallesVenta(id);
    // 3. Calcular total
    final total = await _calcularTotalVenta(id, db);

    return {
      'venta': Venta.fromMap(venta),
      'detalles': detalles,
      'total': total,
    };
  }

  // ===========================
  // = Operaciones de consulta =
  // ===========================

  // Obtener ventas por rango de fechas
  Future<List<Venta>> getByDateRange(DateTime start, DateTime end) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Venta',
      where: 'fecha BETWEEN ? AND ?',
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
      orderBy: 'fecha DESC',
    );
    return List.generate(maps.length, (i) => Venta.fromMap(maps[i]));
  }

  // Obtener ventas de un cliente específico
  Future<List<Venta>> getByCliente(int clienteId) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Venta',
      where: 'id_cliente = ?',
      whereArgs: [clienteId],
      orderBy: 'fecha DESC',
    );
    return List.generate(maps.length, (i) => Venta.fromMap(maps[i]));
  }

  // Obtener ventas pendientes de pago
  Future<List<Venta>> getUnpaid() async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Venta',
      where: 'pagado = ?',
      whereArgs: [0],
      orderBy: 'fecha ASC',
    );
    return List.generate(maps.length, (i) => Venta.fromMap(maps[i]));
  }

  // Obtener detalles de una venta
  Future<List<DetalleVenta>> getDetallesVenta(int ventaId) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Detalle_Venta',
      where: 'id_venta = ?',
      whereArgs: [ventaId],
    );
    return List.generate(maps.length, (i) => DetalleVenta.fromMap(maps[i]));
  }

  // Marcar venta como pagada
  Future<int> markAsPaid(int ventaId) async {
    final db = await _getDatabase();
    return await db.update(
      'Venta',
      {'pagado': 1},
      where: 'id_venta = ?',
      whereArgs: [ventaId],
    );
  }

  // ===================================
  // = Operaciones internas (privadas) =
  // ===================================

  Future<int> _insert(Venta venta, {required Transaction txn}) async {
    return await txn.insert(
      'Venta',
      venta.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<int> _insertDetalleVenta(
    DetalleVenta detalle,
    int ventaId, {
    required Transaction txn,
  }) async {
    return await txn.insert('Detalle_Venta', {
      ...detalle.toMap(),
      'id_venta': ventaId, // Asignar ID de venta generado
    }, conflictAlgorithm: ConflictAlgorithm.fail);
  }

  Future<int> _refistrarSalidaInventario({
    required int idProducto,
    required int cantidad,
    required DateTime fecha,
    required int idVenta,
    required Transaction txn,
  }) async {
    final movimiento = {
      'id_producto': idProducto,
      'tipo': 'Salida',
      'cantidad': cantidad,
      'fecha': fecha.toIso8601String(),
      'id_venta': idVenta,
    };

    return await txn.insert(
      'Movimiento_Producto',
      movimiento,
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<int> _delete(int id, {required Transaction txn}) async {
    return await txn.delete('Venta', where: 'id_venta = ?', whereArgs: [id]);
  }

  Future<int> _deleteDetallesVenta(
    int ventaId, {
    required Transaction txn,
  }) async {
    return await txn.delete(
      'Detalle_Venta',
      where: 'id_venta = ?',
      whereArgs: [ventaId],
    );
  }

  Future<int> _deleteMovimientosInvetario(
    int ventaId, {
    required Transaction txn,
  }) async {
    return await txn.delete(
      'Movimiento_Producto',
      where: 'id_venta = ?',
      whereArgs: [ventaId],
    );
  }

  Future<Map<String, dynamic>?> _getVentaById(int id, Database db) async {
    final result = await db.query(
      'Venta',
      where: 'id_venta = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<double> _calcularTotalVenta(int ventaId, Database db) async {
    final result = await db.rawQuery(
      '''
      SELECT SUM(cantidad * precio_unitario_venta) as total
      FROM Detalle_Venta
      WHERE id_venta = ?
    ''',
      [ventaId],
    );
    return result.first['total'] as double? ?? 0.0;
  }
}
