import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
//import 'package:cafe_valdivia/repositorys/insumo_producto_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
// import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/compra_servicio.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
// import 'package:cafe_valdivia/services/inventario_servicio.dart';
// import 'package:cafe_valdivia/services/reporte_servicio.dart';
// import 'package:cafe_valdivia/services/venta_servicio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
class DatabaseHelperNotifier extends _$DatabaseHelperNotifier {
  @override
  DatabaseHelper build() {
    return DatabaseHelper();
  }
}

// Repositories
@Riverpod(keepAlive: true)
class ClienteRepositoryNotifier extends _$ClienteRepositoryNotifier {
  @override
  ClienteRepository build() {
    return ClienteRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class UnidadMedidaRepositoryNotifier extends _$UnidadMedidaRepositoryNotifier {
  @override
  UnidadMedidaRepository build() {
    return UnidadMedidaRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class ProveedorRepositoryNotifier extends _$ProveedorRepositoryNotifier {
  @override
  ProveedorRepository build() {
    return ProveedorRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class InsumoRepositoryNotifier extends _$InsumoRepositoryNotifier {
  @override
  InsumosRepository build() {
    return InsumosRepository(
      ref.watch(databaseHelperProvider),
      ref.watch(unidadMedidaRepositoryProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class ProductoRepositoryNotifier extends _$ProductoRepositoryNotifier {
  @override
  ProductoRepository build() {
    return ProductoRepository(
      ref.watch(databaseHelperProvider),
      ref.watch(insumoRepositoryProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class VentaRepositoryNotifier extends _$VentaRepositoryNotifier {
  @override
  VentaRepository build() {
    return VentaRepository(
      ref.watch(databaseHelperProvider),
      ref.watch(productoRepositoryProvider),
      ref.watch(clienteRepositoryProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class CompraRepositoryNotifier extends _$CompraRepositoryNotifier {
  @override
  CompraRepository build() {
    return CompraRepository(
      ref.watch(databaseHelperProvider),
      ref.watch(proveedorRepositoryProvider),
      ref.watch(insumoRepositoryProvider),
    );
  }
}
