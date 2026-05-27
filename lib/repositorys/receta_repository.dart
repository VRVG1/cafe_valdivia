import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/receta.dart';

class RecetaRepository extends BaseRepository<Receta> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Receta';
  @override
  final String idColumn = 'id_receta';

  RecetaRepository(this.dbHelper);

  @override
  Receta fromJson(Map<String, dynamic> map) => Receta.fromJson(map);

  @override
  Map<String, dynamic> toJson(Receta entity) => entity.toJson();

  @override
  int? getId(Receta entity) => entity.idReceta;

  Future<List<Receta>> search(String query) async {
    return getAll(
      where: 'LOWER(nombre) LIKE ?',
      whereArgs: ['%${query.toLowerCase()}%'],
    );
  }
}
