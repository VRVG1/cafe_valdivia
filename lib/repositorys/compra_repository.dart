import 'package:cafe_valdivia/core/utils/logger.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:sqflite/sqflite.dart';

class CompraRepository implements BaseRepository<Compra> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Compra';
  @override
  final String idColumn = 'id_compra';

  final ProveedorRepository proveedorRepo;
  final ArticuloRepository articuloRepo;

  CompraRepository(this.dbHelper, this.proveedorRepo, this.articuloRepo);
  @override
  Compra fromJson(Map<String, dynamic> map) => Compra.fromJson(map);

  @override
  Map<String, dynamic> toJson(Compra entity) => entity.toJson();

  @override
  Future<int> create(Compra entity) async {
    return 0;
  }

  @override
  Future<int> delete(int id) async {
    return 0;
  }

  @override
  Future<List<Compra>> getAll({String? where, List<Object?>? whereArgs}) async {
    final result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return result.map(fromJson).toList();
  }

  @override
  Future<Compra> getById(int id) async {
    return Compra(idProveedor: 0, fecha: DateTime.now());
  }

  @override
  Future<int> update(Compra entity) async {
    return 0;
  }

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

    final firstRow = result.first;

    return {
      'id_compra': firstRow['id_compra'],
      'fecha': firstRow['fecha'],
      'pagado': firstRow['pagado'],
      'nombre_proveedor': firstRow['nombre_proveedor'],
      'total': total.toStringAsFixed(2),
      // Pasamos el resultado completo como los "detalles"
      'detalles': result,
    };
  }

  Future<List<Map<String, dynamic>>> getAllDetalles() async {
    final maps = await dbHelper.query(tableName, orderBy: 'fecha DESC');
    return await Future.wait(
      maps.map((map) async {
        return await getFullCompra(map['id_compra'] as int);
      }),
    );
  }

  Future<List<Compra>> getAllOnlyCompra({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return result.map(fromJson).toList();
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

  Future<List<Map<String, dynamic>>> getAllNombreProveedor({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await dbHelper.database;

    // Obtener el costo promedio ponderado de las utimas compras
    // final result = await db.rawQuery('''
    //   SELECT c.*, p.nombre AS nombreProveedor FROM $tableName AS c INNER JOIN proveedor AS p ON c.id_proveedor = p.id_proveedor ${where != null ? 'WHERE $where' : ''}
    //   ''');
    final List<Map<String, dynamic>> result = await db.query("v_compras_list");
    appLogger.i(result);
    return List<Map<String, dynamic>>.from(result);
  }
}
