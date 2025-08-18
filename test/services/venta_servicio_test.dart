import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/venta.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/inventario_servicio.dart';
import 'package:cafe_valdivia/services/venta_servicio.dart';
import 'package:cafe_valdivia/utils/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'venta_servicio_test.mocks.dart';

@GenerateMocks([VentaRepository, InventarioServicio])
void main() {
  late VentaServicio ventaServicio;
  late MockVentaRepository mockVentaRepository;
  late MockInventarioServicio mockInventarioServicio;

  setUp(() {
    mockVentaRepository = MockVentaRepository();
    mockInventarioServicio = MockInventarioServicio();
    ventaServicio = VentaServicio(mockInventarioServicio, mockVentaRepository);
  });

  group('VentaServicio Tests', () {
    final venta = Venta(
      id: 1,
      idCliente: 1,
      fecha: DateTime.now(),
      detallesVenta: [
        DetalleVenta(
          id: 1,
          idVenta: 1,
          idProducto: 1,
          cantidad: 2,
          precioUnitarioVenta: 200,
          producto: Producto(id: 1, nombre: 'Cafe', precioVenta: 250),
        ),
      ],
    );

    group('Pruebas Basicas', () {
      test('registrarVenta - Exito', () async {
        when(
          mockInventarioServicio.verificarStockDisponible(any, any),
        ).thenAnswer((_) async => true);
        when(
          mockVentaRepository.createWithDetails(any),
        ).thenAnswer((_) async => 1);
        when(
          mockInventarioServicio.registrarSalidaPorVenta(any),
        ).thenAnswer((_) async => {});

        final ventaId = await ventaServicio.registrarVenta(venta);

        expect(ventaId, 1);
        verify(mockInventarioServicio.verificarStockDisponible(1, 2)).called(1);
        verify(mockVentaRepository.createWithDetails(venta)).called(1);
        verify(mockInventarioServicio.registrarSalidaPorVenta(1)).called(1);
      });

      test('calcularTotalVenta - Exito', () async {
        when(
          mockVentaRepository.getFullVenta(1),
        ).thenAnswer((_) async => venta);

        final total = await ventaServicio.calcularTotalVenta(1);

        expect(total, 400);
      });
    });

    group('Pruebas de Robustez', () {
      test('registrarVenta - Stock insuficiente', () async {
        when(
          mockInventarioServicio.verificarStockDisponible(any, any),
        ).thenAnswer((_) async => false);

        expect(
          () => ventaServicio.registrarVenta(venta),
          throwsA(isA<StockInsuficienteException>()),
        );
      });
    });

    group('Pruebas de Rendimiento', () {
      test('registrarVenta - Rendimiento', () async {
        when(
          mockInventarioServicio.verificarStockDisponible(any, any),
        ).thenAnswer((_) async => true);
        when(
          mockVentaRepository.createWithDetails(any),
        ).thenAnswer((_) async => 1);
        when(
          mockInventarioServicio.registrarSalidaPorVenta(any),
        ).thenAnswer((_) async => {});

        final stopwatch = Stopwatch()..start();
        for (var i = 0; i < 100; i++) {
          await ventaServicio.registrarVenta(venta);
        }
        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(1000));
      });
    });

    group('Pruebas de Regresion', () {
      test('anularVenta - exito', () async {
        final ventaAnular = Venta(
          id: 1,
          idCliente: 1,
          fecha: DateTime.now(),
          estado: VentaEstado.completa,
        );

        when(
          mockVentaRepository.getFullVenta(1),
        ).thenAnswer((_) async => ventaAnular);
        when(
          mockInventarioServicio.registrarDevolucionPorVentaAnulada(1),
        ).thenAnswer((_) async {});
        when(mockVentaRepository.markAsNulled(1)).thenAnswer((_) async => 1);

        await ventaServicio.anularVenta(1);

        verify(mockVentaRepository.getFullVenta(1)).called(1);
        verify(
          mockInventarioServicio.registrarDevolucionPorVentaAnulada(1),
        ).called(1);
        verify(mockVentaRepository.markAsNulled(1)).called(1);
      });

      test('anularVenta - ya anulada', () async {
        final ventaAnulada = Venta(
          id: 1,
          idCliente: 1,
          fecha: DateTime.now(),
          estado: VentaEstado.anulada,
        );

        when(
          mockVentaRepository.getFullVenta(1),
        ).thenAnswer((_) async => ventaAnulada);

        expect(
          () => ventaServicio.anularVenta(1),
          throwsA(isA<OperacionInvalidaException>()),
        );

        verify(mockVentaRepository.getFullVenta(1)).called(1);
      });

      test('anularVenta - no encontrada', () async {
        when(
          mockVentaRepository.getFullVenta(1),
        ).thenThrow(RegistroNoEncontradoException('Venta no encontrada'));

        expect(
          () => ventaServicio.anularVenta(1),
          throwsA(isA<RegistroNoEncontradoException>()),
        );

        verify(mockVentaRepository.getFullVenta(1)).called(1);
      });
    });
  });
}
