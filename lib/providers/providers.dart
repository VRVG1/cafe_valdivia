import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_producto_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/movimiento_inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/compra_servicio.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/services/inventario_servicio.dart';
import 'package:cafe_valdivia/services/reporte_servicio.dart';
import 'package:cafe_valdivia/services/venta_servicio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
class DatabaseHelper extends _$DatabaseHelper {
  @override
  DatabaseHelper build() {
    return DatabaseHelper();
  }
}

// Repositories
@Riverpod(keepAlive: true)
class ClienteRepository extends _$ClienteRepository {
  @override
  ClienteRepository build() {
    return ClienteRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class UnidadMedidaRepository extends _$UnidadMedidaRepository {
  @override
  UnidadMedidaRepository build() {
    return UnidadMedidaRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class ProveedorRepository extends _$ProveedorRepository {
  @override
  ProveedorRepository build() {
    return ProveedorRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class InsumoRepository extends _$InsumoRepository {
  @override
  InsumoRepository build() {
    return InsumoRepository(
      ref.watch(databaseHelperProvider),
      ref.watch(unidadMedidaRepositoryProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class InsumoProductoRepository extends _$InsumoProductoRepository {
  @override
  InsumoProductoRepository build() {
    return InsumoProductoRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class InventarioRepository extends _$InventarioRepository {
  @override
  InventarioRepository build() {
    return InventarioRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class MovimientoInventarioRepository extends _$MovimientoInventarioRepository {
  @override
  MovimientoInventarioRepository build() {
    return MovimientoInventarioRepository(ref.watch(databaseHelperProvider));
  }
}

@Riverpod(keepAlive: true)
class ProductoRepository extends _$ProductoRepository {
  @override
  ProductoRepository build() {
    return ProductoRepository(
      ref.watch(databaseHelperProvider),
      ref.watch(insumoRepositoryProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class VentaRepository extends _$VentaRepository {
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
class CompraRepository extends _$CompraRepository {
  @override
  CompraRepository build() {
    return CompraRepository(
      ref.watch(databaseHelperProvider),
      ref.watch(proveedorRepositoryProvider),
      ref.watch(insumoRepositoryProvider),
    );
  }
}

// Services
@Riverpod(keepAlive: true)
class InventarioServicio extends _$InventarioServicio {
  @override
  InventarioServicio build() {
    return InventarioServicio(
      dbHelper: ref.watch(databaseHelperProvider),
      compraRepository: ref.watch(compraRepositoryProvider),
      insumoRepository: ref.watch(insumoRepositoryProvider),
      movimientoInventarioRepository: ref.watch(
        movimientoInventarioRepositoryProvider,
      ),
      inventarioRepository: ref.watch(inventarioRepositoryProvider),
      ventaRepository: ref.watch(ventaRepositoryProvider),
      productoRepository: ref.watch(productoRepositoryProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class CompraServicio extends _$CompraServicio {
  @override
  CompraServicio build() {
    return CompraServicio(
      ref.watch(compraRepositoryProvider),
      ref.watch(inventarioServicioProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class VentaServicio extends _$VentaServicio {
  @override
  VentaServicio build() {
    return VentaServicio(
      ref.watch(inventarioServicioProvider),
      ref.watch(ventaRepositoryProvider),
    );
  }
}

@Riverpod(keepAlive: true)
class ReporteServicio extends _$ReporteServicio {
  @override
  ReporteServicio build() {
    return ReporteServicio(
      ref.watch(ventaRepositoryProvider),
      ref.watch(compraRepositoryProvider),
    );
  }
}
