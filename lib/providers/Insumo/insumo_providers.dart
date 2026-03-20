import 'package:cafe_valdivia/core/models/insumo.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'insumo_providers.g.dart';

@riverpod
class InsumoDetail extends _$InsumoDetail {
  @override
  Future<Insumo> build(int id) async {
    final repo = ref.watch(insumosRepositoryProvider);
    return repo.getById(id);
  }
}
