import 'package:cafe_valdivia/repositorys/compra_repository.dart';

class CompraServicio {
  final CompraRepository _compraRepository;

  CompraServicio(this._compraRepository);

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
  //     return compraId;
  //   } catch (e, stacktrace) {
  //     rethrow;
  //   }
  // }

  // Future<Compra> obtenerCompraCompleta(int compraId) async {
  //   try {
  //     final compra = await _compraRepository.getFullCompra(compraId);
  //     return compra;
  //   } catch (e, stackTrace) {
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
  //       "Se actualizo el pago de una compra: $compraId a pagado: $pagado",
  //     );
  //   } catch (e, stackTrace) {
  //     throw OperacionInvalidaException("Error al actulizar pago: $e");
  //   }
  // }
}
