import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/producto.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';

class ProductoRepository extends BaseRepository<Producto> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Producto';
  @override
  final String idColumn = 'id_producto';

  final ArticuloRepository articuloRepo;

  ProductoRepository(this.dbHelper, this.articuloRepo);

  @override
  Producto fromJson(Map<String, dynamic> map) => Producto.fromJson(map);

  @override
  Map<String, dynamic> toJson(Producto entity) => entity.toJson();

  @override
  int? getId(Producto entity) => entity.idProducto;

  @override
  Future<int> create(Producto entity) async {
    try {
      return await super.create(entity);
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        throw Exception('El nombre del producto ya existe.');
      }
      throw Exception('Error desconocido al guardar.');
    }
  }

  Future<(Articulo, List<Producto>)> getProductoByArticuloId({
    required int idArticulo,
    int? idProducto,
  }) async {
    List<String?> whereInicial = ["idArticulo = ?"];
    List<int?> whereArgs = [idArticulo];

    if (idProducto != null) {
      whereArgs.add(idProducto);
      whereInicial.add("idProducto = ?");
    }
    final String where = whereInicial.join("AND");

    final List<Map<String, dynamic>> result = await dbHelper.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    final Articulo articulo = await articuloRepo.getById(idArticulo);
    final List<Producto> lista = result.map(fromJson).toList();
    return (articulo, lista);
  }
}
