import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/proveedor.dart';
import 'package:cafe_valdivia/core/models/cliente.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/compra.dart';
import 'package:cafe_valdivia/core/models/detalle_compra.dart';
import 'package:cafe_valdivia/core/models/venta.dart';
import 'package:cafe_valdivia/core/models/detalle_venta.dart';
import 'package:cafe_valdivia/core/models/orden_produccion.dart';
import 'package:cafe_valdivia/core/models/orden_produccion_consumo.dart';
import 'package:cafe_valdivia/repositorys/unidad_medida_repository.dart';
import 'package:cafe_valdivia/repositorys/articulo_repository.dart';
import 'package:cafe_valdivia/repositorys/proveedor_repository.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/repositorys/receta_repository.dart';
import 'package:cafe_valdivia/repositorys/compra_repository.dart';
import 'package:cafe_valdivia/repositorys/venta_repository.dart';
import 'package:cafe_valdivia/repositorys/orden_produccion_repository.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('Flujo Completo: Compra -> Produccion -> Venta', () {
    late DatabaseHelper databaseHelper;
    late Database database;
    late String path;

    late UnidadMedidaRepository unidadRepo;
    late ArticuloRepository articuloRepo;
    late ProveedorRepository proveedorRepo;
    late ClienteRepository clienteRepo;
    late RecetaRepository recetaRepo;
    late CompraRepository compraRepo;
    late VentaRepository ventaRepo;
    late OrdenProduccionRepository ordenProdRepo;

    setUp(() async {
      path = p.join(inMemoryDatabasePath, 'test_flujo_completo.db');
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

      unidadRepo = UnidadMedidaRepository(databaseHelper);
      articuloRepo = ArticuloRepository(databaseHelper, unidadRepo);
      proveedorRepo = ProveedorRepository(databaseHelper);
      clienteRepo = ClienteRepository(databaseHelper);
      recetaRepo = RecetaRepository(databaseHelper);
      compraRepo = CompraRepository(databaseHelper, proveedorRepo, articuloRepo);
      ventaRepo = VentaRepository(databaseHelper, clienteRepo);
      ordenProdRepo = OrdenProduccionRepository(databaseHelper);
    });

    tearDown(() async {
      if (database.isOpen) await database.close();
    });

    test(
      'Recorre el ciclo completo: insumos -> compra -> produccion -> venta',
      () async {
        // ============================================================
        // 1. CREAR DATOS MAESTROS
        // ============================================================

        final kg = await unidadRepo.create(UnidadMedida(nombre: 'Kilogramo'));
        final und = await unidadRepo.create(UnidadMedida(nombre: 'Unidad'));
        expect(kg, 1);
        expect(und, 2);

        final idCafe = await articuloRepo.create(Articulo(
          nombre: 'Café en Grano',
          tipo: ArticuloTipo.insumo,
          idUnidad: kg,
          costoUnitario: 30.0,
          precioVenta: 0.0,
          stock: 0.0,
        ));
        final idAzucar = await articuloRepo.create(Articulo(
          nombre: 'Azúcar',
          tipo: ArticuloTipo.insumo,
          idUnidad: kg,
          costoUnitario: 15.0,
          precioVenta: 0.0,
          stock: 0.0,
        ));
        final idLeche = await articuloRepo.create(Articulo(
          nombre: 'Leche',
          tipo: ArticuloTipo.insumo,
          idUnidad: und,
          costoUnitario: 8.0,
          precioVenta: 0.0,
          stock: 0.0,
        ));
        final idCafeMolido = await articuloRepo.create(Articulo(
          nombre: 'Café Molido',
          tipo: ArticuloTipo.producto,
          idUnidad: kg,
          costoUnitario: 0.0,
          precioVenta: 120.0,
          stock: 0.0,
        ));
        final idCapuchino = await articuloRepo.create(Articulo(
          nombre: 'Capuchino',
          tipo: ArticuloTipo.producto,
          idUnidad: und,
          costoUnitario: 0.0,
          precioVenta: 200.0,
          stock: 0.0,
        ));
        expect(idCafeMolido, 4);
        expect(idCapuchino, 5);

        final idProveedor = await proveedorRepo.create(
          Proveedor(nombre: 'Distribuidora Café Ltda.'),
        );
        final idCliente = await clienteRepo.create(
          Cliente(nombre: 'Juan', apellido: 'Pérez'),
        );

        // ============================================================
        // 2. CREAR RECETA: Café Molido (1kg insumo -> 1kg producto)
        // ============================================================
        final idReceta = await recetaRepo.create(Receta(
          idArticuloProducto: idCafeMolido,
          nombre: 'Tostado y Molido',
          cantidad_base: 1.0,
        ));
        await database.insert('Receta_Detalle', {
          'id_receta': idReceta,
          'id_articulo_componente': idCafe,
          'cantidad': 1.0,
          'id_unidad': kg,
        });

        // ============================================================
        // 3. COMPRA DE INSUMOS
        // ============================================================
        await compraRepo.registrarNuevaCompra(
          compra: Compra(
            idProveedor: idProveedor,
            fecha: DateTime.now(),
            pagado: true,
          ),
          detallesCompra: [
            DetalleCompra(
              idCompra: 0,
              idArticulo: idCafe,
              cantidad: 50.0,
              precioUnitarioCompra: 28.0,
            ),
            DetalleCompra(
              idCompra: 0,
              idArticulo: idAzucar,
              cantidad: 20.0,
              precioUnitarioCompra: 12.0,
            ),
            DetalleCompra(
              idCompra: 0,
              idArticulo: idLeche,
              cantidad: 30.0,
              precioUnitarioCompra: 7.0,
            ),
          ],
        );

        var stockCafe = await articuloRepo.getById(idCafe);
        expect(stockCafe.stock, 50.0);
        expect(stockCafe.costoUnitario, closeTo(28.0, 0.01));

        var stockAzucar = await articuloRepo.getById(idAzucar);
        expect(stockAzucar.stock, 20.0);

        var stockLeche = await articuloRepo.getById(idLeche);
        expect(stockLeche.stock, 30.0);

        // ============================================================
        // 4. PRODUCCION: transformar café en grano -> café molido
        // ============================================================
        await ordenProdRepo.registrarOrdenProduccion(
          orden: OrdenProduccion(
            idReceta: idReceta,
            cantidadProducida: 10.0,
            fecha: DateTime.now(),
            costoTotalProduccion: 280.0,
          ),
          consumos: [
            OrdenProduccionConsumo(
              idOrdenProduccion: 0,
              idArticulo: idCafe,
              cantidadUsada: 10.0,
              costoArticuloMomento: 28.0,
            ),
          ],
        );

        stockCafe = await articuloRepo.getById(idCafe);
        expect(stockCafe.stock, 40.0);

        var stockCafeMolido = await articuloRepo.getById(idCafeMolido);
        expect(stockCafeMolido.stock, 10.0);

        // ============================================================
        // 5. VENTA: vender café molido al cliente
        // ============================================================
        await ventaRepo.registrarNuevaVenta(
          venta: Venta(
            idCliente: idCliente,
            fecha: DateTime.now(),
            pagado: true,
            estado: VentaEstado.completa,
          ),
          detallesVenta: [
            DetalleVenta(
              idVenta: 0,
              idArticulo: idCafeMolido,
              cantidad: 3.0,
              precioUnitarioVenta: 120.0,
            ),
          ],
        );

        stockCafeMolido = await articuloRepo.getById(idCafeMolido);
        expect(stockCafeMolido.stock, 7.0);

        stockCafe = await articuloRepo.getById(idCafe);
        expect(stockCafe.stock, 40.0);

        // ============================================================
        // 6. VERIFICACIONES FINALES
        // ============================================================
        final ordenes = await database.query('Orden_Produccion');
        expect(ordenes.length, 1);

        final ventas = await database.query('Venta');
        expect(ventas.length, 1);

        final compras = await database.query('Compra');
        expect(compras.length, 1);

        final ventaView = await database.query('v_ventas_resumen');
        expect(ventaView.length, 1);
        expect(
          double.parse(ventaView.first['total_venta'].toString()),
          closeTo(360.0, 0.01),
        );

        final produccionView = await database.query('v_produccion_resumen');
        expect(produccionView.length, 1);
        expect(
          double.parse(
            produccionView.first['total_unidades_consumidas'].toString(),
          ),
          closeTo(10.0, 0.01),
        );
      },
      timeout: const Timeout(Duration(seconds: 10)),
    );
  });
}
