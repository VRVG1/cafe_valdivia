import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/models/detalle_compra.dart';
import 'package:cafe_valdivia/models/proveedor.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/services/compra_servicio.dart';
import 'package:cafe_valdivia/services/inventario_servicio.dart';
import 'package:cafe_valdivia/utils/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'compra_servicio_test.mocks.dart';

@GenerateMocks([CompraRepository, InventarioServicio])
void main() {
  late CompraServicio compraServicio;
  late MockCompraRepository mockCompraRepository;
  late MockInventarioServicio mockInventarioServicio;

  setUp(() {
    mockCompraRepository = MockCompraRepository();
    mockInventarioServicio = MockInventarioServicio();
    compraServicio = CompraServicio(mockCompraRepository, mockInventarioServicio);
  });

  group('CompraServicio Tests', () {
    final proveedor = Proveedor(
        id: 1,
        nombre: 'Proveedor Test',
        telefono: '123456789',
        email: 'test@test.com');
    final compra = Compra(
      id: 1,
      fecha: DateTime.now(),
      idProveedor: proveedor.id!,
      proveedor: proveedor,
      pagado: false,
      detallesCompra: [
        DetalleCompra(
            id: 1,
            idInsumo: 1,
            cantidad: 2,
            precioUnitarioCompra: 50.0)
      ],
    );

    group('Pruebas Basicas', () {
      test('registrarCompra - Exito', () async {
        when(mockCompraRepository.createWithDetails(any))
            .thenAnswer((_) async => 1);
        when(mockInventarioServicio.resgistrarEntradaPorCompra(any))
            .thenAnswer((_) async => {});

        final compraId = await compraServicio.registrarCompra(compra);

        expect(compraId, 1);
        verify(mockCompraRepository.createWithDetails(compra)).called(1);
        verify(mockInventarioServicio.resgistrarEntradaPorCompra(1)).called(1);
      });

      test('obtenerCompraCompleta - Exito', () async {
        when(mockCompraRepository.getFullCompra(1))
            .thenAnswer((_) async => compra);

        final result = await compraServicio.obtenerCompraCompleta(1);

        expect(result, compra);
        verify(mockCompraRepository.getFullCompra(1)).called(1);
      });

      test('actulizarEstadoPago - Exito', () async {
        when(mockCompraRepository.markAsPaid(1)).thenAnswer((_) async => 1);
        when(mockCompraRepository.markAsUnpaid(1)).thenAnswer((_) async => 1);

        await compraServicio.actulizarEstadoPago(1, true);
        verify(mockCompraRepository.markAsPaid(1)).called(1);

        await compraServicio.actulizarEstadoPago(1, false);
        verify(mockCompraRepository.markAsUnpaid(1)).called(1);
      });
    });

    group('Pruebas de Robustez', () {
      test(
          'registrarCompra - Falla cuando no hay detalles de compra', () async {
        final compraSinDetalles = Compra(
          id: 1,
          fecha: DateTime.now(),
          idProveedor: proveedor.id!,
          proveedor: proveedor,
          pagado: false,
          detallesCompra: [],
        );

        expect(() => compraServicio.registrarCompra(compraSinDetalles),
            throwsA(isA<OperacionInvalidaException>()));
      });

      test('obtenerCompraCompleta - Falla cuando la compra no existe',
          () async {
        when(mockCompraRepository.getFullCompra(any))
            .thenThrow(Exception('No encontrado'));

        expect(() => compraServicio.obtenerCompraCompleta(999),
            throwsA(isA<RegistroNoEncontradoException>()));
      });

      test('actulizarEstadoPago - Falla', () async {
        when(mockCompraRepository.markAsPaid(any))
            .thenThrow(Exception('Error de base de datos'));

        expect(() => compraServicio.actulizarEstadoPago(1, true),
            throwsA(isA<OperacionInvalidaException>()));
      });
    });
    group('Pruebas de Rendimiento', () {
      test('registrarCompra - Rendimiento', () async {
        when(mockCompraRepository.createWithDetails(any))
            .thenAnswer((_) async => 1);
        when(mockInventarioServicio.resgistrarEntradaPorCompra(any))
            .thenAnswer((_) async {});

        final stopwatch = Stopwatch()..start();
        for (var i = 0; i < 100; i++) {
          await compraServicio.registrarCompra(compra);
        }
        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(1000));
      });
    });
  });
}
