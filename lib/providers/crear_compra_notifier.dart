import 'package:cafe_valdivia/models/insumo.dart';
import 'package:flutter/foundation.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crear_compra_notifier.g.dart';

// 1. Definimos la clase que representará el estado del formulario
@immutable
class CrearCompraState {
  const CrearCompraState({
    this.proveedor,
    this.items = const [],
    this.total = 0.0,
  });

  final Proveedor? proveedor;
  final List<DetalleCompra> items;
  final double total;

  CrearCompraState copyWith({
    Proveedor? proveedor,
    List<DetalleCompra>? items,
    double? total,
  }) {
    return CrearCompraState(
      proveedor: proveedor ?? this.proveedor,
      items: items ?? this.items,
      total: total ?? this.total,
    );
  }
}

// 2. Creamos el Notifier que gestionará ese estado
@riverpod
class CrearCompraNotifier extends _$CrearCompraNotifier {
  @override
  CrearCompraState build() {
    // Estado inicial del formulario
    return const CrearCompraState();
  }

  void seleccionarProveedor(Proveedor proveedor) {
    state = state.copyWith(proveedor: proveedor);
  }

  void agregarItem(Insumo insumo, double cantidad, double precio) {
    final nuevoDetalle = DetalleCompra(
      idInsumo: insumo.id!,
      insumo: insumo,
      cantidad: cantidad,
      precioUnitarioCompra: precio,
    );

    final nuevosItems = [...state.items, nuevoDetalle];
    final nuevoTotal = _calcularTotal(nuevosItems);

    state = state.copyWith(items: nuevosItems, total: nuevoTotal);
  }

  void eliminarItem(int insumoId) {
    final nuevosItems = state.items
        .where((item) => item.idInsumo != insumoId)
        .toList();
    final nuevoTotal = _calcularTotal(nuevosItems);

    state = state.copyWith(items: nuevosItems, total: nuevoTotal);
  }

  double _calcularTotal(List<DetalleCompra> items) {
    return items.fold(
      0.0,
      (sum, item) => sum + (item.cantidad * item.precioUnitarioCompra),
    );
  }

  Future<void> guardarCompra() async {
    // TODO: Añadir validaciones
    // if (state.proveedor == null) throw Exception('Seleccione un proveedor');
    // if (state.items.isEmpty) throw Exception('Añada al menos un insumo');

    // TODO: Llamar al servicio de compras
    // final compraService = ref.read(compraServiceProvider);
    // await compraService.registrarCompra(state);

    print('Guardando compra...');
    print('Proveedor: ${state.proveedor?.nombre}');
    print('Items: ${state.items.length}');
    print('Total: ${state.total}');

    // Aquí iría la lógica para resetear el estado después de guardar
    // state = const CrearCompraState();
  }
}
