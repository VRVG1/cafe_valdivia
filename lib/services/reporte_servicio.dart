import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/movimiento_inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';

class ReporteServicio {
  final InventarioRepository _inventarioRepo;
  final MovimientoInventarioRepository _movimientoRepo;
  final VentaRepository _ventaRepo;
  final CompraRepository _compraRepo;

  ReporteServicio(
    this._inventarioRepo,
    this._movimientoRepo,
    this._ventaRepo,
    this._compraRepo,
  );

  Future<Map<int, double>> generarReporteInventario() async {
    // Lógica para obtener stock de todos los insumos
    return {};
  }

  Future<List<Map<String, dynamic>>> generarReporteMovimientos(
    int insumoId,
  ) async {
    final movimientos = await _movimientoRepo.getByInsumo(insumoId);
    return movimientos.map((m) => m.toMap()).toList();
  }

  Future<Map<String, double>> generarReporteFinanciero() async {
    // Lógica para calcular totales de ventas/compras
    return {'ventas': 0.0, 'compras': 0.0, 'ganancias': 0.0};
  }
}
