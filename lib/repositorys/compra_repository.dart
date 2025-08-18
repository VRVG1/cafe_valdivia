import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';

class CompraRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Compra';
  final String idColumn = 'id_compra';

  final ProveedorRepository proveedorRepo;
  final InsumoRepository insumoRepo;

  CompraRepository(this.dbHelper, this.proveedorRepo, this.insumoRepo);

  Future<int> createWithDetails(Compra compra) async {
    return await dbHelper.transaction<int>((txn) async {
      // Insertar compra principal
      final compraMap = compra.toMap();
      compraMap.remove('detallesCompra');
      final compraId = await txn.insert(tableName, compraMap);

      // Insertar detalles
      for (final detalle in compra.detallesCompra) {
        await txn.insert('Detalle_Compra', {
          ...detalle.toMap(),
          'id_compra': compraId,
        });
      }

      return compraId;
    });
  }

  Future<void> processCompraInventory(int compraId) async {
    await dbHelper.transaction((txn) async {
      final detalles = await txn.query(
        'Detalle_Compra',
        where: 'id_compra = ?',
        whereArgs: [compraId],
      );

      if (detalles.isEmpty) {
        throw Exception('Compra con ID $compraId no encontrada');
      }

      for (final detMap in detalles) {
        final detalle = DetalleCompra.fromMap(detMap);

        // Registrar movimiento de inventario
        await txn.insert('Movimiento_Inventario', {
          'id_insumo': detalle.idInsumo,
          'tipo': 'Entrada',
          'cantidad': detalle.cantidad,
          'fecha': DateTime.now().toIso8601String(),
          'id_detalle_compra': detalle.id,
        });
      }
    });
  }

  Future<Compra> getFullCompra(int compraId) async {
    final db = await dbHelper.database;
    // Obtener compra principal
    final compraList = (await db.query(
      tableName,
      where: '$idColumn = ?',
      whereArgs: [compraId],
      limit: 1,
    ));
    if (compraList.isEmpty) {
      throw Exception('Compra con ID $compraId no encontrada');
    }
    final compraMap = compraList.first;
    final compra = Compra.fromMap(compraMap);

    // obtener proveedor
    compra.proveedor = await proveedorRepo.getById(compra.idProveedor);

    // Obtener detalles
    final detalles = await db.query(
      'Detalle_Compra',
      where: 'id_compra = ?',
      whereArgs: [compraId],
    );

    compra.detallesCompra = await Future.wait(
      detalles.map((detMap) async {
        final detalle = DetalleCompra.fromMap(detMap);
        detalle.insumo = await insumoRepo.getById(detalle.idInsumo);
        return detalle;
      }),
    );

    return compra;
  }

  Future<List<Compra>> getAll() async {
    final maps = await dbHelper.query(tableName, orderBy: 'fecha DESC');
    return await Future.wait(maps.map((map) async {
      return await getFullCompra(map['id_compra'] as int);
    }));
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
