import 'package:cafe_valdivia/models/venta.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/inventario_servicio.dart';
import 'package:cafe_valdivia/utils/exceptions.dart';
import 'package:cafe_valdivia/utils/logger.dart';

class VentaServicio {
  final VentaRepository _ventaRepository;
  final InventarioServicio _inventarioServicio;

  VentaServicio(this._inventarioServicio, this._ventaRepository);

  Future<int> registrarVenta(Venta venta) async {
    try {
      // Validar stock antes de registrarVenta
      for (final detalle in venta.detallesVenta) {
        final tieneStock = await _inventarioServicio.verificarStockDisponible(
          detalle.idProducto,
          detalle.cantidad,
        );
        if (!tieneStock) {
          throw StockInsuficienteException(
            "Stock insuficiente en el producto ${detalle.producto!.nombre}",
          );
        }
      }

      // registrarVenta
      final ventaId = await _ventaRepository.createWithDetails(venta);

      // Procesar inventario
      await _inventarioServicio.registrarSalidaPorVenta(ventaId);
      appLogger.i("Se realizo una venta");
      return ventaId;
    } catch (e, stackTrace) {
      appLogger.e("Error registrando venta", error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<double> calcularTotalVenta(int ventaId) async {
    final venta = await _ventaRepository.getFullVenta(ventaId);
    return venta.total;
  }

  Future<void> anularVenta(int ventaId) async {
    //Logica para anular venta y revertir inventario
  }
}
