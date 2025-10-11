import 'package:cafe_valdivia/models/insumos.dart';
import 'package:cafe_valdivia/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'insumo_providers.g.dart';

@Riverpod(keepAlive: false)
Future<Insumos> insumoDetail(InsumoDetailRef ref, int id) async {
  final repo = ref.watch(insumoRepositoryProvider);
  return repo.getById(id);
}
