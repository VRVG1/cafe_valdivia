import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/producto.dart';
// import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
// import 'package:cafe_valdivia/repositorys/movimiento_inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';

class ReporteServicio {
  // final InventarioRepository _inventarioRepo;
  // final MovimientoInventarioRepository _movimientoRepo;
  final VentaRepository _ventaRepo;
  final CompraRepository _compraRepo;

  ReporteServicio(
    // this._inventarioRepo,
    // this._movimientoRepo,
    this._ventaRepo,
    this._compraRepo,
  );

  Future<Map<String, dynamic>> ventasDeProducto(
    int productoId,
    DateTime fechaInicio,
    DateTime fechaFin,
  ) async {
    final ventas = await _ventaRepo.getAll();
    final ventasFiltradas =
        ventas.where((venta) {
          return venta.fecha.isAfter(fechaInicio) &&
              venta.fecha.isBefore(fechaFin);
        }).toList();

    final List<DetalleVenta> detallesProducto = [];
    for (var venta in ventasFiltradas) {
      for (var detalle in venta.detallesVenta) {
        if (detalle.idProducto == productoId) {
          detallesProducto.add(detalle);
        }
      }
    }

    final int cantidadTotal = detallesProducto.fold(
      0,
      (sum, item) => sum + item.cantidad,
    );
    final double ventaTotal = detallesProducto.fold(
      0,
      (sum, item) => sum + item.subtotal,
    );

    return {
      'cantidadTotal': cantidadTotal,
      'ventaTotal': ventaTotal,
      'detalles': detallesProducto,
    };
  }

  Future<List<Map<String, dynamic>>> productosMasVendidos(
    DateTime fechaInicio,
    DateTime fechaFin,
  ) async {
    final ventas = await _ventaRepo.getAll();
    final ventasFiltradas =
        ventas.where((venta) {
          return venta.fecha.isAfter(fechaInicio) &&
              venta.fecha.isBefore(fechaFin);
        }).toList();

    final Map<Producto, int> conteoProductos = {};
    for (var venta in ventasFiltradas) {
      for (var detalle in venta.detallesVenta) {
        conteoProductos.update(
          detalle.producto!,
          (value) => value + detalle.cantidad,
          ifAbsent: () => detalle.cantidad,
        );
      }
    }

    final sortedEntries =
        conteoProductos.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries
        .map((entry) => {'producto': entry.key, 'cantidad': entry.value})
        .toList();
  }

  Future<List<Map<String, dynamic>>> productosMenosVendidos(
    DateTime fechaInicio,
    DateTime fechaFin,
  ) async {
    final sortedEntries = await productosMasVendidos(fechaInicio, fechaFin);
    return sortedEntries.reversed.toList();
  }

  Future<Map<String, double>> generarReporteFinanciero(
    DateTime fechaInicio,
    DateTime fechaFin,
  ) async {
    final ventas = await _ventaRepo.getAll();
    final compras = await _compraRepo.getAll();

    final double totalVentas = ventas
        .where(
          (v) => v.fecha.isAfter(fechaInicio) && v.fecha.isBefore(fechaFin),
        )
        .fold(0.0, (sum, v) => sum + v.total);

    final double totalCompras = compras
        .where(
          (c) => c.fecha.isAfter(fechaInicio) && c.fecha.isBefore(fechaFin),
        )
        .fold(0.0, (sum, c) => sum + c.total);

    return {
      'ventas': totalVentas,
      'compras': totalCompras,
      'ganancias': totalVentas - totalCompras,
    };
  }
}
