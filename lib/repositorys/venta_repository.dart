import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/venta.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';

class VentaRepository {
  final DatabaseHelper dbHelper;
  final String tableName = 'Venta';
  final String idColumn = 'id_venta';

  final ClienteRepository clienteRepo;
  final ProdutoRepository productoRepo;

  VentaRepository(this.dbHelper, this.productoRepo, this.clienteRepo);

  Future<int> createWithDetails(Venta venta) async {
    return await dbHelper.transaction<int>((txn) async {
      // Insert venta principal
      final ventaMap = venta.toMap();
      ventaMap.remove('detalleVenta');
      final ventaId = await txn.insert(tableName, ventaMap);

      //Insert detalleVenta
      for (final detalle in venta.detallesVenta) {
        await txn.insert('Detalle_Venta', {
          ...detalle.toMap(),
          'id_venta': ventaId,
        });
      }
      return ventaId;
    });
  }

  Future<Venta> getFullVenta(int id) async {
    return await dbHelper.transaction((txn) async {
      // Obtener venta principal
      final ventaMap =
          (await txn.query(
            tableName,
            where: '$idColumn = ?',
            whereArgs: [id],
          )).first;

      final venta = Venta.fromMap(ventaMap);

      // Obtener cliente
      venta.cliente = await clienteRepo.getById(venta.idCliente);

      // Obtener detalles
      final detalles = await txn.query(
        'Detalle_Venta',
        where: 'id_venta = ?',
        whereArgs: [id],
      );

      venta.detallesVenta = await Future.wait(
        detalles.map((detMap) async {
          final detalle = DetalleVenta.fromMap(detMap);
          detalle.producto = await productoRepo.getById(detalle.idProducto);
          return detalle;
        }),
      );

      return venta;
    });
  }

  Future<List<Venta>> getVentasByCliente(int clienteId) async {
    final ventas = await dbHelper.query(
      tableName,
      where: 'id_cliente = ?',
      whereArgs: [clienteId],
      orderBy: 'fecha DESC',
    );

    return await Future.wait(
      ventas.map((map) async {
        final venta = Venta.fromMap(map);
        venta.cliente = await clienteRepo.getById(clienteId);
        return venta;
      }),
    );
  }
}
