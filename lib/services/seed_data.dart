import 'package:cafe_valdivia/services/db_helper.dart';

Future<void> seedDatabase() async {
  final db = DatabaseHelper();

  final existing = await db.query('Unidad_Medida');
  if (existing.isNotEmpty) return;

  await db.transaction((txn) async {
    // ============================================================
    // 1. UNIDADES DE MEDIDA
    // ============================================================
    final qId = <int>[];
    for (final nombre in ['KG', 'Pieza', 'Gas', 'Monetario']) {
      qId.add(await txn.insert('Unidad_Medida', {'nombre': nombre}));
    }
    final [kg, pieza, gas, monetario] = qId;

    // ============================================================
    // 2. CLIENTES
    // ============================================================
    final clientes = [
      {
        'nombre': 'Vicente',
        'apellido': 'Valdivia',
        'telefono': '3330000001',
        'email': 'vicente.valdivia@email.com',
      },
      {
        'nombre': 'Rafael',
        'apellido': 'Valdivia',
        'telefono': '3330000002',
        'email': 'rafael.valdivia@email.com',
      },
      {
        'nombre': 'Sofia',
        'apellido': 'Valdivia',
        'telefono': '3330000003',
        'email': 'sofia.valdivia@email.com',
      },
      {
        'nombre': 'Veronica',
        'apellido': 'Valdivia',
        'telefono': '3330000004',
        'email': 'veronica.valdivia@email.com',
      },
      {
        'nombre': 'Emmanuel',
        'apellido': 'Valdivia',
        'telefono': '3330000005',
        'email': 'emmanuel.valdivia@email.com',
      },
      {
        'nombre': 'Veronica',
        'apellido': 'Gomez',
        'telefono': '3330000006',
        'email': 'veronica.gomez@email.com',
      },
      {
        'nombre': 'Tienda Rolon',
        'apellido': '',
        'telefono': '3330000007',
        'email': 'tienda.rolon@email.com',
      },
      {
        'nombre': 'Restaurante Buen Sason',
        'apellido': '',
        'telefono': '3330000008',
        'email': 'buensason@email.com',
      },
      {
        'nombre': 'Guadalupana',
        'apellido': '',
        'telefono': '3330000009',
        'email': 'guadalupana@email.com',
      },
      {
        'nombre': 'San Bartolo',
        'apellido': '',
        'telefono': '3330000010',
        'email': 'san.bartolo@email.com',
      },
      {
        'nombre': 'Marcos',
        'apellido': '',
        'telefono': '3330000011',
        'email': 'marcos@email.com',
      },
      {
        'nombre': 'Chava',
        'apellido': 'Alvarez',
        'telefono': '3330000012',
        'email': 'chava.alvarez@email.com',
      },
      {
        'nombre': 'Panaderia Tapalpa',
        'apellido': '',
        'telefono': '3330000013',
        'email': 'panaderia.tapalpa@email.com',
      },
      {
        'nombre': 'Rabago',
        'apellido': '',
        'telefono': '3330000014',
        'email': 'rabago@email.com',
      },
      {
        'nombre': 'Super Vicky',
        'apellido': '',
        'telefono': '3330000015',
        'email': 'super.vicky@email.com',
      },
      {
        'nombre': 'Tia Cruz',
        'apellido': '',
        'telefono': '3330000016',
        'email': 'tia.cruz@email.com',
      },
      {
        'nombre': 'Carmelilia',
        'apellido': '',
        'telefono': '3330000017',
        'email': 'carmelilia@email.com',
      },
      {
        'nombre': 'Dulce',
        'apellido': '',
        'telefono': '3330000018',
        'email': 'dulce@email.com',
      },
      {
        'nombre': 'Tienda esquina',
        'apellido': '',
        'telefono': '3330000019',
        'email': 'tienda.esquina@email.com',
      },
      {
        'nombre': 'Eriberto',
        'apellido': '',
        'telefono': '3330000020',
        'email': 'eriberto@email.com',
      },
      {
        'nombre': 'Luis Manuel',
        'apellido': '',
        'telefono': '3330000021',
        'email': 'luis.manuel@email.com',
      },
      {
        'nombre': 'Cereales Zacoalco',
        'apellido': '',
        'telefono': '3330000022',
        'email': 'cereales.zacoalco@email.com',
      },
      {
        'nombre': 'Micheladas',
        'apellido': '',
        'telefono': '3330000023',
        'email': 'micheladas@email.com',
      },
      {
        'nombre': 'Yoy',
        'apellido': '',
        'telefono': '3330000024',
        'email': 'yoy@email.com',
      },
      {
        'nombre': 'Miguel',
        'apellido': 'algo',
        'telefono': '3330000025',
        'email': 'miguel.algo@email.com',
      },
      {
        'nombre': 'Senora chayo',
        'apellido': '',
        'telefono': '3330000026',
        'email': 'senora.chayo@email.com',
      },
      {
        'nombre': 'Alonso',
        'apellido': '',
        'telefono': '3330000027',
        'email': 'alonso@email.com',
      },
      {
        'nombre': 'Pedro',
        'apellido': '',
        'telefono': '3330000028',
        'email': 'pedro@email.com',
      },
      {
        'nombre': 'Paco',
        'apellido': '',
        'telefono': '3330000029',
        'email': 'paco@email.com',
      },
    ];
    for (final c in clientes) {
      await txn.insert('Cliente', c);
    }

    // ============================================================
    // 3. PROVEEDORES
    // ============================================================
    final proveedores = [
      {
        'nombre': 'Fernando/Armando',
        'telefono': '1234567890',
        'email': 'ejemplo0@ejemplo.com',
      },
      {
        'nombre': 'Miliano',
        'telefono': '1234567891',
        'email': 'ejemplo1@ejemplo.com',
      },
      {
        'nombre': 'Merma',
        'telefono': '1234567892',
        'email': 'ejemplo2@ejemplo.com',
      },
      {
        'nombre': 'John Doe',
        'telefono': '1234567893',
        'email': 'ejemplo3@ejemplo.com',
      },
      {
        'nombre': 'Vicente',
        'telefono': '1234567894',
        'email': 'ejemplo4@ejemplo.com',
      },
      {
        'nombre': 'Bolas Zacoalco',
        'telefono': '1234567895',
        'email': 'ejemplo5@ejemplo.com',
      },
      {
        'nombre': 'Padre Don Cegas',
        'telefono': '1234567896',
        'email': 'ejemplo6@ejemplo.com',
      },
      {
        'nombre': 'Valdivia',
        'telefono': '1234567897',
        'email': 'ejemplo7@ejemplo.com',
      },
      {
        'nombre': 'Tecnologia de empaques flexibles',
        'telefono': '1234567898',
        'email': 'ejemplo8@ejemplo.com',
      },
      {
        'nombre': 'Gas',
        'telefono': '1234567899',
        'email': 'ejemplo9@ejemplo.com',
      },
      {
        'nombre': 'Llamas',
        'telefono': '1234567900',
        'email': 'ejemplo10@ejemplo.com',
      },
      {
        'nombre': 'Cafiver',
        'telefono': '1234567901',
        'email': 'ejemplo11@ejemplo.com',
      },
      {
        'nombre': 'Gerardo',
        'telefono': '1234567902',
        'email': 'ejemplo12@ejemplo.com',
      },
      {
        'nombre': 'Nando',
        'telefono': '1234567903',
        'email': 'ejemplo13@ejemplo.com',
      },
      {
        'nombre': 'Ramiro',
        'telefono': '1234567904',
        'email': 'ejemplo14@ejemplo.com',
      },
      {
        'nombre': 'Adrian',
        'telefono': '1234567905',
        'email': 'ejemplo15@ejemplo.com',
      },
      {
        'nombre': 'MercadoLibre',
        'telefono': '1234567906',
        'email': 'ejemplo16@ejemplo.com',
      },
      {
        'nombre': 'Etiquetas Sayula',
        'telefono': '1234567907',
        'email': 'ejemplo17@ejemplo.com',
      },
      {
        'nombre': 'Cartero',
        'telefono': '1234567908',
        'email': 'ejemplo27@ejemplo.com',
      },
      {
        'nombre': 'Plasticos Mexico',
        'telefono': '1234567909',
        'email': 'ejemplo36@ejemplo.com',
      },
      {
        'nombre': 'Mamona cafecito',
        'telefono': '1234567910',
        'email': 'ejemplo45@ejemplo.com',
      },
      {
        'nombre': 'Javier Ochoa',
        'telefono': '1234567911',
        'email': 'ejemplo53@ejemplo.com',
      },
      {
        'nombre': 'Hermano de milio',
        'telefono': '1234567912',
        'email': 'ejemplo611@ejemplo.com',
      },
      {
        'nombre': 'Fanta',
        'telefono': '1234567913',
        'email': 'ejemplo6s11@ejemplo.com',
      },
      {
        'nombre': 'Mercedes',
        'telefono': '1234567914',
        'email': 'easdjemplo611@ejemplo.com',
      },
      {
        'nombre': 'Senor troca',
        'telefono': '1234567915',
        'email': 'easjemplo611@ejemplo.com',
      },
      {
        'nombre': 'Cunado de milio',
        'telefono': '1234567916',
        'email': 'ejemplo611@ejemplo.com',
      },
      {
        'nombre': 'Peter',
        'telefono': '1234567917',
        'email': 'ejemplxzco611@ejemplo.com',
      },
      {
        'nombre': 'Senor Gabanzo',
        'telefono': '1234567918',
        'email': 'e123emplo611@ejemplo.com',
      },
      {
        'nombre': 'Cristian Tepec',
        'telefono': '1234567919',
        'email': 'easddjemplo611@ejemplo.com',
      },
      {
        'nombre': 'Omar',
        'telefono': '1234567920',
        'email': 'ejemasdasxplo611@ejemplo.com',
      },
      {
        'nombre': 'Sin techo',
        'telefono': '1234567921',
        'email': 'ejem123splo611@ejemplo.com',
      },
      {
        'nombre': 'tablitas',
        'telefono': '1234567922',
        'email': 'eje123amplo611@ejemplo.com',
      },
      {
        'nombre': '',
        'telefono': '1234567923',
        'email': 'ejemplo312s611@ejemplo.com',
      },
    ];
    final pId = <int>[];
    for (final p in proveedores) {
      pId.add(await txn.insert('Proveedor', p));
    }
    final [idProvCafe, idProvLeche, idProvEmpaques, idProvAzucar] = pId;

    // ============================================================
    // 4. ARTÍCULOS
    // ============================================================
    final articulos = [
      {
        'nombre': 'Bolita',
        'descripcion': 'Garbanzo puerquero',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': kg,
        'costo_unitario': 29.0,
        'precio_venta': 30.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cordoba',
        'descripcion': 'Cafe tipo cordoba',
        'tipo': 'INSUMO',
        'id_unidad': pieza,
        'costo_unitario': 10.0,
        'precio_venta': 12.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Bolsas',
        'descripcion': 'Bolsas (Tienen que haber una de kilo, medio y cuerto)',
        'tipo': 'INSUMO',
        'id_unidad': pieza,
        'costo_unitario': 10.0,
        'precio_venta': 12.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe verde calidad premium',
        'descripcion': 'Cafe verde arabico',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': kg,
        'costo_unitario': 150.0,
        'precio_venta': 320.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe verde calidad buena',
        'descripcion': 'Cafe verde arabico',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': kg,
        'costo_unitario': 140.0,
        'precio_venta': 320.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe verde Calidad Basura',
        'descripcion': 'Cafe verde arabico',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': kg,
        'costo_unitario': 100.0,
        'precio_venta': 320.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe cereza premium',
        'descripcion': 'Cafe en cereza',
        'tipo': 'INSUMO',
        'id_unidad': kg,
        'costo_unitario': 25.0,
        'precio_venta': 30.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe cereza',
        'descripcion': 'Cafe en cereza',
        'tipo': 'INSUMO',
        'id_unidad': kg,
        'costo_unitario': 24.0,
        'precio_venta': 30.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe bola pinto',
        'descripcion': 'Cafe en cereza',
        'tipo': 'INSUMO',
        'id_unidad': kg,
        'costo_unitario': 22.0,
        'precio_venta': 30.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe pergamino',
        'descripcion': 'Cafe en pergamino',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': kg,
        'costo_unitario': 80.0,
        'precio_venta': 120.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Gas',
        'descripcion': 'Gas LP',
        'tipo': 'INSUMO',
        'id_unidad': gas,
        'costo_unitario': 100.0,
        'precio_venta': 100.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Merma',
        'descripcion': 'Para perdidas',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': monetario,
        'costo_unitario': 1.0,
        'precio_venta': 1.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Maquinaria',
        'descripcion': 'Maquinaria usada para el proceso del cafe',
        'tipo': 'INSUMO',
        'id_unidad': monetario,
        'costo_unitario': 1.0,
        'precio_venta': 1.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Salario',
        'descripcion': 'Nomina',
        'tipo': 'INSUMO',
        'id_unidad': monetario,
        'costo_unitario': 1.0,
        'precio_venta': 1.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Trabajo/partes/No Merma',
        'descripcion': 'Trabajo por encargo o partes de piezas para maquinaria',
        'tipo': 'INSUMO',
        'id_unidad': monetario,
        'costo_unitario': 1.0,
        'precio_venta': 1.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Prestamo',
        'descripcion': 'Prestamos',
        'tipo': 'PRODUCTO',
        'id_unidad': monetario,
        'costo_unitario': 1.0,
        'precio_venta': 1.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Etiquetas',
        'descripcion': 'Etiquietas del cafe',
        'tipo': 'INSUMO',
        'id_unidad': pieza,
        'costo_unitario': 3.0,
        'precio_venta': 5.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Retorno de prestamo',
        'descripcion': 'Regreso del cafe',
        'tipo': 'PRODUCTO',
        'id_unidad': monetario,
        'costo_unitario': 1.0,
        'precio_venta': 1.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe tostado medio',
        'descripcion': 'Cafe tostado Medio',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': kg,
        'costo_unitario': 320.0,
        'precio_venta': 320.0,
        'stock': 0.0,
      },
      {
        'nombre': 'cafe tostado oscuro',
        'descripcion': 'Cafe tostado oscuro',
        'tipo': 'PRODUCTO_INTERMEDIO',
        'id_unidad': kg,
        'costo_unitario': 320.0,
        'precio_venta': 320.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe molido medio',
        'tipo': 'PRODUCTO',
        'id_unidad': kg,
        'costo_unitario': 320.0,
        'precio_venta': 320.0,
        'stock': 0.0,
      },
      {
        'nombre': 'Cafe molido oscuro',
        'tipo': 'PRODUCTO',
        'id_unidad': kg,
        'costo_unitario': 320.0,
        'precio_venta': 320.0,
        'stock': 0.0,
      },
    ];
    final aId = <int>[];
    for (final a in articulos) {
      aId.add(await txn.insert('Articulo', a));
    }
    // final [
    //   Bolita,
    //   Cordoba,
    //   Bolsas,
    //   CafeVerDeCalidadPremium,
    //   CafeVerDeCalidadBuena,
    //   CafeVerDecalidadbasura,
    //   CafeCerezaPremium,
    //   CafeCereza,
    //   CafeBolaPinto,
    //   CafePergamino,
    //   Gas,
    //   Merma,
    //   Maquinaria,
    //   Salario,
    //   TrabajoPartesNoMerma,
    //   Prestamo,
    //   Etiquetas,
    //   RetornoDePrestamo,
    //   CafeTostadoMedio,
    //   cafeTostadoOscuro,
    //   CafeMolidoMedio,
    //   CafeMolidoOscuro,
    // ] = aId;

    // // ============================================================
    // // 5. RECETAS
    // // ============================================================
    // final idRecCafeMolido = await txn.insert('Receta', {
    //   'id_articulo_producto': idCafeMolido,
    //   'nombre': 'Tostado y Molido',
    //   'cantidad_base': 1.0,
    // });
    // await txn.insert('Receta_Detalle', {
    //   'id_receta': idRecCafeMolido,
    //   'id_articulo_componente': idCafeGrano,
    //   'cantidad': 1.2,
    //   'id_unidad': kg,
    // });

    // final idRecCapuchino = await txn.insert('Receta', {
    //   'id_articulo_producto': idCapuchino,
    //   'nombre': 'Receta Capuchino',
    //   'cantidad_base': 1.0,
    // });
    // await txn.insert('Receta_Detalle', {
    //   'id_receta': idRecCapuchino,
    //   'id_articulo_componente': idCafeMolido,
    //   'cantidad': 0.02,
    //   'id_unidad': kg,
    // });
    // await txn.insert('Receta_Detalle', {
    //   'id_receta': idRecCapuchino,
    //   'id_articulo_componente': idLeche,
    //   'cantidad': 0.2,
    //   'id_unidad': litro,
    // });

    // // ============================================================
    // // 6. COMPRAS (2 transacciones)
    // // ============================================================
    // final idCompra1 = await txn.insert('Compra', {
    //   'id_proveedor': idProvCafe,
    //   'fecha': '2026-06-01T09:00:00.000',
    //   'detalles': 'Compra mensual de café',
    //   'pagado': 1,
    // });
    // await txn.insert('Detalle_Compra', {
    //   'id_compra': idCompra1,
    //   'id_articulo': idCafeGrano,
    //   'cantidad': 50.0,
    //   'precio_unitario_compra': 28.0,
    // });
    // await txn.insert('Detalle_Compra', {
    //   'id_compra': idCompra1,
    //   'id_articulo': idCanela,
    //   'cantidad': 500.0,
    //   'precio_unitario_compra': 0.5,
    // });

    // final idCompra2 = await txn.insert('Compra', {
    //   'id_proveedor': idProvLeche,
    //   'fecha': '2026-06-05T10:30:00.000',
    //   'detalles': 'Pedido semanal lácteos',
    //   'pagado': 0,
    // });
    // await txn.insert('Detalle_Compra', {
    //   'id_compra': idCompra2,
    //   'id_articulo': idLeche,
    //   'cantidad': 30.0,
    //   'precio_unitario_compra': 8.0,
    // });
    // await txn.insert('Detalle_Compra', {
    //   'id_compra': idCompra2,
    //   'id_articulo': idLecheCond,
    //   'cantidad': 10.0,
    //   'precio_unitario_compra': 20.0,
    // });

    // // ============================================================
    // // 7. VENTAS (3 transacciones)
    // // ============================================================
    // final idVenta1 = await txn.insert('Venta', {
    //   'id_cliente': 1,
    //   'fecha': '2026-06-10T11:00:00.000',
    //   'detalles': 'Venta mostrador',
    //   'pagado': 1,
    //   'estado': 'completado',
    // });
    // await txn.insert('Detalle_Venta', {
    //   'id_venta': idVenta1,
    //   'id_articulo': idCafeMolido,
    //   'cantidad': 2.0,
    //   'precio_unitario_venta': 120.0,
    // });
    // await txn.insert('Detalle_Venta', {
    //   'id_venta': idVenta1,
    //   'id_articulo': idCapuchino,
    //   'cantidad': 3.0,
    //   'precio_unitario_venta': 55.0,
    // });

    // final idVenta2 = await txn.insert('Venta', {
    //   'id_cliente': 2,
    //   'fecha': '2026-06-12T15:45:00.000',
    //   'detalles': 'Pedido especial',
    //   'pagado': 1,
    //   'estado': 'completado',
    // });
    // await txn.insert('Detalle_Venta', {
    //   'id_venta': idVenta2,
    //   'id_articulo': idAmericano,
    //   'cantidad': 5.0,
    //   'precio_unitario_venta': 35.0,
    // });
    // await txn.insert('Detalle_Venta', {
    //   'id_venta': idVenta2,
    //   'id_articulo': idChocolate,
    //   'cantidad': 2.0,
    //   'precio_unitario_venta': 45.0,
    // });

    // final idVenta3 = await txn.insert('Venta', {
    //   'id_cliente': 1,
    //   'fecha': '2026-06-15T09:30:00.000',
    //   'detalles': '',
    //   'pagado': 0,
    //   'estado': 'pendiente',
    // });
    // await txn.insert('Detalle_Venta', {
    //   'id_venta': idVenta3,
    //   'id_articulo': idCafeMolido,
    //   'cantidad': 1.0,
    //   'precio_unitario_venta': 120.0,
    // });
    // await txn.insert('Detalle_Venta', {
    //   'id_venta': idVenta3,
    //   'id_articulo': idLatte,
    //   'cantidad': 2.0,
    //   'precio_unitario_venta': 50.0,
    // });

    // // ============================================================
    // // 8. ORDEN DE PRODUCCIÓN
    // // ============================================================
    // final ordenesProduccion = [
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 15.0,
    //     'fecha': '2025-01-05T08:00:00.000',
    //     'costo_total_produccion': 420.0,
    //     'notas': 'Producción inicio de año',
    //   },
    //   {
    //     'id_receta': idRecCapuchino,
    //     'cantidad_producida': 50.0,
    //     'fecha': '2025-02-12T10:30:00.000',
    //     'costo_total_produccion': 750.0,
    //     'notas': 'Pedido grande febrero',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 20.0,
    //     'fecha': '2025-03-01T07:00:00.000',
    //     'costo_total_produccion': 560.0,
    //     'notas': 'Primera producción marzo',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 30.0,
    //     'fecha': '2025-04-18T14:00:00.000',
    //     'costo_total_produccion': 840.0,
    //     'notas': 'Producción tarde abril',
    //   },
    //   {
    //     'id_receta': idRecCapuchino,
    //     'cantidad_producida': 25.0,
    //     'fecha': '2025-05-22T09:15:00.000',
    //     'costo_total_produccion': 375.0,
    //     'notas': 'Capuchinos para evento',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 40.0,
    //     'fecha': '2025-06-10T11:00:00.000',
    //     'costo_total_produccion': 1120.0,
    //     'notas': 'Producción semanal junio',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 10.0,
    //     'fecha': '2025-07-03T16:45:00.000',
    //     'costo_total_produccion': 280.0,
    //     'notas': 'Producción pequeña julio',
    //   },
    //   {
    //     'id_receta': idRecCapuchino,
    //     'cantidad_producida': 60.0,
    //     'fecha': '2025-08-15T08:30:00.000',
    //     'costo_total_produccion': 900.0,
    //     'notas': 'Pedido grande agosto',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 18.0,
    //     'fecha': '2025-09-20T12:00:00.000',
    //     'costo_total_produccion': 504.0,
    //     'notas': 'Producción mediodía septiembre',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 25.0,
    //     'fecha': '2025-10-08T07:30:00.000',
    //     'costo_total_produccion': 700.0,
    //     'notas': 'Producción octubre',
    //   },
    //   {
    //     'id_receta': idRecCapuchino,
    //     'cantidad_producida': 35.0,
    //     'fecha': '2025-11-14T13:00:00.000',
    //     'costo_total_produccion': 525.0,
    //     'notas': 'Capuchinos noviembre',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 50.0,
    //     'fecha': '2025-12-20T09:00:00.000',
    //     'costo_total_produccion': 1400.0,
    //     'notas': 'Producción fin de año',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 12.0,
    //     'fecha': '2026-01-07T08:15:00.000',
    //     'costo_total_produccion': 336.0,
    //     'notas': 'Primera semana enero',
    //   },
    //   {
    //     'id_receta': idRecCapuchino,
    //     'cantidad_producida': 45.0,
    //     'fecha': '2026-02-14T10:00:00.000',
    //     'costo_total_produccion': 675.0,
    //     'notas': 'Día San Valentín',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 22.0,
    //     'fecha': '2026-03-25T15:30:00.000',
    //     'costo_total_produccion': 616.0,
    //     'notas': 'Producción tarde marzo',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 35.0,
    //     'fecha': '2026-04-10T07:00:00.000',
    //     'costo_total_produccion': 980.0,
    //     'notas': 'Producción abril',
    //   },
    //   {
    //     'id_receta': idRecCapuchino,
    //     'cantidad_producida': 20.0,
    //     'fecha': '2026-05-05T11:45:00.000',
    //     'costo_total_produccion': 300.0,
    //     'notas': 'Capuchinos mayo',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 15.0,
    //     'fecha': '2026-06-08T08:00:00.000',
    //     'costo_total_produccion': 420.0,
    //     'notas': 'Producción semanal',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 28.0,
    //     'fecha': '2026-06-20T14:15:00.000',
    //     'costo_total_produccion': 784.0,
    //     'notas': 'Producción junio extra',
    //   },
    //   {
    //     'id_receta': idRecCapuchino,
    //     'cantidad_producida': 40.0,
    //     'fecha': '2026-07-02T09:30:00.000',
    //     'costo_total_produccion': 600.0,
    //     'notas': 'Capuchinos julio',
    //   },
    //   {
    //     'id_receta': idRecCafeMolido,
    //     'cantidad_producida': 16.0,
    //     'fecha': '2026-07-09T16:00:00.000',
    //     'costo_total_produccion': 448.0,
    //     'notas': 'Producción tarde julio',
    //   },
    // ];
    // for (final op in ordenesProduccion) {
    //   await txn.insert('Orden_Produccion', op);
    // }
  });
}
