// import 'package:cafe_valdivia/core/models/articulos.dart';
// import 'package:cafe_valdivia/core/models/unidad_medida.dart';
// import 'package:cafe_valdivia/providers/articulo_providers.dart';
// import 'package:cafe_valdivia/providers/repository_providers.dart';
// import 'package:cafe_valdivia/providers/unidad_medida_providers.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

//ArticuloUnidadCompleto
// providers/articulo_completo_providers.dart
//@Riverpod(keepAlive: false)
//Future<Map<String, dynamic>> articuloUnidadCompletoDetail(
//  ArticuloUnidadCompletoDetailRef ref,
//  int articuloId,
//) async {
//  final articulo = await ref.watch(articuloDetailProvider(articuloId).future);
//  final unidadMedida = await ref.watch(
//    unidadMedidaDetailProvider(articulo.unidadMedidaId).future,
//  );
//
//  return {'articulo': articulo, 'unidadMedida': unidadMedida};
//}
