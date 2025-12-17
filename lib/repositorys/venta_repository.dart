import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/venta.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:sqflite/sqflite.dart';

class VentaRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Venta';
  final String idColumn = 'id_venta';

  final ClienteRepository clienteRepo;
  final ProductoRepository productoRepo;

  VentaRepository(this.dbHelper, this.productoRepo, this.clienteRepo);

  Future<int> registrarNuevaVenta({
    required Venta venta,
    required List<DetalleVenta> detallesVenta,
  }) async {
    return await dbHelper.transaction<int>((txn) async {
      // Insert venta principal
      final ventaMap = venta.toJson();
      final ventaId = await txn.insert(
        tableName,
        ventaMap,
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );

      //Insert detalleVenta
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
      throw Exception("No se encontro la venta con el ID: $ventaId");
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
    //TODO: Ver una manera de obtener todas las cantidades, precio_unitario_compra y su relacion para una muestra mas detallada valgame dios

    return <String, dynamic>{
      'venta': infoVenta,
      'detalles': result,
      'total': total.toStringAsFixed(2),
    };
  }

  Future<List<Map<String, dynamic>>> getAll() async {
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
