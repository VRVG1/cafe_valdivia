import "package:cafe_valdivia/models/insumos.dart";
import "package:flutter_test/flutter_test.dart";
import "package:cafe_valdivia/handler/insumo_handler.dart";
import "package:sqflite/sqflite.dart";
import "./test_database_helper.dart";

void main() {
  late Database database;
  late InsumoHandler insumoHandler;

  setUp(() async {
    database = await openTestDatabase();
    insumoHandler = InsumoHandler(() async => database);
  });

  tearDown(() async {
    await database.close();
  });

  group("Test InsumoHandler", () {
    test("Test insertar nuevo insumo", () async {
      final insumo = Insumos(
        nombre: "Harina",
        descripcion: "Harina de trigo",
        unidadMedida: "kg",
      );

      final id = await insumoHandler.insert(insumo);
      expect(id, isNotNull);
      expect(id, greaterThan(0));

      final obtenerInsumo = await insumoHandler.getById(id);

      expect(obtenerInsumo, isNotNull);
      expect(obtenerInsumo!.nombre, 'Harina');
    });

    test("Test obtener todos los insumos", () async {
      final insumos = Insumos(
        nombre: "Azúcar",
        descripcion: "Azúcar blanca",
        unidadMedida: "kg",
      );

      final insumos2 = Insumos(
        nombre: "Café",
        descripcion: "Café molido",
        unidadMedida: "kg",
      );

      await insumoHandler.insert(insumos);
      await insumoHandler.insert(insumos2);

      final todosInsumos = await insumoHandler.get();

      expect(todosInsumos.length, 2);
      expect(todosInsumos.any((i) => i.nombre == "Azúcar"), isTrue);
      expect(todosInsumos.any((i) => i.nombre == "Café"), isTrue);
    });

    test("Eliminar insumo existente", () async {
      final insumo = Insumos(
        nombre: "Leche",
        descripcion: "Leche entera",
        unidadMedida: "litro",
      );

      final id = await insumoHandler.insert(insumo);
      expect(id, isNotNull);

      final eliminado = await insumoHandler.delete(id);
      expect(eliminado, 1);

      final obtenerInsumo = await insumoHandler.getById(id);
      expect(obtenerInsumo, isNull);
    });

    test("Actualizar insumo existente", () async {
      final insumo = Insumos(
        nombre: "Mantequilla",
        descripcion: "Mantequilla sin sal",
        unidadMedida: "kg",
      );

      final id = await insumoHandler.insert(insumo);

      final insumoActualizado = Insumos(
        idInsumo: id,
        nombre: "Mantequilla Lala",
        descripcion: "Mantequilla con sal",
        unidadMedida: "kg",
      );

      final actualizado = await insumoHandler.update(insumoActualizado);

      expect(actualizado, 1);
      final obtenerInsumo = await insumoHandler.getById(id);
      expect(obtenerInsumo!.nombre, "Mantequilla Lala");
      expect(obtenerInsumo.descripcion, "Mantequilla con sal");
      expect(obtenerInsumo.unidadMedida, "kg");
    });

    test("Verificar que de error al buscar un insumo inexistente", () async {
      final obtenerInsumo = await insumoHandler.getById(999);
      expect(obtenerInsumo, isNull);
    });
  });
}
