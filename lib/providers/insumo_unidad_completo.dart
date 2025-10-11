// import 'package:cafe_valdivia/models/insumos.dart';
// import 'package:cafe_valdivia/models/unidad_medida.dart';
// import 'package:cafe_valdivia/providers/insumo_providers.dart';
// import 'package:cafe_valdivia/providers/repository_providers.dart';
// import 'package:cafe_valdivia/providers/unidad_medida_providers.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

//InsumoUnidadCompleto
// providers/insumo_completo_providers.dart
//@Riverpod(keepAlive: false)
//Future<Map<String, dynamic>> insumoUnidadCompletoDetail(
//  InsumoUnidadCompletoDetailRef ref,
//  int insumoId,
//) async {
//  final insumo = await ref.watch(insumoDetailProvider(insumoId).future);
//  final unidadMedida = await ref.watch(
//    unidadMedidaDetailProvider(insumo.unidadMedidaId).future,
//  );
//
//  return {'insumo': insumo, 'unidadMedida': unidadMedida};
//}
