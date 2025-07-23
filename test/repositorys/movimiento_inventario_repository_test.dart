import 'package:cafe_valdivia/models/movimiento_invetario.dart';
import 'package:cafe_valdivia/repositorys/movimiento_inventario_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('Unit test for movimiento_invetario_repository', () {
    late DatabaseHelper databaseHelper;
    late MovimientoInventarioRepository movimientoInventarioRepository;
    late Database database;

    late String path;

    setUp(() async {
      path = p.join(
        inMemoryDatabasePath,
        'test_movimiento_invetario_repository.db',
      );
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 2,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );
      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);

      movimientoInventarioRepository = MovimientoInventarioRepository(
        databaseHelper,
      );
      // ================== REGISTROS NECESARIOS ==================
      // 1. Unidad_Medida (requerido por Insumo)
      await database.insert('Unidad_Medida', {'nombre': 'Kilogramo'});

      // 2. Proveedor (requerido por Compra)
      await database.insert('Proveedor', {
        'nombre': 'Distribuidor Cafetalero',
        'telefono': '123456789',
      });

      // 3. Cliente (requerido por Venta)
      await database.insert('Cliente', {
        'nombre': 'Cliente Ejemplo',
        'telefono': '987654321',
      });

      // 4. Insumo (clave foránea directa)
      await database.insert('Insumo', {
        'nombre': 'Café Arábica',
        'id_unidad': 1, // Relacionado con Unidad_Medida
        'costo_unitario': 8.5,
      });

      // 5. Producto (requerido por Detalle_Venta)
      await database.insert('Producto', {
        'nombre': 'Café Premium 250g',
        'precio_venta': 12.99,
      });

      // 6. Compra (requerida por Detalle_Compra)
      await database.insert('Compra', {
        'id_proveedor': 1, // Relacionado con Proveedor
        'fecha': DateTime.now().toIso8601String(),
      });

      // 7. Detalle_Compra (clave foránea en Movimiento_Inventario)
      await database.insert('Detalle_Compra', {
        'id_compra': 1, // Relacionado con Compra
        'id_insumo': 1, // Relacionado con Insumo
        'cantidad': 100,
        'precio_unitario_compra': 8.5,
      });

      // 8. Venta (requerida por Detalle_Venta)
      await database.insert('Venta', {
        'id_cliente': 1, // Relacionado con Cliente
        'fecha': DateTime.now().toIso8601String(),
      });

      // 9. Detalle_Venta (clave foránea en Movimiento_Inventario)
      await database.insert('Detalle_Venta', {
        'id_venta': 1, // Relacionado con Venta
        'id_producto': 1, // Relacionado con Producto
        'cantidad': 2,
        'precio_unitario_venta': 12.99,
      });
    });

    tearDown(() async {
      await database.close();
    });

    tearDownAll(() async {
      await databaseFactory.deleteDatabase(path);
    });

    test(
      'Agregando un movimientoInventario y obtenerlo media getByInsumo',
      () async {
        await movimientoInventarioRepository.registrarMovimiento(
          1,
          TipoMovimiento.entrada,
          10.0,
          "Primera compra",
          1,
          1,
        );
        final movimientos = await movimientoInventarioRepository.getByInsumo(1);

        expect(movimientos.length, 1);
        expect(movimientos.first.tipo, TipoMovimiento.entrada);
        expect(movimientos.first.cantidad, 10.0);
        expect(movimientos.first.motivo, 'Primera compra');
      },
    );
    test("Ajustar un movimiento inventario", () async {
      await movimientoInventarioRepository.registrarMovimiento(
        1,
        TipoMovimiento.entrada,
        10.0,
        "Primera compra",
        1,
        1,
      );
      await movimientoInventarioRepository.registrarAjuste(
        TipoMovimiento.ajusteSalida,
        1,
        99.99,
        "Ajuste por pendejo",
      );
      final movimientos = await movimientoInventarioRepository.getByInsumo(1);

      expect(movimientos.length, 1);
      expect(movimientos.first.tipo, TipoMovimiento.ajusteSalida);
      expect(movimientos.first.cantidad, 99.99);
      expect(movimientos.first.motivo, "Ajuste por pendejo");
    });
  });
}
