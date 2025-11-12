import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:sqflite/sqflite.dart';

class CompraRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Compra';
  final String idColumn = 'id_compra';

  final ProveedorRepository proveedorRepo;
  final InsumosRepository insumoRepo;

  CompraRepository(this.dbHelper, this.proveedorRepo, this.insumoRepo);

  Future<int> registrarNuevaCompra({
    required Compra compra,
    required List<DetalleCompra> detallesCompra,
  }) async {
    return await dbHelper.transaction<int>((txn) async {
      // Insertar compra principal
      final Map<String, dynamic> compraMap = compra.toJson();
      if (compraMap.containsKey('pagado') && compraMap['pagado'] is bool) {
        compraMap['pagado'] = (compraMap['pagado'] as bool) ? 1 : 0;
      }
      final int compraId = await txn.insert(
        tableName,
        compraMap,
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );

      // Insertar detalles
      for (final detalle in detallesCompra) {
        final copyDetalleCompra = detalle.toJson();
        copyDetalleCompra['id_compra'] = compraId;

        await txn.insert(
          'Detalle_Compra',
          copyDetalleCompra,
          conflictAlgorithm: ConflictAlgorithm.rollback,
        );
      }

      return compraId;
    });
  }

  Future<Map<String, dynamic>> getFullCompra(int compraId) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'V_Compra_Detallada',
      where: 'id_compra = ?',
      whereArgs: [compraId],
    );

    if (result.isEmpty) {
      throw Exception("No se encontro la compra con el ID: $compraId");
    }

    double total = result.fold(
      0.0,
      (sum, subtotal) => sum + (subtotal['subtotal'] as num),
    );

    final infoCompra = {
      'id_compra': result.first['id_compra'],
      'fecha': result.first['fecha'],
      'detalles': result.first['detalles_compra'],
      'pagado': result.first['pagado'],
      'id_proveedor': result.first['id_proveedor'],
      'nombre_proveedor': result.first['nombre_proveedor'],
    };
    //TODO: Ver una manera de obtener todas las cantidades, precio_unitario_compra y su relacion para una muestra mas detallada valgame dios
    //
    return {
      'compra': infoCompra,
      'detalles': result,
      'total': total.toStringAsFixed(2),
    };
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final maps = await dbHelper.query(tableName, orderBy: 'fecha DESC');
    return await Future.wait(
      maps.map((map) async {
        return await getFullCompra(map['id_compra'] as int);
      }),
    );
  }

  Future<int> markAsPaid(int compraId) async {
    return await dbHelper.transaction((txn) async {
      return await txn.update(
        tableName,
        {'pagado': 1, 'fecha': DateTime.now().toIso8601String()},
        where: '$idColumn = ?',
        whereArgs: [compraId],
      );
    });
  }

  Future<int> markAsUnpaid(int compraId) async {
    return await dbHelper.transaction((txn) async {
      return await txn.update(
        tableName,
        {'pagado': 0, 'fecha': DateTime.now().toIso8601String()},
        where: '$idColumn = ?',
        whereArgs: [compraId],
      );
    });
  }
}
