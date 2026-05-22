// import 'package:cafe_valdivia/core/models/movimiento_invetario.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
// import 'package:cafe_valdivia/repositorys/movimiento_inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';

class InventarioServicio {
  //  final InventarioRepository inventarioRepository;
  //  //final MovimientoInventarioRepository movimientoInventarioRepository;
  //  //final ArticuloRepository articuloRepository;
  //  final CompraRepository compraRepository;
  //  final VentaRepository ventaRepository;
  //  final ProductoRepository productoRepository;
  //  final DatabaseHelper dbHelper;

  //  InventarioServicio({
  //    required this.compraRepository,
  //    //required this.articuloRepository,
  //    //required this.movimientoInventarioRepository,
  //    required this.inventarioRepository,
  //    required this.ventaRepository,
  //    required this.productoRepository,
  //    required this.dbHelper,
  //  });

  //  /// Registrar una entrada de inventario por compra
  //  Future<void> resgistrarEntradaPorCompra(int compraId) async {
  //    final compra = await compraRepository.getFullCompra(compraId);
  //    for (final detalles in compra.detallesCompra) {
  //      // Registrar movimiento
  //      await movimientoInventarioRepository.registrarMovimiento(
  //        detalles.idArticulo,
  //        TipoMovimiento.entrada,
  //        detalles.cantidad,
  //        'Compra #$compraId',
  //        detalles.id,
  //        null,
  //      );

  //      await inventarioRepository.updateStock(
  //        detalles.idArticulo,
  //        detalles.cantidad,
  //      );
  //    }
  //  }

  //  // Registrar una salida de inventario por venta
  //  Future<void> registrarSalidaPorVenta(int ventaId) async {
  //    final venta = await ventaRepository.getFullVenta(ventaId);

  //    for (final detalle in venta.detallesVenta) {
  //      final producto = await productoRepository.getWithArticulo(
  //        detalle.idProducto,
  //      );

  //      for (final articulo in producto.articulos!) {
  //        final cantidadRequerida = articulo.cantidadRequerida * detalle.cantidad;

  //        // Registrar movimiento
  //        await movimientoInventarioRepository.registrarMovimiento(
  //          articulo.idArticulo,
  //          TipoMovimiento.salida,
  //          cantidadRequerida,
  //          'Venta #$ventaId - ${producto.nombre}',
  //          null,
  //          detalle.id,
  //        );

  //        // Actualizar stock
  //        await inventarioRepository.updateStock(
  //          articulo.idArticulo,
  //          -cantidadRequerida,
  //        );
  //      }
  //    }
  //  }

  //  // Registrar una salida de inventario por venta
  //  Future<void> registrarDevolucionPorVentaAnulada(int ventaId) async {
  //    final venta = await ventaRepository.getFullVenta(ventaId);

  //    for (final detalle in venta.detallesVenta) {
  //      final producto = await productoRepository.getWithArticulo(
  //        detalle.idProducto,
  //      );

  //      for (final articulo in producto.articulos!) {
  //        final cantidadRequerida = articulo.cantidadRequerida * detalle.cantidad;

  //        // Registrar movimiento
  //        await movimientoInventarioRepository.registrarMovimiento(
  //          articulo.idArticulo,
  //          TipoMovimiento.ajusteEntrada,
  //          cantidadRequerida,
  //          'Venta #$ventaId - ${producto.nombre}',
  //          null,
  //          detalle.id,
  //        );

  //        // Actualizar stock
  //        await inventarioRepository.updateStock(
  //          articulo.idArticulo,
  //          cantidadRequerida,
  //        );
  //      }
  //    }
  //  }

  //  // Realizar un ajuste de invetario con registro de motivo
  //  Future<void> registrarAjusteInvetario({
  //    required int articuloId,
  //    required double cantidad,
  //    required String motivo,
  //  }) async {
  //    if (cantidad == 0) return;
  //    final tipo = cantidad > 0
  //        ? TipoMovimiento.ajusteEntrada
  //        : TipoMovimiento.ajusteSalida;

  //    await movimientoInventarioRepository.registrarAjuste(
  //      tipo,
  //      articuloId,
  //      cantidad.abs(),
  //      motivo,
  //    );

  //    await inventarioRepository.updateStock(articuloId, cantidad);
  //  }

  //  // Verificar si hay suficiente stock para un producto
  //  Future<bool> verificarStockDisponible(int productoId, int cantidad) async {
  //    final producto = await productoRepository.getWithArticulo(productoId);

  //    final resultado = await Future.wait(
  //      producto.articulos!.map((articulo) async {
  //        final stock = await inventarioRepository.getStock(articulo.idArticulo);
  //        return stock >= articulo.cantidadRequerida * cantidad;
  //      }),
  //    );
  //    return resultado.every((tieneStock) => tieneStock);
  //  }

  //  /// Calcular el costo actual de produccion de un producto
  //  Future<double> calcularCostoProducto(int productoId) async {
  //    final producto = await productoRepository.getWithArticulo(productoId);

  //    double costoTotal = 0.0;

  //    for (final articulo in producto.articulos!) {
  //      final costoArticulo = await articuloRepository.getCostoPromedio(
  //        articulo.idArticulo,
  //      );
  //      costoTotal += articulo.cantidadRequerida * costoArticulo;
  //    }
  //    return costoTotal;
  //  }
}
