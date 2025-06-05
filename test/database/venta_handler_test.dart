import "package:cafe_valdivia/handler/cliente_handler.dart";
import "package:cafe_valdivia/handler/venta_handler.dart";
import "package:cafe_valdivia/models/cliente.dart";
import "package:cafe_valdivia/models/venta.dart";
import 'package:flutter_test/flutter_test.dart';
import "package:sqflite/sqlite_api.dart";
import "./test_database_helper.dart";

void main() {
  late Database database;
  late VentaHandler ventaHandler;
  late ClienteHandler clienteHandler;

  setUp(() async {
    database = await openTestDatabase();
    ventaHandler = VentaHandler(() async => database);
    clienteHandler = ClienteHandler(() async => database);
  });

  tearDown(() async {
    await database.close();
  });

  group("Teste VentaHandler", () {
    test("Test insertar una nueva venta", () async {
      final cliente = Cliente(
        nombre: "Pedro",
        apellido: "Rios",
        telefono: "1234567890",
      );
      final id = await clienteHandler.insert(cliente);

      final venta = Venta(
        idCliente: id,
        fecha: DateTime.now(),
        kilosVendidos: 10.0,
        montoTotal: 100.0,
        detalles: "Venta de prueba",
        pagado: true,
      );

      final idVenta = await ventaHandler.insert(venta);
      expect(idVenta, isNotNull);
      expect(idVenta, greaterThan(0));
    });

    test("Obtener todas las ventas", () async {
      final cliente = Cliente(
        nombre: "Pedro",
        apellido: "Rios",
        telefono: "1234567890",
      );
      final id = await clienteHandler.insert(cliente);

      final venta = Venta(
        idCliente: id,
        fecha: DateTime.now(),
        kilosVendidos: 10.0,
        montoTotal: 100.0,
        detalles: "Venta de prueba",
        pagado: true,
      );

      final venta2 = Venta(
        idCliente: id,
        fecha: DateTime.now().add(Duration(days: 1)),
        kilosVendidos: 5.0,
        montoTotal: 50.0,
        detalles: "Otra venta de prueba",
        pagado: false,
      );

      await ventaHandler.insert(venta);
      await ventaHandler.insert(venta2);

      final todaslasVentas = await ventaHandler.get();

      expect(todaslasVentas.length, 2);
      expect(todaslasVentas.any((v) => v.idCliente == id), isTrue);
      expect(
        todaslasVentas.any((v) => v.detalles == "Venta de prueba"),
        isTrue,
      );
      expect(
        todaslasVentas.any((v) => v.detalles == "Otra venta de prueba"),
        isTrue,
      );
      expect(todaslasVentas.any((v) => v.kilosVendidos == 10.0), isTrue);
    });

    test("Actualizar una venta existente", () async {
      final cliente = Cliente(
        nombre: "Pedro",
        apellido: "Rios",
        telefono: "1234567890",
      );
      final id = await clienteHandler.insert(cliente);

      final cliente2 = Cliente(
        nombre: "Yoezer",
        apellido: "Hernandez",
        telefono: "0000000000",
      );
      final id2 = await clienteHandler.insert(cliente2);

      final ventaOriginal = Venta(
        idCliente: id,
        fecha: DateTime.now(),
        kilosVendidos: 10.0,
        montoTotal: 100.0,
        detalles: "Venta de prueba",
        pagado: true,
      );

      final idVentaOriginal = await ventaHandler.insert(ventaOriginal);
      expect(idVentaOriginal, isNotNull);

      final ventaActualizada = Venta(
        idVenta: idVentaOriginal,
        idCliente: id2,
        fecha: DateTime.now(),
        kilosVendidos: 15.0,
        montoTotal: 150.0,
        detalles: "Venta actualizada",
        pagado: false,
      );

      final idVentaActualizada = await ventaHandler.update(ventaActualizada);
      expect(idVentaActualizada, 1);
      final ventaObtenida = await ventaHandler.getById(idVentaOriginal);
      expect(ventaObtenida, isNotNull);
      expect(ventaObtenida!.idCliente, id2);
      expect(ventaObtenida.kilosVendidos, 15.0);
      expect(ventaObtenida.montoTotal, 150.0);
      expect(ventaObtenida.detalles, "Venta actualizada");
    });

    test("Eliminar una venta existente", () async {
      final cliente = Cliente(
        nombre: "Tomoki",
        apellido: "Kuroki",
        telefono: "0987654321",
      );
      final idCliente = await clienteHandler.insert(cliente);

      final venta = Venta(
        idCliente: idCliente,
        fecha: DateTime.now(),
        kilosVendidos: 20.0,
        montoTotal: 200.0,
        detalles: "Venta para eliminar",
        pagado: true,
      );

      final idVenta = await ventaHandler.insert(venta);
      expect(idVenta, isNotNull);

      final eliminado = await ventaHandler.delete(idVenta);
      expect(eliminado, 1);

      final obtenerVenta = await ventaHandler.getById(idVenta);
      expect(obtenerVenta, isNull);
    });

    test("Verificar que de error al buscar una venta inexistente", () async {
      final ventaInexistente = await ventaHandler.getById(9999);
      expect(ventaInexistente, isNull);
    });
  });
}
