import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unidad_medida_providers.g.dart';

@riverpod
class UnidadMedidaDetail extends _$UnidadMedidaDetail {
  @override
  Future<UnidadMedida> build(int id) async {
    final repo = ref.watch(unidadMedidaRepositoryProvider);
    return repo.getById(id);
  }
}
