import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/insumo_producto.dart';

class InsumoProductoRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Insumo_Producto';

  InsumoProductoRepository(this.dbHelper);

  Future<int> create(InsumoProducto relacion) async {
    return await dbHelper.insert(tableName, relacion.toMap());
  }

  Future<int> update(InsumoProducto relacion) async {
    if (relacion.id == null) throw Exception('ID no puede ser nulo');
    return await dbHelper.update(
      tableName,
      relacion.toMap(),
      where: 'id_insumo_producto = ?',
      whereArgs: [relacion.id],
    );
  }

  Future<List<InsumoProducto>> getByProducto(int productoId) async {
    final result = await dbHelper.query(
      tableName,
      where: 'id_producto = ?',
      whereArgs: [productoId],
    );
    return result.map((map) => InsumoProducto.fromMap(map)).toList();
  }

  Future<List<InsumoProducto>> getAll({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return result.map(InsumoProducto.fromMap).toList();
  }

  Future<InsumoProducto> getById(int insumoProductoId) async {
    final result = await dbHelper.query(
      tableName,
      where: 'id_insumo_producto = ?',
      whereArgs: [insumoProductoId],
    );
    if (result.isEmpty) throw Exception('Unidad no encontrada');
    return InsumoProducto.fromMap(result.first);
  }

  Future<int> deleteByProducto(int productoId) async {
    return await dbHelper.delete(
      tableName,
      where: 'id_producto = ?',
      whereArgs: [productoId],
    );
  }

  Future<int> delete(int insumoProductoId) async {
    return await dbHelper.delete(
      tableName,
      where: 'id_insumo_producto = ?',
      whereArgs: [insumoProductoId],
    );
  }
}
