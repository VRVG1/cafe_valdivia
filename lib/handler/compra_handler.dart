import 'package:cafe_valdivia/models/compra.dart';
import 'package:sqflite/sqflite.dart';

class CompraHandler {
  final Future<Database> Function() _getDatabase;
  CompraHandler(this._getDatabase);

  // ========================
  // =   Operaciones Bsicas =
  // ========================

  Future<int> _insert(Compra purchase) async {
    final db = await _getDatabase();
    return await db.insert(
      'Compra',
      purchase.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Compra>> getAll({int? limit, int? offset}) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Compra',
      limit: limit,
      offset: offset,
      orderBy: 'fecha DESC',
    );
    return maps.map((map) => Compra.fromMap(map)).toList();
  }

  Future<Compra?> getById(int id) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Compra',
      where: 'id_compra = ?',
      whereArgs: [id],
      limit: 1,
    );
    return maps.isNotEmpty ? Compra.fromMap(maps.first) : null;
  }

  Future<int> update(Compra compra) async {
    if (compra.idCompra == null) {
      throw ArgumentError('ID de compra no proporcionado');
    }
    final db = await _getDatabase();
    return await db.update(
      'Compra',
      compra.toMap(),
      where: 'id_compra = ?',
      whereArgs: [compra.idCompra],
    );
  }

  Future<int> delete(int id) async {
    final db = await _getDatabase();
    return await db.delete('Compra', where: 'id_compra = ?', whereArgs: [id]);
  }

  Future<int> craeteCompleteCompra(required Compra compra) async {
    if (compra.idProveedor == null) {
      throw ArgumentError('ID de proveedor no proporcionado');
    }

    final db = await _getDatabase();
    int compraId = 0;

    await db.transaction((txn) async {
      //1. insertar compra principal
      compraId = await _insert(compra);
    });
  }

  Future<List<Compra>> getByInsumo(int insumoId) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Compra',
      where: 'id_insumo = ?',
      whereArgs: [insumoId],
      orderBy: 'fecha DESC',
    );
    return List.generate(maps.length, (i) => Compra.fromMap(maps[i]));
  }

  Future<List<Compra>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Compra',
      where: 'fecha BETWEEN ? AND ?',
      whereArgs: [startDate.toIso8601String(), endDate.toIso8601String()],
      orderBy: 'fecha DESC',
    );
    return List.generate(maps.length, (i) => Compra.fromMap(maps[i]));
  }

  Future<List<Compra>> getUnpaid() async {
    final db = await _getDatabase();
    final maps = await db.query(
      'Compra',
      where: 'pagado = ?',
      whereArgs: [0],
      orderBy: 'fecha ASC',
    );
    return List.generate(maps.length, (i) => Compra.fromMap(maps[i]));
  }

  // Marcar compra como pagada
  Future<int> markAsPaid(int id) async {
    final db = await _getDatabase();
    return await db.update(
      'Compra',
      {'pagado': 1},
      where: 'id_compra = ?',
      whereArgs: [id],
    );
  }

  // Calcular el costo promedio de un insumo
  Future<double> calculateAverageCost(int insumoId) async {
    final db = await _getDatabase();
    final result = await db.rawQuery(
      'SELECT AVG(costo_unitario) as promedio FROM Compra WHERE id_insumo = ?',
      [insumoId],
    );
    return result.first['promedio'] as double? ?? 0.0;
  }

  // Obtener el ultimo costo registrado para un insumo
  Future<double> getLastCost(int insumoId) async {
    final db = await _getDatabase();
    final result = await db.rawQuery(
      '''
      SELECT costo_unitario
      FROM Compra
      WHERE id_insumo = ?
      ORDER BY fecha DESC
      LIMIT 1
    ''',
      [insumoId],
    );
    return result.isNotEmpty
        ? result.first['costo_unitario'] as double? ?? 0.0
        : 0.0;
  }

  // Obtener la cantidad total comprada de un insumo
  Future<double> getTotalQuantity(int insumoId) async {
    final db = await _getDatabase();
    final result = await db.rawQuery(
      '''
      SELECT SUM(cantidad) as total
      FROM Compra
      WHERE id_insumo = ?
    ''',
      [insumoId],
    );
    return result.first['total'] as double? ?? 0.0;
  }
}
