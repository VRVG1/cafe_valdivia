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
      where: 'id_insumo_producot = ?',
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

  Future<int> deleteByProducto(int productoId) async {
    return await dbHelper.delete(
      tableName,
      where: 'id_producto = ?',
      whereArgs: [productoId],
    );
  }
}
