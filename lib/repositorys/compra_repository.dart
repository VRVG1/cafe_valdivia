import 'package:cafe_valdivia/handler/db_helper.dart';
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
}
