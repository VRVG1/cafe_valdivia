import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'compra_notifier.g.dart';

@riverpod
class CompraNotifier extends _$CompraNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.watch(compraRepositoryProvider);
    return repo.getAll();
  }

  Future<void> create(Compra compra, List<DetalleCompra> detallesCompra) async {
    await ref
        .read(compraRepositoryProvider)
        .registrarNuevaCompra(compra: compra, detallesCompra: detallesCompra);
    ref.invalidateSelf();
  }

  Future<Map<String, dynamic>> getFullCompra(int idCompra) async {
    return ref.read(compraRepositoryProvider).getFullCompra(idCompra);
    //ref.invalidateSelf();
  }

  Future<void> markAsPaid(int idCompra) async {
    await ref.read(compraRepositoryProvider).markAsPaid(idCompra);
    ref.invalidateSelf();
  }

  Future<void> markAsUnPaid(int idCompra) async {
    await ref.read(compraRepositoryProvider).markAsUnpaid(idCompra);
    ref.invalidateSelf();
  }
}
