import 'package:cafe_valdivia/models/detalle_produccion_insumo.dart';
import 'package:cafe_valdivia/models/orden_produccion.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class OrdenProduccionRepository {
  final DatabaseHelper databaseHelper;
  final String tableName = 'Orden_Produccion';
  final String idColumn = 'id_orden_produccion';

  OrdenProduccionRepository(this.databaseHelper);

  Future<int> registrarNuevaProduccion({
    required OrdenProduccion ordenProduccion,
    required List<DetalleProduccionInsumo> detalleProduccionInsumo,
  }) async {
    return await databaseHelper.transaction<int>((txn) async {
      final Map<String, dynamic> ordenProduccionMap = ordenProduccion.toJson();
      final ordenProduccionId = await txn.insert(
        tableName,
        ordenProduccionMap,
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );

      //Insertar detalles
      for (final DetalleProduccionInsumo detalle in detalleProduccionInsumo) {
        final Map<String, dynamic> copyDetalle = detalle.toJson();
        copyDetalle['id_orden_produccion'] = ordenProduccionId;

        await txn.insert(
          tableName,
          copyDetalle,
          conflictAlgorithm: ConflictAlgorithm.rollback,
        );
      }
      return ordenProduccionId;
    });
  }

  Future<Map<String, dynamic>> getFullProduccion({
    required int idOrdenProduccion,
  }) async {
    final Database db = await databaseHelper.database;

    final List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: 'id_orden_produccion = ?',
      whereArgs: [idOrdenProduccion],
    );

    if (result.isEmpty) {
      throw Exception("No se encontro la venta con el ID: $idOrdenProduccion");
    }

    double total = result.fold(
      0.0,
      (sum, subtotal) => sum + double.parse(subtotal['subtotal']),
    ); // Extraemos la info de la orden (será la misma en todas las filas)

    final infoOrden = {
      'id_orden_produccion': result.first['id_orden_produccion'],
      'id_producto': result.first['id_producto'],
      'nombre_producto': result.first['nombre_producto'],
      'cantidad_producida': result.first['cantidad_producida'],
      'fecha': result.first['fecha'],
      'costo_total_produccion':
          result.first['costo_total_produccion'], // El valor guardado
      'notas': result.first['notas'],
    };

    // Los detalles son las propias líneas
    return {
      'orden': infoOrden,
      'detalles': result,
      'costoTotalCalculado': total.toStringAsFixed(2), // El valor calculado
    };
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final List<Map<String, dynamic>> maps = await databaseHelper.query(
      tableName,
      orderBy: 'fecha DESC',
    );
    return await Future.wait(
      maps.map((map) async {
        return await getFullProduccion(
          idOrdenProduccion: map['id_orden_produccion'] as int,
        );
      }),
    );
  }
}
