import 'package:cafe_valdivia/handler/compra_handler.dart';
import 'package:cafe_valdivia/handler/insumo_handler.dart';
import 'package:cafe_valdivia/models/compra.dart';
import 'package:cafe_valdivia/models/insumos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import './test_database_helper.dart';

void main() {
  late Database database;
  late CompraHandler compraHandler;

  setUp(() async {
    // Configurar entorno de pruebas para sqflite
    sqfliteFfiInit();
    database = await openTestDatabase();
    compraHandler = CompraHandler(() async => database);
  });

  tearDown(() async {
    await database.close();
  });

  group("Pruebas para CompraHandler", () {
    late int insumoId1;
    late int insumoId2;
    setUpAll(() async {
      final tempDB = await openTestDatabase();
      final tempInsumoHandler = InsumoHandler(() async => tempDB);

      insumoId1 = await tempInsumoHandler.insert(
        Insumos(nombre: "Arroz", unidadMedida: "KG"),
      );
      insumoId2 = await tempInsumoHandler.insert(
        Insumos(nombre: "Azúcar", unidadMedida: "KG"),
      );

      await tempDB.close();
    });

    test("Insertar una nueva compra", () async {
      final compra = Compra(
        idInsumo: insumoId1,
        fecha: DateTime.now(),
        cantidad: 10,
        montoTotal: 200.0,
        pagado: true,
        detalles: "Compra de prueba",
      );

      final id = await compraHandler.insert(compra);
      expect(id, greaterThan(0));
    });

    test("Obtener todas las compras", () async {
      // Insertar dos compras de prueba
      final compra1 = Compra(
        idInsumo: insumoId2,
        fecha: DateTime.now(),
        cantidad: 10.0,
        montoTotal: 200.0,
        detalles: "Compra 1",
      );
      final compra2 = Compra(
        idInsumo: insumoId1,
        fecha: DateTime.now().add(const Duration(days: 1)),
        cantidad: 20.0,
        montoTotal: 100.0,
        detalles: "Compra 2",
      );

      await compraHandler.insert(compra1);
      await compraHandler.insert(compra2);

      final todas = await compraHandler.get();
      expect(todas.length, 2);
      expect(todas.any((c) => c.detalles == "Compra 1"), isTrue);
      expect(todas.any((c) => c.montoTotal == 100.0), isTrue);
    });

    test("Obtener compra por ID", () async {
      final compraOriginal = Compra(
        idInsumo: insumoId1,
        fecha: DateTime.now(),
        cantidad: 8.0,
        montoTotal: 160.0,
        detalles: "Buscar por ID",
      );

      final id = await compraHandler.insert(compraOriginal);
      final obtenida = await compraHandler.getById(id);

      expect(obtenida, isNotNull);
      expect(obtenida!.detalles, "Buscar por ID");
      expect(obtenida.montoTotal, 160.0);
    });

    test("Actualizar una compra existente", () async {
      final compraOriginal = Compra(
        idInsumo: insumoId2,
        cantidad: 7.0,
        fecha: DateTime.now(),
        montoTotal: 140.0,
        detalles: "Original",
      );

      final id = await compraHandler.insert(compraOriginal);
      final compraActualizada = Compra(
        idInsumo: insumoId2,
        idCompra: id,
        fecha: DateTime.now(),
        cantidad: 14.0,
        montoTotal: 280.0,
        detalles: "Actualizada",
      );

      final filasAfectadas = await compraHandler.update(compraActualizada);
      final obtenida = await compraHandler.getById(id);

      expect(filasAfectadas, 1);
      expect(obtenida!.detalles, "Actualizada");
      expect(obtenida.montoTotal, 280.0);
    });

    test("Eliminar una compra existente", () async {
      final compra = Compra(
        idInsumo: insumoId1,
        fecha: DateTime.now(),
        cantidad: 3.0,
        montoTotal: 60.0,
        detalles: "Para eliminar",
      );

      final id = await compraHandler.insert(compra);
      final eliminados = await compraHandler.delete(id);
      final obtenida = await compraHandler.getById(id);

      expect(eliminados, 1);
      expect(obtenida, isNull);
    });

    test("Obtener compra con ID inexistente retorna null", () async {
      final compra = await compraHandler.getById(9999);
      expect(compra, isNull);
    });

    test("Actualizar compra inexistente retorna 0 filas", () async {
      final compraFalsa = Compra(
        idInsumo: insumoId1,
        idCompra: 9999,
        fecha: DateTime.now(),
        cantidad: 0,
        montoTotal: 0,
        detalles: "Inexistente",
      );

      final resultado = await compraHandler.update(compraFalsa);
      expect(resultado, 0);
    });

    test("Eliminar compra inexistente retorna 0 filas", () async {
      final resultado = await compraHandler.delete(9999);
      expect(resultado, 0);
    });

    test("Insertar compra sin ID y verificar generación automática", () async {
      final compra = Compra(
        idInsumo: insumoId2,
        fecha: DateTime.now(),
        cantidad: 500.20,
        montoTotal: 500.0,
        detalles: "Autogenerado",
      );

      final id = await compraHandler.insert(compra);
      final obtenida = await compraHandler.getById(id);

      expect(obtenida, isNotNull);
      expect(obtenida!.idCompra, id); // Verifica que se asignó el ID correcto
    });
  });
}
