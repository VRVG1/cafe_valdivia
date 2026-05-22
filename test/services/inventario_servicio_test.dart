import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/models/detalle_venta.dart';
import 'package:cafe_valdivia/core/models/articulo_producto.dart';
import 'package:cafe_valdivia/core/models/producto.dart';
import 'package:cafe_valdivia/core/models/venta.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/inventario_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/services/inventario_servicio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'inventario_servicio_test.mocks.dart';

@GenerateMocks([
  InventarioRepository,
  ArticuloRepository,
  CompraRepository,
  VentaRepository,
  ProductoRepository,
  DatabaseHelper,
])
void main() {
  late InventarioServicio inventarioServicio;
  late MockArticuloRepository mockArticuloRepository;
  late MockCompraRepository mockCompraRepository;
  late MockVentaRepository mockVentaRepository;
  late MockProductoRepository mockProductoRepository;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockInventarioRepository = MockInventarioRepository();
    mockMovimientoInventarioRepository = MockMovimientoInventarioRepository();
    mockArticuloRepository = MockArticuloRepository();
    mockCompraRepository = MockCompraRepository();
    mockVentaRepository = MockVentaRepository();
    mockProductoRepository = MockProductoRepository();
    mockDatabaseHelper = MockDatabaseHelper();

    inventarioServicio = InventarioServicio(
      inventarioRepository: mockInventarioRepository,
      movimientoInventarioRepository: mockMovimientoInventarioRepository,
      articuloRepository: mockArticuloRepository,
      compraRepository: mockCompraRepository,
      ventaRepository: mockVentaRepository,
      productoRepository: mockProductoRepository,
      dbHelper: mockDatabaseHelper,
    );
  });

  group('InventarioServicio Tests', () {
    final compra = Compra(
      id: 1,
      id_proveedor: 1,
      fecha: DateTime.now(),
      detallesCompra: [
        DetalleCompra(
          id: 1,
          idArticulo: 1,
          cantidad: 10.0,
          precioUnitarioCompra: 100.0,
        ),
      ],
    );
    final venta = Venta(
      id: 1,
      idCliente: 1,
      fecha: DateTime.now(),
      detallesVenta: [
        DetalleVenta(
          id: 1,
          idVenta: 1,
          idArticulo: 1,
          cantidad: 2.0,
          precioUnitarioVenta: 200.0,
        ),
      ],
    );
    final producto = Producto(
      id: 1,
      nombre: 'Cafe',
      precioVenta: 250.0,
      articulos: [
        ArticuloProducto(idArticulo: 1, idProducto: 1, cantidadRequerida: 1.0),
      ],
    );

    group('Pruebas Basicas', () {
      test('resgistrarEntradaPorCompra - Exito', () async {
        when(
          mockCompraRepository.getFullCompra(1),
        ).thenAnswer((_) async => compra);

        await inventarioServicio.resgistrarEntradaPorCompra(1);

        verify(
          mockMovimientoInventarioRepository.registrarMovimiento(
            1,
            TipoMovimiento.entrada,
            10,
            'Compra #1',
            1,
            null,
          ),
        ).called(1);
        verify(mockInventarioRepository.updateStock(1, 10)).called(1);
      });

      test('registrarSalidaPorVenta - Exito', () async {
        when(
          mockVentaRepository.getFullVenta(1),
        ).thenAnswer((_) async => venta);
        when(
          mockProductoRepository.getWithArticulo(1),
        ).thenAnswer((_) async => producto);

        await inventarioServicio.registrarSalidaPorVenta(1);

        verify(
          mockMovimientoInventarioRepository.registrarMovimiento(
            1,
            TipoMovimiento.salida,
            2,
            'Venta #1 - Cafe',
            null,
            1,
          ),
        ).called(1);
        verify(mockInventarioRepository.updateStock(1, -2)).called(1);
      });

      test('registrarAjusteInvetario - Entrada', () async {
        await inventarioServicio.registrarAjusteInvetario(
          articuloId: 1,
          cantidad: 5,
          motivo: 'Ajuste',
        );

        verify(
          mockMovimientoInventarioRepository.registrarAjuste(
            TipoMovimiento.ajusteEntrada,
            1,
            5,
            'Ajuste',
          ),
        ).called(1);
        verify(mockInventarioRepository.updateStock(1, 5)).called(1);
      });

      test('registrarAjusteInvetario - Salida', () async {
        await inventarioServicio.registrarAjusteInvetario(
          articuloId: 1,
          cantidad: -5,
          motivo: 'Ajuste',
        );

        verify(
          mockMovimientoInventarioRepository.registrarAjuste(
            TipoMovimiento.ajusteSalida,
            1,
            5,
            'Ajuste',
          ),
        ).called(1);
        verify(mockInventarioRepository.updateStock(1, -5)).called(1);
      });

      test('verificarStockDisponible - Hay stock', () async {
        when(
          mockProductoRepository.getWithArticulo(1),
        ).thenAnswer((_) async => producto);
        when(mockInventarioRepository.getStock(1)).thenAnswer((_) async => 10);

        final result = await inventarioServicio.verificarStockDisponible(1, 5);

        expect(result, isTrue);
      });

      test('calcularCostoProducto - Exito', () async {
        when(
          mockProductoRepository.getWithArticulo(1),
        ).thenAnswer((_) async => producto);
        when(
          mockArticuloRepository.getCostoPromedio(1),
        ).thenAnswer((_) async => 150);

        final result = await inventarioServicio.calcularCostoProducto(1);

        expect(result, 150);
      });
    });

    group('Pruebas de Robustez', () {
      test('registrarAjusteInvetario - Cantidad es 0', () async {
        await inventarioServicio.registrarAjusteInvetario(
          articuloId: 1,
          cantidad: 0,
          motivo: 'Ajuste',
        );

        verifyNever(
          mockMovimientoInventarioRepository.registrarAjuste(
            any,
            any,
            any,
            any,
          ),
        );
        verifyNever(mockInventarioRepository.updateStock(any, any));
      });

      test('verificarStockDisponible - No hay stock', () async {
        when(
          mockProductoRepository.getWithArticulo(1),
        ).thenAnswer((_) async => producto);
        when(mockInventarioRepository.getStock(1)).thenAnswer((_) async => 2);

        final result = await inventarioServicio.verificarStockDisponible(1, 5);

        expect(result, isFalse);
      });
    });

    group('Pruebas de Rendimiento', () {
      test('verificarStockDisponible - Rendimiento', () async {
        when(
          mockProductoRepository.getWithArticulo(1),
        ).thenAnswer((_) async => producto);
        when(
          mockInventarioRepository.getStock(1),
        ).thenAnswer((_) async => 1000);

        final stopwatch = Stopwatch()..start();
        for (var i = 0; i < 100; i++) {
          await inventarioServicio.verificarStockDisponible(1, 5);
        }
        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds, lessThan(1000));
      });
    });
  });
}
