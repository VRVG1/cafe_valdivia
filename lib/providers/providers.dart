import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper();
}

@Riverpod(keepAlive: true)
ClienteRepository clienteRepository(Ref ref) {
  return ClienteRepository(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
UnidadMedidaRepository unidadMedidaRepository(Ref ref) {
  return UnidadMedidaRepository(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
ProveedorRepository proveedorRepository(Ref ref) {
  return ProveedorRepository(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
InsumosRepository insumosRepository(Ref ref) {
  return InsumosRepository(
    ref.watch(databaseHelperProvider),
    ref.watch(unidadMedidaRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
ProductoRepository productoRepository(Ref ref) {
  return ProductoRepository(
    ref.watch(databaseHelperProvider),
    ref.watch(insumosRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
VentaRepository ventaRepository(Ref ref) {
  return VentaRepository(
    ref.watch(databaseHelperProvider),
    ref.watch(productoRepositoryProvider),
    ref.watch(clienteRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CompraRepository compraRepository(Ref ref) {
  return CompraRepository(
    ref.watch(databaseHelperProvider),
    ref.watch(proveedorRepositoryProvider),
    ref.watch(insumosRepositoryProvider),
  );
}
