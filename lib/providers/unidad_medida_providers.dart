import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unidad_medida_providers.g.dart';

@Riverpod(keepAlive: false)
Future<UnidadMedida> unidadMedidaDetail(
  UnidadMedidaDetailRef ref,
  int id,
) async {
  final repo = ref.watch(unidadMedidaRepositoryProvider);
  return repo.getById(id);
}
