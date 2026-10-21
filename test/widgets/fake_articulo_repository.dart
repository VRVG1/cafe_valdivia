import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';

/// Repositorio de artículos en memoria, para probar la tabla del almacén sin
/// tocar la base de datos.
class FakeArticuloRepository extends ArticuloRepository {
  final List<Articulo> articulos;

  FakeArticuloRepository(this.articulos)
      : super(DatabaseHelper(), UnidadMedidaRepository(DatabaseHelper()));

  @override
  Future<List<Articulo>> getAllInsumos() async => articulos;

  @override
  Future<List<Articulo>> getAll({
    String? where,
    List<Object?>? whereArgs,
  }) async =>
      articulos;
}
