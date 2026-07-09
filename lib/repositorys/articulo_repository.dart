import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';

class ArticuloRepository extends BaseRepository<Articulo> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Articulo';
  @override
  final String idColumn = 'id_articulo';

  final UnidadMedidaRepository unidadRepo;

  ArticuloRepository(this.dbHelper, this.unidadRepo);

  @override
  Articulo fromJson(Map<String, dynamic> map) => Articulo.fromJson(map);

  @override
  Map<String, dynamic> toJson(Articulo entity) => entity.toJson();

  @override
  int? getId(Articulo entity) => entity.idArticulo;

  // VIEWS
  Future<(UnidadMedida, List<Articulo>)> getArticuloByIdUnidad({
    required int idUnidad,
  }) async {
    final List<Map<String, dynamic>> result = await dbHelper.query(
      tableName,
      where: "id_unidad = ?",
      whereArgs: [idUnidad],
    );
    final UnidadMedida unidad = await unidadRepo.getById(idUnidad);
    final List<Articulo> lista = result.map(fromJson).toList();
    return (unidad, lista);
  }

  Future<double> getCostoPromedio(int articuloId) async {
    final db = await dbHelper.database;

    // Obtener el costo promedio ponderado de las utimas compras
    final result = await db.rawQuery(
      '''
      SELECT SUM(dc.cantidad * dc.precio_unitario_compra) / SUM(dc.cantidad) as costo_promedio
      FROM Detalle_Compra dc
      WHERE dc.id_articulo = ?
      AND dc.cantidad > 0
      ''',
      [articuloId],
    );
    return result.first['costo_promedio'] as double? ?? 0.0;
  }

  Future<List<Articulo>> search(String query) async {
    return getAll(
      where: 'LOWER(nombre) LIKE ? OR LOWER(descripcion) LIKE ?',
      whereArgs: ['%${query.toLowerCase()}%', '%${query.toLowerCase()}%'],
    );
  }

  Future<List<Articulo>> getAllProductos({
    String? where,
    List<Object>? whereArgs,
  }) async {
    return getAll(
      where: where ?? 'tipo = ?',
      whereArgs: whereArgs ?? [ArticuloTipo.producto.value],
    );
  }

  Future<List<Articulo>> getAllInsumos() async {
    return getAll(
      where: 'tipo = ? OR tipo = ?',
      whereArgs: [
        ArticuloTipo.insumo.value,
        ArticuloTipo.productoIntermedio.value,
      ],
    );
  }

  Future<List<Articulo>> searchInsumo({
    String? where,
    List<Object>? whereArgs,
  }) async {
    return getAll(
      where:
          '(tipo = ? OR tipo = ?) AND (nombre LIKE ? OR costo_unitario LIKE ? OR id_unidad LIKE ?)',
      whereArgs: [
        ArticuloTipo.insumo.value,
        ArticuloTipo.productoIntermedio.value,
        ...?whereArgs,
      ],
    );
  }

  Future<List<Articulo>> searchProducto({
    String? where,
    List<Object>? whereArgs,
  }) async {
    return getAllProductos(
      where:
          '(tipo = ?) AND (nombre LIKE ? OR stock LIKE ? OR precio_venta LIKE ? OR id_unidad LIKE ?)',
      whereArgs: [ArticuloTipo.producto.value, ...?whereArgs],
    );
  }
}
