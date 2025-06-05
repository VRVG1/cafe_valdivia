import 'package:cafe_valdivia/handler/detalle_venta_handler.dart';
import 'package:cafe_valdivia/handler/producto_handler.dart';
import 'package:cafe_valdivia/models/detalle_venta.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/models/venta.dart';
import 'package:cafe_valdivia/handler/cliente_handler.dart';
import 'package:cafe_valdivia/handler/venta_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import './test_database_helper.dart';

void main() {
  late Database database;
  late DetalleVentaHandler detalleVentaHandler;
  late ProductoHandler productoHandler;
  late ClienteHandler clienteHandler;
  late VentaHandler ventaHandler;

  setUp(() async {
    database = await openTestDatabase();
    detalleVentaHandler = DetalleVentaHandler(() async => database);
    productoHandler = ProductoHandler(() async => database);
    clienteHandler = ClienteHandler(() async => database);
    ventaHandler = VentaHandler(() async => database);
  });
  tearDown(() async {
    await database.close();
  });

  group("Test detalleVentaHandler", () {
    test("Insertar una detalle de venta", () async {
      final producto = Producto(
        nombre: "Café Espresso",
        precioVenta: 30.0,
        stockDisponible: 20,
      );

      final cliente = Cliente(
        nombre: "Pedro",
        apellido: "Rios",
        telefono: "1234567890",
      );

      final idCliente = await clienteHandler.insert(cliente);
      expect(idCliente, isNotNull);

      final venta = Venta(
        idCliente: idCliente,
        fecha: DateTime.now(),
        kilosVendidos: 10.0,
        montoTotal: 100.0,
        detalles: "Venta de prueba",
        pagado: true,
      );

      final idVenta = await ventaHandler.insert(venta);
      expect(idVenta, isNotNull);
      final idProducto = await productoHandler.insert(producto);
      expect(idProducto, isNotNull);

      final detalleVenta = DetalleVenta(
        idVenta: idVenta,
        idProducto: idProducto,
        cantidad: 10,
      );

      final idDetalle = await detalleVentaHandler.insert(detalleVenta);
      expect(idDetalle, isNotNull);
      expect(idDetalle, greaterThan(0));

      final detalleObtenido = await detalleVentaHandler.getById(idDetalle);
      expect(detalleObtenido, isNotNull);
      expect(detalleObtenido!.idVenta, idVenta);
      expect(detalleObtenido.idProducto, idProducto);
      expect(detalleObtenido.cantidad, 10);
    });

    test("Obtener todos los detalle de venta", () async {
      final producto = Producto(
        nombre: "Café Espresso",
        precioVenta: 30.0,
        stockDisponible: 20,
      );

      final cliente = Cliente(
        nombre: "Pedro",
        apellido: "Rios",
        telefono: "1234567890",
      );

      final idCliente = await clienteHandler.insert(cliente);
      expect(idCliente, isNotNull);

      final venta = Venta(
        idCliente: idCliente,
        fecha: DateTime.now(),
        kilosVendidos: 10.0,
        montoTotal: 100.0,
        detalles: "Venta de prueba",
        pagado: true,
      );

      final idVenta = await ventaHandler.insert(venta);
      expect(idVenta, isNotNull);
      final idProducto = await productoHandler.insert(producto);
      expect(idProducto, isNotNull);

      final ventaDetalle = DetalleVenta(
        idVenta: idVenta,
        idProducto: idProducto,
        cantidad: 10,
      );
      final ventaDetallada2 = DetalleVenta(
        idVenta: idVenta,
        idProducto: idProducto,
        cantidad: 5,
      );

      await detalleVentaHandler.insert(ventaDetalle);
      await detalleVentaHandler.insert(ventaDetallada2);

      final todasLasVentasDetalladas = await detalleVentaHandler.get();

      expect(todasLasVentasDetalladas, isNotEmpty);
      expect(todasLasVentasDetalladas.length, greaterThanOrEqualTo(2));
      expect(todasLasVentasDetalladas.any((d) => d.idVenta == idVenta), isTrue);
      expect(
        todasLasVentasDetalladas.any((d) => d.idProducto == idProducto),
        isTrue,
      );
      expect(todasLasVentasDetalladas.any((d) => d.cantidad == 10), isTrue);
      expect(todasLasVentasDetalladas.any((d) => d.cantidad == 5), isTrue);
    });

    test("Actualzar un detalle de venta", () async {
      final producto = Producto(
        nombre: "Café Espresso",
        precioVenta: 30.0,
        stockDisponible: 20,
      );

      final cliente = Cliente(
        nombre: "Pedro",
        apellido: "Rios",
        telefono: "1234567890",
      );

      final idCliente = await clienteHandler.insert(cliente);
      expect(idCliente, isNotNull);

      final venta = Venta(
        idCliente: idCliente,
        fecha: DateTime.now(),
        kilosVendidos: 10.0,
        montoTotal: 100.0,
        detalles: "Venta de prueba",
        pagado: true,
      );

      final idVenta = await ventaHandler.insert(venta);
      expect(idVenta, isNotNull);
      final idProducto = await productoHandler.insert(producto);
      expect(idProducto, isNotNull);

      final ventaDetalle = DetalleVenta(
        idVenta: idVenta,
        idProducto: idProducto,
        cantidad: 10,
      );

      final idVentaDetallada = await detalleVentaHandler.insert(ventaDetalle);
      expect(idVentaDetallada, isNotNull);

      final ventaDetalleActualizado = DetalleVenta(
        idDetalleVenta: idVentaDetallada,
        idVenta: idVenta,
        idProducto: idProducto,
        cantidad: 15, // Cambiamos la cantidad
      );

      final ventaActualizada = await detalleVentaHandler.update(
        ventaDetalleActualizado,
      );
      expect(ventaActualizada, 1);

      final ventaDetalladaObtenida = await detalleVentaHandler.getById(
        idVentaDetallada,
      );
      expect(ventaDetalladaObtenida, isNotNull);
      expect(ventaDetalladaObtenida!.cantidad, 15);
    });

    test("Eliminar una ventaDetallada", () async {
      final producto = Producto(
        nombre: "Café Espresso",
        precioVenta: 30.0,
        stockDisponible: 20,
      );

      final cliente = Cliente(
        nombre: "Pedro",
        apellido: "Rios",
        telefono: "1234567890",
      );

      final idCliente = await clienteHandler.insert(cliente);
      expect(idCliente, isNotNull);

      final venta = Venta(
        idCliente: idCliente,
        fecha: DateTime.now(),
        kilosVendidos: 10.0,
        montoTotal: 100.0,
        detalles: "Venta de prueba",
        pagado: true,
      );

      final idVenta = await ventaHandler.insert(venta);
      expect(idVenta, isNotNull);
      final idProducto = await productoHandler.insert(producto);
      expect(idProducto, isNotNull);

      final ventaDetalle = DetalleVenta(
        idVenta: idVenta,
        idProducto: idProducto,
        cantidad: 10,
      );

      final idVentaDetallada = await detalleVentaHandler.insert(ventaDetalle);
      expect(idVentaDetallada, isNotNull);

      // Eliminamos la venta detallada
      final ventaDetalldaEliminada = await detalleVentaHandler.delete(
        idVentaDetallada,
      );
      // Verificamos que se haya eliminado
      expect(ventaDetalldaEliminada, 1);
    });
    test(
      "Vrificamos que no se pueda obtener una venta detallada que no existe",
      () async {
        final detalleObtenido = await detalleVentaHandler.getById(9999);
        expect(detalleObtenido, isNull);
      },
    );
  });
}
