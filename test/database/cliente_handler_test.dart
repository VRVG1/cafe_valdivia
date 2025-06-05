import 'package:cafe_valdivia/handler/cliente_handler.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import './test_database_helper.dart';

void main() {
  late Database database;
  late ClienteHandler clienteHandler;

  setUp(() async {
    database = await openTestDatabase();
    clienteHandler = ClienteHandler(() async => database);
  });
  tearDown(() async {
    await database.close();
  });

  group("Test cliente_handler", () {
    test("Insertar nuevo cliente", () async {
      final cliente = Cliente(
        nombre: "Manuelito",
        apellido: "Del nino jesus",
        telefono: "1234567890",
      );
      final id = await clienteHandler.insert(cliente);

      expect(id, isNotNull);
      expect(id, greaterThan(0));

      final obtenerCliente = await clienteHandler.getById(id);

      expect(obtenerCliente, isNotNull);
      expect(obtenerCliente!.nombre, 'Manuelito');
    });

    test("Actualizar cliente existente", () async {
      final cliente = Cliente(
        nombre: "Rafita",
        apellido: "Morales",
        telefono: "0987654321",
      );

      final id = await clienteHandler.insert(cliente);

      final updatedCliente = Cliente(
        idCliente: id,
        nombre: "Rafael",
        apellido: "Martinez",
        telefono: "0000000000",
      );
      final actualizado = await clienteHandler.update(updatedCliente);

      expect(actualizado, 1);
      final obtenerCliente = await clienteHandler.getById(id);
      expect(obtenerCliente!.nombre, "Rafael");
      expect(obtenerCliente.apellido, "Martinez");
      expect(obtenerCliente.telefono, "0000000000");
    });

    test("Obtener Todos los cliente", () async {
      final cliente1 = Cliente(
        nombre: "Cliente1",
        apellido: "Apellido1",
        telefono: "1111111111",
      );

      final cliente2 = Cliente(
        nombre: "Cliente2",
        apellido: "Apellido2",
        telefono: "2222222222",
      );

      await clienteHandler.insert(cliente1);
      await clienteHandler.insert(cliente2);

      final clientes = await clienteHandler.get();

      expect(clientes.length, 2);
      expect(clientes.any((c) => c.nombre == "Cliente1"), isTrue);
      expect(clientes.any((c) => c.nombre == "Cliente2"), isTrue);
    });

    test("Eliminar cliente existente", () async {
      final cliente = Cliente(
        nombre: "Cliente a eliminar",
        apellido: "Apellido a eliminar",
        telefono: "3333333333",
      );

      final id = await clienteHandler.insert(cliente);
      final eliminado = await clienteHandler.delete(id);

      expect(eliminado, 1);

      final obtenerCliente = await clienteHandler.getById(id);
      expect(obtenerCliente, isNull);
    });

    test("Buscar un cliente no existente deberia retornar null", () async {
      final cliente = await clienteHandler.getById(9999);
      expect(cliente, isNull);
    });
  });
}
