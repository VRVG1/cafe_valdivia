class VentaServicio {
  // final VentaRepository _ventaRepository;
  // final InventarioServicio _inventarioServicio;

  // VentaServicio(this._inventarioServicio, this._ventaRepository);

  // Future<int> registrarVenta(Venta venta) async {
  //   try {
  //     // Validar stock antes de registrarVenta
  //     for (final detalle in venta.detallesVenta) {
  //       final tieneStock = await _inventarioServicio.verificarStockDisponible(
  //         detalle.idProducto,
  //         detalle.cantidad,
  //       );
  //       if (!tieneStock) {
  //         throw StockInsuficienteException(
  //           "Stock insuficiente en el producto ${detalle.producto!.nombre}",
  //         );
  //       }
  //     }

  //     // registrarVenta
  //     final ventaId = await _ventaRepository.createWithDetails(venta);

  //     // Procesar inventario
  //     await _inventarioServicio.registrarSalidaPorVenta(ventaId);
  //     return ventaId;
  //   } catch (e, stackTrace) {
  //     rethrow;
  //   }
  // }

  // Future<double> calcularTotalVenta(int ventaId) async {
  //   final venta = await _ventaRepository.getFullVenta(ventaId);
  //   return venta.total;
  // }

  // Future<void> anularVenta(int ventaId) async {
  //   try {
  //     final venta = await _ventaRepository.getFullVenta(ventaId);

  //     if (venta.estado == VentaEstado.anulada) {
  //       throw OperacionInvalidaException(
  //         "La venta $ventaId ya ha sido anulada",
  //       );
  //     }
  //     // Revertir el inventario
  //     await _inventarioServicio.registrarDevolucionPorVentaAnulada(ventaId);
  //     // Marcar la venta como anulada en la base de datos
  //     await _ventaRepository.markAsNulled(ventaId);
  //   } on RegistroNoEncontradoException {
  //     rethrow;
  //   } on OperacionInvalidaException {
  //     rethrow;
  //   } catch (e, stackTrace) {
  //       "Error al anular la venta $ventaId",
  //       error: e,
  //       stackTrace: stackTrace,
  //     );
  //     rethrow;
  //   }
  // }
}
