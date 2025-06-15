import 'package:cafe_valdivia/models/movimiento_invetario.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/movimiento_inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';

class InventarioServicio {
  final InventarioRepository inventarioRepository;
  final MovimientoInventarioRepository movimientoInventarioRepository;
  final InsumoRepository insumoRepository;
  final CompraRepository compraRepository;
  final VentaRepository ventaRepository;
  final ProdutoRepository produtoRepository;
  final DatabaseHelper dbHelper;

  InventarioServicio({
    required this.compraRepository,
    required this.insumoRepository,
    required this.movimientoInventarioRepository,
    required this.inventarioRepository,
    required this.ventaRepository,
    required this.produtoRepository,
    required this.dbHelper,
  });

  /// Registrar una entrada de inventario por compra
  Future<void> resgistrarEntradaPorCompra(int compraId) async {
    await dbHelper.transaction((txn) async {
      final compra = await compraRepository.getFullCompra(compraId);
      for (final detalles in compra.detallesCompra) {
        // Registrar movimiento
        await movimientoInventarioRepository.registrarMovimiento(
          TipoMovimiento.entrada,
          detalles.idInsumo,
          detalles.cantidad,
          'Compra #$compraId',
          detalles.id,
        );

        await inventarioRepository.updateStock(
          detalles.idInsumo,
          detalles.cantidad,
        );
      }
    });
  }

  // Registrar una salida de inventario por venta
  Future<void> registrarSalidaPorVenta(int ventaId) async {
    final venta = await ventaRepository.getFullVenta(ventaId);

    for (final detalle in venta.detallesVenta) {
      final producto = await produtoRepository.getWithInsumo(
        detalle.idProducto,
      );

      for (final insumo in producto.insumos!) {
        final cantidadRequerida = insumo.cantidadRequerida * detalle.cantidad;

        // Registrar movimiento
        await movimientoInventarioRepository.registrarMovimiento(
          TipoMovimiento.salida,
          insumo.idInsumo,
          cantidadRequerida,
          'Venta #$ventaId - ${producto.nombre}',
          detalle.id,
        );

        // Actualizar stock
        await inventarioRepository.updateStock(
          insumo.idInsumo,
          -cantidadRequerida,
        );
      }
    }
  }

  // Realizar un ajuste de invetario con registro de motivo
  Future<void> registrarAjusteInvetario({
    required int insumoId,
    required double cantidad,
    required String motivo,
  }) async {
    if (cantidad == 0) return;
    final tipo =
        cantidad > 0
            ? TipoMovimiento.ajusteEntrada
            : TipoMovimiento.ajusteSalida;

    await movimientoInventarioRepository.registrarAjuste(
      tipo,
      insumoId,
      cantidad.abs(),
      motivo,
    );

    await inventarioRepository.updateStock(insumoId, cantidad);
  }

  // Verificar si hay suficiente stock para un producto
  Future<bool> verificarStockDisponible(int productoId, int cantidad) async {
    final producto = await produtoRepository.getWithInsumo(productoId);

    final resultado = await Future.wait(
      producto.insumos!.map((insumo) async {
        final stock = await inventarioRepository.getStock(insumo.idInsumo);
        return stock >= insumo.cantidadRequerida * cantidad;
      }),
    );
    return resultado.every((tieneStock) => tieneStock);
  }

  /// Calcular el costo actual de produccion de un producot
  Future<double> calcularCostoProducot(int productoId) async {
    final producto = await produtoRepository.getWithInsumo(productoId);

    double costoTotal = 0.0;

    for (final insumo in producto.insumos!) {
      final costoInsumo = await insumoRepository.getCostoPromedio(
        insumo.idInsumo,
      );
      costoTotal += insumo.cantidadRequerida * costoInsumo;
    }
    return costoTotal;
  }
}
