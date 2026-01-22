import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/services/inventario_servicio.dart';
import 'package:cafe_valdivia/utils/exceptions.dart';
import 'package:cafe_valdivia/utils/logger.dart';

class CompraServicio {
  final CompraRepository _compraRepository;
  final InventarioServicio _inventarioServicio;

  CompraServicio(this._compraRepository, this._inventarioServicio);

  // Future<int> registrarCompra(Compra compra) async {
  //   try {
  //     // Validar detalles de compra
  //     // if (compra.detallesCompra.isEmpty) {
  //     //   throw OperacionInvalidaException(
  //     //     'La compra debe contener al menos un detalle',
  //     //   );
  //     // }

  //     final compraId = await _compraRepository.registrarNuevaCompra(compra);

  //     await _inventarioServicio.resgistrarEntradaPorCompra(compraId);
  //     appLogger.i("Se registro una compra");
  //     return compraId;
  //   } catch (e, stacktrace) {
  //     appLogger.e('Error registrando compra', error: e, stackTrace: stacktrace);
  //     rethrow;
  //   }
  // }

  // Future<Compra> obtenerCompraCompleta(int compraId) async {
  //   try {
  //     appLogger.i("Se consulto una compra con el id: $compraId");
  //     final compra = await _compraRepository.getFullCompra(compraId);
  //     return compra;
  //   } catch (e, stackTrace) {
  //     appLogger.e(
  //       "Error al obtener la compra: $compraId",
  //       error: e,
  //       stackTrace: stackTrace,
  //     );
  //     throw RegistroNoEncontradoException("Compra $compraId");
  //   }
  // }

  // Future<void> actulizarEstadoPago(int compraId, bool pagado) async {
  //   try {
  //     if (pagado) {
  //       await _compraRepository.markAsPaid(compraId);
  //     } else {
  //       await _compraRepository.markAsUnpaid(compraId);
  //     }
  //     appLogger.i(
  //       "Se actualizo el pago de una compra: $compraId a pagado: $pagado",
  //     );
  //   } catch (e, stackTrace) {
  //     appLogger.e("Error al actualizar pago", error: e, stackTrace: stackTrace);
  //     throw OperacionInvalidaException("Error al actulizar pago: $e");
  //   }
  // }
}
