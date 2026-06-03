import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/repositorys/base_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<int> registrarNuevaReceta({
    required Receta receta,
    required List<RecetaDetalle> detalles,
  }) async {
    return await dbHelper.transaction<int>((txn) async {
      final int recetaId = await txn.insert(
        tableName,
        receta.toJson(),
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );

      for (final detalle in detalles) {
        final copy = detalle.toJson();
        copy['id_receta'] = recetaId;
        await txn.insert(
          'Receta_Detalle',
          copy,
          conflictAlgorithm: ConflictAlgorithm.rollback,
        );
      }

      return recetaId;
    });
  }

  Future<List<RecetaDetalle>> getRecetaDetalles(int recetaId) async {
    final result = await dbHelper.query(
      'Receta_Detalle',
      where: 'id_receta = ?',
      whereArgs: [recetaId],
    );
    return result.map(RecetaDetalle.fromJson).toList();
  }

  Future<void> updateReceta({
    required Receta receta,
    required List<RecetaDetalle> detalles,
  }) async {
    await dbHelper.transaction<void>((txn) async {
      await txn.update(
        tableName,
        receta.toJson(),
        where: '$idColumn = ?',
        whereArgs: [receta.idReceta],
      );

      await txn.delete(
        'Receta_Detalle',
        where: 'id_receta = ?',
        whereArgs: [receta.idReceta],
      );

      for (final detalle in detalles) {
        final copy = detalle.toJson();
        copy['id_receta'] = receta.idReceta;
        await txn.insert(
          'Receta_Detalle',
          copy,
          conflictAlgorithm: ConflictAlgorithm.rollback,
        );
      }
    });
  }
}
