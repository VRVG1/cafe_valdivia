import 'package:cafe_valdivia/models/detalle_produccion_insumo.dart';
import 'package:cafe_valdivia/models/insumo.dart';
import 'package:cafe_valdivia/models/orden_produccion.dart';
import 'package:cafe_valdivia/models/producto.dart';
import 'package:cafe_valdivia/models/unidad_medida.dart';
import 'package:cafe_valdivia/repositorys/insumo_repository.dart';
import 'package:cafe_valdivia/repositorys/orden_produccion_repository.dart';
import 'package:cafe_valdivia/repositorys/producto_repository.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group("OrdenProduccionRepository Tests", () {
    late DatabaseHelper databaseHelper;
    late OrdenProduccionRepository ordenProduccionRepository;
    late InsumosRepository insumoRepository;
    late ProductoRepository productoRepository;
    late UnidadMedidaRepository unidadMedidaRepository;
    late Database database;

    Future<int> _createUnit(String name) async {
      return await unidadMedidaRepository.create(UnidadMedida(nombre: name));
    }

    Future<int> _createInsumo(String name, int unitId, String cost) async {
      return await insumoRepository.create(
        Insumo(nombre: name, idUnidad: unitId, costoUnitario: cost),
      );
    }

    Future<int> _createProduct({
      required String name,
      required String price,
    }) async {
      return await productoRepository.create(
        Producto(nombre: name, precioVenta: price),
      );
    }

    Future<OrdenProduccion> _createProductionOrder({
      required int productId,
      int? orderId,
      int quantity = 10,
      String cost = "10.00",
    }) async {
      return OrdenProduccion(
        idOrdenProduccion: orderId,
        idProducto: productId,
        cantidadProducida: quantity,
        fecha: DateTime.now(),
        costoTotalProduccion: cost,
        notas: "Test Order: $productId",
      );
    }

    Future<DetalleProduccionInsumo> _createProductionOrderDetail({
      required int insumoId,
      double quantityUsed = 1.0,
      String cost = "99.0",
    }) async {
      return DetalleProduccionInsumo(
        idInsumo: insumoId,
        cantidadUsada: quantityUsed,
        costoInsumoMomento: cost,
      );
    }

    setUp(() async {
      final path = p.join(inMemoryDatabasePath, 'test.db');
      await databaseFactory.deleteDatabase(path);

      database = await openDatabase(
        path,
        version: 3,
        onCreate: (db, version) async {
          await DatabaseHelper().testOnCreate(db, version);
        },
        onConfigure: (db) async {
          await DatabaseHelper().testOnConfigure(db);
        },
      );

      databaseHelper = DatabaseHelper();
      databaseHelper.setMockDatabase(database);
      unidadMedidaRepository = UnidadMedidaRepository(databaseHelper);
      insumoRepository = InsumosRepository(
        databaseHelper,
        unidadMedidaRepository,
      );
      productoRepository = ProductoRepository(databaseHelper, insumoRepository);
      ordenProduccionRepository = OrdenProduccionRepository(databaseHelper);
    });

    tearDown(() async {
      if (database.isOpen) {
        await database.close();
      }
    });

    group("Functionality Tests", () {
      test(
        "should register a new production order with a single detail",
        () async {
          final int productId = await _createProduct(
            name: "Cafe",
            price: "120.00",
          );
          final OrdenProduccion orden = await _createProductionOrder(
            productId: productId,
          );
          final int unitId = await _createUnit("Kg");
          final int insumoId = await _createInsumo("Granos", unitId, "102");
          final DetalleProduccionInsumo detail =
              await _createProductionOrderDetail(
                insumoId: insumoId,
                quantityUsed: 5.0,
              );

          final int orderId = await ordenProduccionRepository
              .registrarNuevaProduccion(
                ordenProduccion: orden,
                detalleProduccionInsumo: [detail],
              );

          expect(orderId, isA<int>());
          final fullProduction = await ordenProduccionRepository
              .getFullProduccion(idOrdenProduccion: orderId);
          expect(fullProduction['orden']['id_producto'], productId);
          expect(fullProduction['detalles'].length, 1);
          expect(fullProduction['detalles'][0]['id_insumo'], insumoId);
        },
      );

      test(
        "should register a new production order with multiple details",
        () async {
          final productId = await _createProduct(
            name: "Torta",
            price: "250.00",
          );
          final order = await _createProductionOrder(productId: productId);
          final unitId = await _createUnit("Kg");
          final insumoId1 = await _createInsumo("Harina", unitId, "50");
          final insumoId2 = await _createInsumo("Azucar", unitId, "80");

          final detail1 = await _createProductionOrderDetail(
            insumoId: insumoId1,
            quantityUsed: 2.0,
          );
          final detail2 = await _createProductionOrderDetail(
            insumoId: insumoId2,
            quantityUsed: 1.5,
          );

          final int orderId = await ordenProduccionRepository
              .registrarNuevaProduccion(
                ordenProduccion: order,
                detalleProduccionInsumo: [detail1, detail2],
              );

          expect(orderId, isA<int>());
          final fullProduction = await ordenProduccionRepository
              .getFullProduccion(idOrdenProduccion: orderId);
          expect(fullProduction['detalles'].length, 2);
        },
      );

      test("should retrieve a full production order correctly", () async {
        final productId = await _createProduct(name: "Cafe", price: "120.00");
        final order = await _createProductionOrder(productId: productId);
        final unitId = await _createUnit("Kg");
        final insumoId = await _createInsumo("Granos", unitId, "102");
        final detail = await _createProductionOrderDetail(
          insumoId: insumoId,
          quantityUsed: 5.0,
          cost: "100.0",
        );
        final int orderId = await ordenProduccionRepository
            .registrarNuevaProduccion(
              ordenProduccion: order,
              detalleProduccionInsumo: [detail],
            );

        final fullProduction = await ordenProduccionRepository
            .getFullProduccion(idOrdenProduccion: orderId);

        expect(fullProduction, isNotNull);
        expect(fullProduction.length, 3);
        expect(fullProduction['orden']['id_orden_produccion'], orderId);
        expect(fullProduction['detalles'].length, 1);
        expect(fullProduction['costoTotalCalculado'], "500.00");
      });

      test("should retrieve all production orders", () async {
        final productId1 = await _createProduct(name: "Cafe", price: "120.00");
        final unitId = await _createUnit("Kg");
        final insumoId1 = await _createInsumo("Granos", unitId, "102");

        final productId2 = await _createProduct(name: "Torta", price: "250.00");
        final order1 = await _createProductionOrder(productId: productId1);
        final order2 = await _createProductionOrder(
          productId: productId2,
          orderId: 2,
        );
        final detail1 = await _createProductionOrderDetail(
          insumoId: insumoId1,
          quantityUsed: 8.0,
        );
        final detail2 = await _createProductionOrderDetail(
          insumoId: insumoId1,
          quantityUsed: 1.0,
        );
        await ordenProduccionRepository.registrarNuevaProduccion(
          ordenProduccion: order2,
          detalleProduccionInsumo: [detail2],
        );
        await ordenProduccionRepository.registrarNuevaProduccion(
          ordenProduccion: order1,
          detalleProduccionInsumo: [detail1],
        );

        final allOrders = await ordenProduccionRepository.getAll();

        expect(allOrders.length, 2);
        expect(allOrders[0]['orden']['id_producto'], productId2);
        expect(allOrders[1]['orden']['id_producto'], productId1);
      });
    });

    group("Robustness and Error Handling Tests", () {
      test(
        "getFullProduccion should throw an exception for a non-existent ID",
        () async {
          expect(
            () async => await ordenProduccionRepository.getFullProduccion(
              idOrdenProduccion: 999,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );

      test(
        "registrarNuevaProduccion should rollback transaction if a detail fails",
        () async {
          final productId = await _createProduct(name: "Cafe", price: "120.00");
          final order = await _createProductionOrder(productId: productId);

          final invalidDetail = await _createProductionOrderDetail(
            insumoId: 999,
            quantityUsed: 5.0,
          );

          try {
            await ordenProduccionRepository.registrarNuevaProduccion(
              ordenProduccion: order,
              detalleProduccionInsumo: [invalidDetail],
            );
            fail("Should have thrown an exception");
          } catch (e) {
            expect(e, isA<DatabaseException>());
          }

          final allOrders = await ordenProduccionRepository.getAll();
          expect(allOrders.isEmpty, isTrue);
        },
      );
    });
  });
}
