import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';

class UnidadMedidaRepository extends BaseRepository<UnidadMedida> {
  @override
  final DatabaseHelper dbHelper;
  @override
  final String tableName = 'Unidad_Medida';
  @override
  final String idColumn = 'id_unidad';
  @override
  String get entityName => 'Unidad';

  UnidadMedidaRepository(this.dbHelper);

  @override
  UnidadMedida fromJson(Map<String, dynamic> map) => UnidadMedida.fromJson(map);

  @override
  Map<String, dynamic> toJson(UnidadMedida entity) => entity.toJson();

  @override
  int? getId(UnidadMedida entity) => entity.idUnidadMedida;
}
