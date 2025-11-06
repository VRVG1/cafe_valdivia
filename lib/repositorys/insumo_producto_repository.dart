import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/insumo_producto.dart';

class InsumoProductoRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Insumo_Producto';

  InsumoProductoRepository(this.dbHelper);

  Future<int> create(InsumoProducto relacion) async {
    return await dbHelper.insert(tableName, relacion.toJson());
  }

  Future<int> update(InsumoProducto relacion) async {
    if (relacion.idInsumoProducto == null) {
      throw Exception('ID no puede ser nulo');
    }
    return await dbHelper.update(
      tableName,
      relacion.toJson(),
      where: 'id_insumo_producto = ?',
      whereArgs: [relacion.idInsumoProducto],
    );
  }

  Future<List<InsumoProducto>> getByProducto(int productoId) async {
    final result = await dbHelper.query(
      tableName,
      where: 'id_producto = ?',
      whereArgs: [productoId],
    );
    return result.map((map) => InsumoProducto.fromJson(map)).toList();
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
    return result.map(InsumoProducto.fromJson).toList();
  }

  Future<InsumoProducto> getById(int insumoProductoId) async {
    final result = await dbHelper.query(
      tableName,
      where: 'id_insumo_producto = ?',
      whereArgs: [insumoProductoId],
    );
    if (result.isEmpty) throw Exception('Unidad no encontrada');
    return InsumoProducto.fromJson(result.first);
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
