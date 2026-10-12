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
    final cId = <int>[];
    for (final c in clientes) {
      cId.add(await txn.insert('Cliente', c));
    }
    final [
      idClienVicenteValdivia,
      idClienRafaelValdivia,
      idClienSofiaValdivia,
      idClienVeronicaValdivia,
      idClienEmmanuelValdivia,
      idClienVeronicaGomez,
      idClienTiendaRolon,
      idClienRestauranteBuenSason,
      idClienGuadalupana,
      idClienSanBartolo,
      idClienMarcos,
      idClienChavaAlvarez,
      idClienPanaderiaTapalpa,
      idClienRabago,
      idClienSuperVicky,
      idClienTiaCruz,
      idClienCarmelilia,
      idClienDulce,
      idClienTiendaEsquina,
      idClienEriberto,
      idClienLuisManuel,
      idClienCerealesZacoalco,
      idClienMicheladas,
      idClienYoy,
      idClienMiguelAlgo,
      idClienSenoraChayo,
      idClienAlonso,
      idClienPedro,
      idClienPaco,
    ] = cId;
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
    ];
    final pId = <int>[];
    for (final p in proveedores) {
      pId.add(await txn.insert('Proveedor', p));
    }
    final [
      idProvFernandoArmando,
      idProvMiliano,
      idProvMerma,
      idProvJohnDoe,
      idProvVicente,
      idProvBolasZacoalco,
      idProvPadreDonCegas,
      idProvValdivia,
      idProvTecnologiaDeEmpaquesFlexibles,
      idProvGas,
      idProvLlamas,
      idProvCafiver,
      idProvGerardo,
      idProvNando,
      idProvRamiro,
      idProvAdrian,
      idProvMercadoLibre,
      idProvEtiquetasSayula,
      idProvCartero,
      idProvPlasticosMexico,
      idProvMamonaCafecito,
      idProvJavierOchoa,
      idProvHermanoDeMilio,
      idProvFanta,
      idProvMercedes,
      idProvSenorTroca,
      idProvCunadoDeMilio,
      idProvPeter,
      idProvSenorGabanzo,
      idProvCristianTepec,
      idProvOmar,
      idProvSinTecho,
      idProvTablitas,
    ] = pId;
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
    // articulos Inicio
    final [
      idArtbolita,
      idArtcordoba,
      idArtbolsas,
      idArtcafeverdecalidadPremium,
      idArtcafeverdecalidadBuena,
      idArtcafeverdecalidadbasura,
      idArtCafeCerezaPremium,
      idArtcafecereza,
      idArtCafeBolaPinto,
      idArtCafePergamino,
      idArtGas,
      idArtMerma,
      idArtMaquinaria,
      idArtSalario,
      idArtTrabajoPartesNoMerma,
      idArtPrestamo,
      idArtEtiquetas,
      idArtRetornoDePrestamo,
      idArtCafeTostadoMedio,
      idArtcafeTostadoOscuro,
      idArtCafeMolidoMedio,
      idArtCafeMolidoOscuro,
    ] = aId;

    // ============================================================
    // 6. COMPRAS
    // ============================================================
    final idCompra1 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2023-12-21T09:00:00.000',
      'detalles': 'Cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra1,
      'id_articulo': idArtcordoba,
      'cantidad': 120.0,
      'precio_unitario_compra': 6.00,
    });

    final idCompra2 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2023-12-24T09:00:00.000',
      'detalles': 'compra café a milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra2,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 50.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra3 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2023-12-28T09:00:00.000',
      'detalles': 'Cafe que se le dio a mi abue un cuarto',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra3,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 60.00,
    });

    final idCompra4 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2023-12-29T09:00:00.000',
      'detalles': 'Cafe cordoba 2 paquetes',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra4,
      'id_articulo': idArtcordoba,
      'cantidad': 120.0,
      'precio_unitario_compra': 6.00,
    });

    final idCompra5 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2023-12-29T09:00:00.000',
      'detalles': 'Café cordoba 1 bolsa',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra5,
      'id_articulo': idArtcordoba,
      'cantidad': 60.0,
      'precio_unitario_compra': 6.00,
    });

    final idCompra6 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2023-12-29T09:00:00.000',
      'detalles': 'Se le deben 20 a la tienda por cambio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra6,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra7 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2023-12-29T09:00:00.000',
      'detalles': 'café cordoba 5 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra7,
      'id_articulo': idArtcordoba,
      'cantidad': 300.0,
      'precio_unitario_compra': 6.00,
    });

    final idCompra8 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2023-12-29T09:00:00.000',
      'detalles': 'café cordoba 3',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra8,
      'id_articulo': idArtcordoba,
      'cantidad': 180.0,
      'precio_unitario_compra': 5.30,
    });

    final idCompra9 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2023-12-31T09:00:00.000',
      'detalles': 'café comprado a milio 40kg',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra9,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 40.0,
      'precio_unitario_compra': 125.00,
    });

    final idCompra10 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2023-12-31T09:00:00.000',
      'detalles': 'pago a milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra10,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 500.00,
    });

    final idCompra11 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2024-01-01T09:00:00.000',
      'detalles': 'A Vicente le faltaron 30 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra11,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 30.00,
    });

    final idCompra12 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-01-05T09:00:00.000',
      'detalles': '6 kilos de cafe comprados a no se quien pero estaban sucio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra12,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 6.0,
      'precio_unitario_compra': 116.67,
    });

    final idCompra13 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-01-05T09:00:00.000',
      'detalles': '10 bolsas cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra13,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra14 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-01-05T09:00:00.000',
      'detalles': 'Bolsas papel y plastico',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra14,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 216.00,
    });

    final idCompra15 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': 'Pago milio 200',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra15,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 200.00,
    });

    final idCompra16 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-01-16T09:00:00.000',
      'detalles': '50 kilos de café pagado a milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra16,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 50.0,
      'precio_unitario_compra': 125.00,
    });

    final idCompra17 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2024-01-23T09:00:00.000',
      'detalles': 'se le pago a Vicente 1380',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra17,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 1380.00,
    });

    final idCompra18 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2024-01-24T09:00:00.000',
      'detalles': 'Garbazon 50 mas la deuda de sofia',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra18,
      'id_articulo': idArtbolita,
      'cantidad': 50.0,
      'precio_unitario_compra': 78.00,
    });

    final idCompra19 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': 'Café cordoba 13 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra19,
      'id_articulo': idArtcordoba,
      'cantidad': 780.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra20 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': 'pagarle a milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra20,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 200.00,
    });

    final idCompra21 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-01-30T09:00:00.000',
      'detalles': 'café cordoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra21,
      'id_articulo': idArtcordoba,
      'cantidad': 780.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra22 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-01-30T09:00:00.000',
      'detalles': '50 kilos que trago milio 125',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra22,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 50.0,
      'precio_unitario_compra': 125.00,
    });

    final idCompra23 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-01-31T09:00:00.000',
      'detalles': 'Bolsas papel',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra23,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 266.00,
    });

    final idCompra24 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2024-01-31T09:00:00.000',
      'detalles': '100k de bolita',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra24,
      'id_articulo': idArtbolita,
      'cantidad': 100.0,
      'precio_unitario_compra': 26.00,
    });

    final idCompra25 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-02-08T09:00:00.000',
      'detalles': 'café en bola',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra25,
      'id_articulo': idArtcafecereza,
      'cantidad': 60.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra26 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-02-12T09:00:00.000',
      'detalles': '50kl de café de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra26,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 50.0,
      'precio_unitario_compra': 125.00,
    });

    final idCompra27 = await txn.insert('Compra', {
      "id_proveedor": idProvPadreDonCegas,
      'fecha': '2024-02-20T09:00:00.000',
      'detalles': 'Café que trajo el padre',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra27,
      'id_articulo': idArtcafecereza,
      'cantidad': 5.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra28 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-02-20T09:00:00.000',
      'detalles': 'Salario Milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra28,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 500.00,
    });

    final idCompra29 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-02-24T09:00:00.000',
      'detalles': 'café cordoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra29,
      'id_articulo': idArtcordoba,
      'cantidad': 300.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra30 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-02-27T09:00:00.000',
      'detalles': 'café que milio llevo a limpiar fueron 20 kg',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra30,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 150.00,
    });

    final idCompra31 = await txn.insert('Compra', {
      "id_proveedor": idProvPadreDonCegas,
      'fecha': '2024-02-29T09:00:00.000',
      'detalles': 'Café que se le compro al padre ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra31,
      'id_articulo': idArtcafecereza,
      'cantidad': 5.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra32 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-03-01T09:00:00.000',
      'detalles': 'Pago a los 5 empleados/socios',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra32,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 400.00,
    });

    final idCompra33 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-03-05T09:00:00.000',
      'detalles': '50 kilos de café comprado a milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra33,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 50.0,
      'precio_unitario_compra': 125.00,
    });

    final idCompra34 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-03-12T09:00:00.000',
      'detalles': '10 bolsas de café cordoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra34,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra35 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2024-03-12T09:00:00.000',
      'detalles': 'Cafe bola que compro vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra35,
      'id_articulo': idArtcafecereza,
      'cantidad': 5.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra36 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2024-03-15T09:00:00.000',
      'detalles': 'Se le presto 5000 a Vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra36,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 5000.00,
    });

    final idCompra37 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-03-23T09:00:00.000',
      'detalles': 'Entradas expo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra37,
      'id_articulo': idArtPrestamo,
      'cantidad': 3.0,
      'precio_unitario_compra': 130.00,
    });

    final idCompra38 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-03-23T09:00:00.000',
      'detalles': '500 de cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra38,
      'id_articulo': idArtcafecereza,
      'cantidad': 1.0,
      'precio_unitario_compra': 500.00,
    });

    final idCompra39 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-03-23T09:00:00.000',
      'detalles': '1000 cacao',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra39,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra40 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-03-26T09:00:00.000',
      'detalles': 'café cordoba 13 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra40,
      'id_articulo': idArtcordoba,
      'cantidad': 780.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra41 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-03-26T09:00:00.000',
      'detalles': 'café de una señora ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra41,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 8.0,
      'precio_unitario_compra': 121.88,
    });

    final idCompra42 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-03-26T09:00:00.000',
      'detalles': 'Cafe que se le compro a milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra42,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 9.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra43 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-03-27T09:00:00.000',
      'detalles': '100 kilos que se le compro a milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra43,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 100.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra44 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-04-06T09:00:00.000',
      'detalles': 'Cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra44,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra45 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-04-06T09:00:00.000',
      'detalles': 'Bolsa de Papael',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra45,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 84.00,
    });

    final idCompra46 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2024-04-10T09:00:00.000',
      'detalles': 'Se compro 5 kilos de nuez para su reventa',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra46,
      'id_articulo': idArtMerma,
      'cantidad': 5.0,
      'precio_unitario_compra': 250.00,
    });

    final idCompra47 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-04-10T09:00:00.000',
      'detalles': 'se compró café verde',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra47,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 4.0,
      'precio_unitario_compra': 125.00,
    });

    final idCompra48 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2024-04-10T09:00:00.000',
      'detalles': 'Bolsas nuevas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra48,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 3423.00,
    });

    final idCompra49 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-04-13T09:00:00.000',
      'detalles': '150 kilos que se compró a milio a 115 el kilo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra49,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 150.0,
      'precio_unitario_compra': 115.00,
    });

    final idCompra50 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2024-04-15T09:00:00.000',
      'detalles': 'Se compro bolita',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra50,
      'id_articulo': idArtbolita,
      'cantidad': 25.0,
      'precio_unitario_compra': 26.00,
    });

    final idCompra51 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': 'Se compro lena',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra51,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 500.00,
    });

    final idCompra52 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': 'Se comrpo cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra52,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra53 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-04-27T09:00:00.000',
      'detalles': 'se compraron 10 kilos de cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra53,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 10.0,
      'precio_unitario_compra': 150.00,
    });

    final idCompra54 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-04-28T09:00:00.000',
      'detalles': 'Cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra54,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.83,
    });

    final idCompra55 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': 'Cosa de gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra55,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 700.00,
    });

    final idCompra56 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2024-05-11T09:00:00.000',
      'detalles': 'Bolsas de cafe y envio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra56,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 3950.00,
    });

    final idCompra57 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2024-05-17T09:00:00.000',
      'detalles': 'refill cilindro y comprar nuevo cilindro ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra57,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 1520.00,
    });

    final idCompra58 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-05-18T09:00:00.000',
      'detalles': 'café Cordova ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra58,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra59 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-05-21T09:00:00.000',
      'detalles': 'Pago a alondra',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra59,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 1500.00,
    });

    final idCompra60 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-05-27T09:00:00.000',
      'detalles': 'comprar 200 kilos de cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra60,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 200.0,
      'precio_unitario_compra': 115.00,
    });

    final idCompra61 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-05-30T09:00:00.000',
      'detalles': 'Comprar 50 kilos de cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra61,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 50.0,
      'precio_unitario_compra': 110.00,
    });

    final idCompra62 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-06-01T09:00:00.000',
      'detalles': 'Cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra62,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra63 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-06-15T09:00:00.000',
      'detalles': 'café Cordova ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra63,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra64 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2024-06-18T09:00:00.000',
      'detalles': 'refill tanque chiquito ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra64,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 95.00,
    });

    final idCompra65 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-06-21T09:00:00.000',
      'detalles': 'pago trabajadores ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra65,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra66 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2024-06-26T09:00:00.000',
      'detalles': 'compra de bolita',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra66,
      'id_articulo': idArtbolita,
      'cantidad': 50.0,
      'precio_unitario_compra': 26.00,
    });

    final idCompra67 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2024-06-28T09:00:00.000',
      'detalles': 'Pago cafe que compro vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra67,
      'id_articulo': idArtcafecereza,
      'cantidad': 2.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra68 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-06-29T09:00:00.000',
      'detalles': 'café Cordova mitad ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra68,
      'id_articulo': idArtcordoba,
      'cantidad': 300.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra69 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2024-07-03T09:00:00.000',
      'detalles': '600 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra69,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 4210.00,
    });

    final idCompra70 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-07-09T09:00:00.000',
      'detalles': '15 kilos de café a la señora de los chavez',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra70,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 15.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra71 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-07-13T09:00:00.000',
      'detalles': 'café Cordova mitad ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra71,
      'id_articulo': idArtcordoba,
      'cantidad': 300.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra72 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-07-15T09:00:00.000',
      'detalles': 'Cafe de un senor de quien sabe donde 14 kilos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra72,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 14.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra73 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-07-27T09:00:00.000',
      'detalles': 'Cafecordova 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra73,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra74 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-08-01T09:00:00.000',
      'detalles': 'pago trabajadores ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra74,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra75 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2024-08-02T09:00:00.000',
      'detalles': 'Refill tanque de gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra75,
      'id_articulo': idArtGas,
      'cantidad': 15.0,
      'precio_unitario_compra': 40.00,
    });

    final idCompra76 = await txn.insert('Compra', {
      "id_proveedor": idProvLlamas,
      'fecha': '2024-08-08T09:00:00.000',
      'detalles': 'Cafe llamas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra76,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 25.0,
      'precio_unitario_compra': 124.80,
    });

    final idCompra77 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2024-08-15T09:00:00.000',
      'detalles': '600 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra77,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 4200.00,
    });

    final idCompra78 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-08-17T09:00:00.000',
      'detalles': 'café Cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra78,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra79 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2024-08-17T09:00:00.000',
      'detalles': 'bolita',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra79,
      'id_articulo': idArtbolita,
      'cantidad': 50.0,
      'precio_unitario_compra': 30.00,
    });

    final idCompra80 = await txn.insert('Compra', {
      "id_proveedor": idProvLlamas,
      'fecha': '2024-08-29T09:00:00.000',
      'detalles': '36 kilos de llamas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra80,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 36.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra81 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-09-03T09:00:00.000',
      'detalles': 'café Cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra81,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra82 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2024-09-08T09:00:00.000',
      'detalles': '100 kilos de cafe a 100 pesos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra82,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 100.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra83 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2024-09-20T09:00:00.000',
      'detalles': 'Compra bolia zacoalco 30 el kilo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra83,
      'id_articulo': idArtbolita,
      'cantidad': 50.0,
      'precio_unitario_compra': 30.60,
    });

    final idCompra84 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-09-28T09:00:00.000',
      'detalles': 'café Cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra84,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra85 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-10-01T09:00:00.000',
      'detalles': 'Pago a trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra85,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra86 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2024-10-04T09:00:00.000',
      'detalles': 'Refil tanque de gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra86,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 566.00,
    });

    final idCompra87 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2024-10-08T09:00:00.000',
      'detalles': 'Bolsas Solo de a cuarto',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra87,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 3116.00,
    });

    final idCompra88 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-10-13T09:00:00.000',
      'detalles': 'café Cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra88,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra89 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2024-10-14T09:00:00.000',
      'detalles': 'reparación gas y reparación servidor ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra89,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 340.00,
    });

    final idCompra90 = await txn.insert('Compra', {
      "id_proveedor": idProvCafiver,
      'fecha': '2024-11-01T09:00:00.000',
      'detalles': 'Dos costales Cafiver 79 kilos cada uno',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra90,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 158.0,
      'precio_unitario_compra': 108.86,
    });

    final idCompra91 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-11-05T09:00:00.000',
      'detalles': 'pago trabajadores ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra91,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra92 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-11-09T09:00:00.000',
      'detalles': 'Cafe Cordova 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra92,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra93 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2024-11-19T09:00:00.000',
      'detalles': '50 kilos de bolita',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra93,
      'id_articulo': idArtbolita,
      'cantidad': 50.0,
      'precio_unitario_compra': 25.50,
    });

    final idCompra94 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2024-11-22T09:00:00.000',
      'detalles': 'Nuevo Tostador',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra94,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 2500.00,
    });

    final idCompra95 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-11-23T09:00:00.000',
      'detalles': 'Cafe Cordova 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra95,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra96 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2024-11-27T09:00:00.000',
      'detalles': '1000 bolsas Ruperto ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra96,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 7.72,
    });

    final idCompra97 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2024-11-30T09:00:00.000',
      'detalles': 'Refill tanque de gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra97,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 600.00,
    });

    final idCompra98 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2024-12-02T09:00:00.000',
      'detalles': 'Aguinaldo trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra98,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 2500.00,
    });

    final idCompra99 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-12-07T09:00:00.000',
      'detalles': 'café Cordova 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra99,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra100 = await txn.insert('Compra', {
      "id_proveedor": idProvCafiver,
      'fecha': '2024-12-12T09:00:00.000',
      'detalles': 'Un Costal Cafiver 79 kilos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra100,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 79.0,
      'precio_unitario_compra': 103.80,
    });

    final idCompra101 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2024-12-21T09:00:00.000',
      'detalles': 'café Cordova 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra101,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra102 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2025-01-02T09:00:00.000',
      'detalles': 'Garbazon 50 kilos a 31',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra102,
      'id_articulo': idArtbolita,
      'cantidad': 50.0,
      'precio_unitario_compra': 31.00,
    });

    final idCompra103 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-01-03T09:00:00.000',
      'detalles': 'Dinero trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra103,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1100.00,
    });

    final idCompra104 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-01-04T09:00:00.000',
      'detalles': 'Cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra104,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.74,
    });

    final idCompra105 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-01-07T09:00:00.000',
      'detalles': 'café bola 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra105,
      'id_articulo': idArtcafecereza,
      'cantidad': 20.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra106 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-01-09T09:00:00.000',
      'detalles': 'café bola 33kg',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra106,
      'id_articulo': idArtcafecereza,
      'cantidad': 33.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra107 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-01-10T09:00:00.000',
      'detalles': 'le preste 50000 a vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra107,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 50000.00,
    });

    final idCompra108 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-01-18T09:00:00.000',
      'detalles': 'Cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra108,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra109 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-01-20T09:00:00.000',
      'detalles': 'café bola 37',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra109,
      'id_articulo': idArtcafecereza,
      'cantidad': 37.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra110 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-01-22T09:00:00.000',
      'detalles': 'café bola 15',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra110,
      'id_articulo': idArtcafecereza,
      'cantidad': 15.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra111 = await txn.insert('Compra', {
      "id_proveedor": idProvLlamas,
      'fecha': '2025-01-24T09:00:00.000',
      'detalles': 'café bola llamas 47kg a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra111,
      'id_articulo': idArtcafecereza,
      'cantidad': 47.0,
      'precio_unitario_compra': 24.47,
    });

    final idCompra112 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2025-01-26T09:00:00.000',
      'detalles': '80 kilos café milio a 100 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra112,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 80.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra113 = await txn.insert('Compra', {
      "id_proveedor": idProvGerardo,
      'fecha': '2025-01-28T09:00:00.000',
      'detalles': 'café de Gerardo 12.5 kilos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra113,
      'id_articulo': idArtcafecereza,
      'cantidad': 13.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra114 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-01-31T09:00:00.000',
      'detalles': 'Cafe Cordova 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra114,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra115 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-01-31T09:00:00.000',
      'detalles': 'deuda de la ferreteria',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra115,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 2600.00,
    });

    final idCompra116 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-02-04T09:00:00.000',
      'detalles': 'pago trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra116,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1125.00,
    });

    final idCompra117 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-02-04T09:00:00.000',
      'detalles': 'Botes de plástico y otra cosilla mía xd',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra117,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 2.0,
      'precio_unitario_compra': 1600.00,
    });

    final idCompra118 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2025-02-04T09:00:00.000',
      'detalles': 'Refill del tanque de gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra118,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 600.00,
    });

    final idCompra119 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-02-06T09:00:00.000',
      'detalles': 'Cargador de báscula del cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra119,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 290.00,
    });

    final idCompra120 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-02-06T09:00:00.000',
      'detalles': 'Bolsas para sembrar cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra120,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra121 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-02-06T09:00:00.000',
      'detalles': 'Café verde 18Kg',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra121,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 18.0,
      'precio_unitario_compra': 27.78,
    });

    final idCompra122 = await txn.insert('Compra', {
      "id_proveedor": idProvLlamas,
      'fecha': '2025-02-06T09:00:00.000',
      'detalles': 'Limpiada de café 27kg salieron de 150kg bola',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra122,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 500.00,
    });

    final idCompra123 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-02-07T09:00:00.000',
      'detalles': '56kg de café verde',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra123,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 56.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra124 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-02-08T09:00:00.000',
      'detalles': 'No se cuánto fue',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra124,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 600.00,
    });

    final idCompra125 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2025-02-08T09:00:00.000',
      'detalles': '10 kilos que compre a milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra125,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 10.0,
      'precio_unitario_compra': 110.00,
    });

    final idCompra126 = await txn.insert('Compra', {
      "id_proveedor": idProvLlamas,
      'fecha': '2025-02-09T09:00:00.000',
      'detalles': '73kg de llamas a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra126,
      'id_articulo': idArtcafecereza,
      'cantidad': 73.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra127 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-02-10T09:00:00.000',
      'detalles': '38kg bola',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra127,
      'id_articulo': idArtcafecereza,
      'cantidad': 38.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra128 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-02-10T09:00:00.000',
      'detalles': '13kg de bola ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra128,
      'id_articulo': idArtcafecereza,
      'cantidad': 13.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra129 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-02-12T09:00:00.000',
      'detalles': '17kg de un viejo 20',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra129,
      'id_articulo': idArtcafecereza,
      'cantidad': 17.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra130 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-02-13T09:00:00.000',
      'detalles': 'Limpieza de los 124kg de bola fresca',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra130,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 350.00,
    });

    final idCompra131 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-02-15T09:00:00.000',
      'detalles': '10 bolsas de cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra131,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 5.73,
    });

    final idCompra132 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-02-15T09:00:00.000',
      'detalles': 'Cafe que compro vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra132,
      'id_articulo': idArtcafecereza,
      'cantidad': 32.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra133 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-02-21T09:00:00.000',
      'detalles': 'limpieza de un café random ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra133,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 150.00,
    });

    final idCompra134 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-02-24T09:00:00.000',
      'detalles': '65kg comprados a Nando ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra134,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 65.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra135 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2025-02-25T09:00:00.000',
      'detalles': '1000 bolsas de café ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra135,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 7.54,
    });

    final idCompra136 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-02-26T09:00:00.000',
      'detalles': 'Café bola que compró Vicente ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra136,
      'id_articulo': idArtcafecereza,
      'cantidad': 25.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra137 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-03-01T09:00:00.000',
      'detalles': 'pago a trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra137,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1125.00,
    });

    final idCompra138 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2025-03-02T09:00:00.000',
      'detalles': 'Café comprado a milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra138,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 140.0,
      'precio_unitario_compra': 119.43,
    });

    final idCompra139 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-03-02T09:00:00.000',
      'detalles': 'café de failo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra139,
      'id_articulo': idArtcafecereza,
      'cantidad': 18.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra140 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-03-07T09:00:00.000',
      'detalles': '27 kilos de lulis',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra140,
      'id_articulo': idArtcafecereza,
      'cantidad': 27.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra141 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-03-09T09:00:00.000',
      'detalles':
          '5000 pesos que se le prestaron al pendejo de Pancho y nunca va a regresar ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra141,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 5000.00,
    });

    final idCompra142 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-03-10T09:00:00.000',
      'detalles': 'al muerto de hambre de Nando 51 kilos a 120',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra142,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 51.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra143 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-03-10T09:00:00.000',
      'detalles': 'comprando de no sé quién 13 kilos ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra143,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 13.0,
      'precio_unitario_compra': 115.38,
    });

    final idCompra144 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-03-14T09:00:00.000',
      'detalles': 'Comprar 44 kilos de cafe al pendejo de fernando',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra144,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 44.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra145 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-03-16T09:00:00.000',
      'detalles': '10 bolsas de cafe cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra145,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra146 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2025-03-18T09:00:00.000',
      'detalles': '26 kilos que le compre a milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra146,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 26.0,
      'precio_unitario_compra': 110.00,
    });

    final idCompra147 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-03-19T09:00:00.000',
      'detalles': 'Viaticos de gasolina',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra147,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 200.00,
    });

    final idCompra148 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-03-21T09:00:00.000',
      'detalles': 'Café pendejo Nando 57kg 120',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra148,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 57.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra149 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-03-25T09:00:00.000',
      'detalles': 'limpieza del pendejenando',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra149,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 820.00,
    });

    final idCompra150 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2025-03-25T09:00:00.000',
      'detalles': '51 kg que le compre a milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra150,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 51.0,
      'precio_unitario_compra': 115.00,
    });

    final idCompra151 = await txn.insert('Compra', {
      "id_proveedor": idProvRamiro,
      'fecha': '2025-03-25T09:00:00.000',
      'detalles': '41 kilos de cafe a ramiro (sepa la verga quien)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra151,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 41.0,
      'precio_unitario_compra': 114.44,
    });

    final idCompra152 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-04-01T09:00:00.000',
      'detalles': 'pago trabajadores (nomás yo y mi ama)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra152,
      'id_articulo': idArtSalario,
      'cantidad': 2.0,
      'precio_unitario_compra': 1250.00,
    });

    final idCompra153 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-04-02T09:00:00.000',
      'detalles': 'Biaticos gasolina',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra153,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra154 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-04-05T09:00:00.000',
      'detalles': '14 Kg de café en bola',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra154,
      'id_articulo': idArtcafecereza,
      'cantidad': 14.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra155 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-04-10T09:00:00.000',
      'detalles': 'café que compró franelas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra155,
      'id_articulo': idArtcafecereza,
      'cantidad': 50.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra156 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-04-10T09:00:00.000',
      'detalles': 'gasolina del café a Autlán ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra156,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 200.00,
    });

    final idCompra157 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-04-12T09:00:00.000',
      'detalles': 'café cordoba 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra157,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra158 = await txn.insert('Compra', {
      "id_proveedor": idProvAdrian,
      'fecha': '2025-04-12T09:00:00.000',
      'detalles': '156kg del muchacho',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra158,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 156.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra159 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-04-14T09:00:00.000',
      'detalles': '34kg al pendejonando',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra159,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 34.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra160 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2025-04-13T09:00:00.000',
      'detalles': 'Molino cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra160,
      'id_articulo': idArtMaquinaria,
      'cantidad': 1.0,
      'precio_unitario_compra': 10150.00,
    });

    final idCompra161 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-04-23T09:00:00.000',
      'detalles': 'gasolina Tamazula ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra161,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 150.00,
    });

    final idCompra162 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-04-24T09:00:00.000',
      'detalles': 'le debo a failo 1100',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra162,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 1100.00,
    });

    final idCompra163 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-04-24T09:00:00.000',
      'detalles': 'Se le debe a Vicente ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra163,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 800.00,
    });

    final idCompra164 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-04-28T09:00:00.000',
      'detalles': 'pago a emanuelito por ayudarme a no hacer nada',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra164,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 1500.00,
    });

    final idCompra165 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2025-04-29T09:00:00.000',
      'detalles': 'Molino cosas electricas y garbanzo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra165,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 100.0,
      'precio_unitario_compra': 46.40,
    });

    final idCompra166 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-04-29T09:00:00.000',
      'detalles': '35 kilos de no se que senora',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra166,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 35.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra167 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-04-30T09:00:00.000',
      'detalles': '8 kilos de café cereza ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra167,
      'id_articulo': idArtcafecereza,
      'cantidad': 8.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra168 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-05-03T09:00:00.000',
      'detalles': 'Pago trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra168,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra169 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-05-05T09:00:00.000',
      'detalles': 'Se le presto 30000 a Vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra169,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 30000.00,
    });

    final idCompra170 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2025-05-06T09:00:00.000',
      'detalles': 'refill tanque ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra170,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 605.00,
    });

    final idCompra171 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-05-10T09:00:00.000',
      'detalles': 'café cordoba 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra171,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra172 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-05-19T09:00:00.000',
      'detalles': 'Cafe que compro Vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra172,
      'id_articulo': idArtcafecereza,
      'cantidad': 10.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra173 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-05-19T09:00:00.000',
      'detalles': '7 Kilos a basuras nando ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra173,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 7.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra174 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2025-05-20T09:00:00.000',
      'detalles': '900 bolsas cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra174,
      'id_articulo': idArtbolsas,
      'cantidad': 900.0,
      'precio_unitario_compra': 7.41,
    });

    final idCompra175 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2025-05-21T09:00:00.000',
      'detalles': 'café feo de milio, 60 kilos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra175,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 60.0,
      'precio_unitario_compra': 85.00,
    });

    final idCompra176 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-05-24T09:00:00.000',
      'detalles': 'café cordoba 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra176,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra177 = await txn.insert('Compra', {
      "id_proveedor": idProvAdrian,
      'fecha': '2025-05-25T09:00:00.000',
      'detalles': '42kg al muchacho de no sé dónde ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra177,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 42.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra178 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-06-02T09:00:00.000',
      'detalles': 'Pago trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra178,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra179 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-06-02T09:00:00.000',
      'detalles': 'chapa para la cochera',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra179,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 280.00,
    });

    final idCompra180 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-06-05T09:00:00.000',
      'detalles': '180 etiquetas del cafe ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra180,
      'id_articulo': idArtEtiquetas,
      'cantidad': 180.0,
      'precio_unitario_compra': 4.00,
    });

    final idCompra181 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-06-07T09:00:00.000',
      'detalles': 'Café cordoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra181,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra182 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2025-06-07T09:00:00.000',
      'detalles': 'Molino nuevo, este si funciono',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra182,
      'id_articulo': idArtMaquinaria,
      'cantidad': 1.0,
      'precio_unitario_compra': 6500.00,
    });

    final idCompra183 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2025-06-17T09:00:00.000',
      'detalles': 'Etiquetas de Sayula',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra183,
      'id_articulo': idArtEtiquetas,
      'cantidad': 100.0,
      'precio_unitario_compra': 3.00,
    });

    final idCompra184 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-06-21T09:00:00.000',
      'detalles': 'Café cordoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra184,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra185 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-06-21T09:00:00.000',
      'detalles': 'Café de basuras nando',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra185,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 35.0,
      'precio_unitario_compra': 125.71,
    });

    final idCompra186 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-07-02T09:00:00.000',
      'detalles': 'Pago trabajadores ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra186,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1200.00,
    });

    final idCompra187 = await txn.insert('Compra', {
      "id_proveedor": idProvCartero,
      'fecha': '2025-07-04T09:00:00.000',
      'detalles': 'Cartero 33 kilos a 150',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra187,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 33.0,
      'precio_unitario_compra': 151.50,
    });

    final idCompra188 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2025-07-05T09:00:00.000',
      'detalles': 'Etiquetas de Sayula',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra188,
      'id_articulo': idArtEtiquetas,
      'cantidad': 100.0,
      'precio_unitario_compra': 3.00,
    });

    final idCompra189 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-07-05T09:00:00.000',
      'detalles': 'Café cordoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra189,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra190 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2025-07-12T09:00:00.000',
      'detalles': 'Refil tanque chico gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra190,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 150.00,
    });

    final idCompra191 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2025-07-12T09:00:00.000',
      'detalles': 'Refil tanque grande',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra191,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 600.00,
    });

    final idCompra192 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-07-18T09:00:00.000',
      'detalles': 'Se les presto 10000 a los jefes para la cosa del campamento',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra192,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 10000.00,
    });

    final idCompra193 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2025-07-19T09:00:00.000',
      'detalles': 'Bolsas de cafe 600 de cuarto, 300 de medio y 100 de kilo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra193,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 7.84,
    });

    final idCompra194 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-07-22T09:00:00.000',
      'detalles': 'Café cordoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra194,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra195 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-07-23T09:00:00.000',
      'detalles': '75 kilos de bola a 30 pesos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra195,
      'id_articulo': idArtbolita,
      'cantidad': 75.0,
      'precio_unitario_compra': 30.00,
    });

    final idCompra196 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-07-26T09:00:00.000',
      'detalles': 'Herramientas de cafe 70',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra196,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 70.00,
    });

    final idCompra197 = await txn.insert('Compra', {
      "id_proveedor": idProvNando,
      'fecha': '2025-08-02T09:00:00.000',
      'detalles': 'Se le volvió a comprar a pendejonando café a 115',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra197,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 25.0,
      'precio_unitario_compra': 115.20,
    });

    final idCompra198 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-08-02T09:00:00.000',
      'detalles': 'pago a trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra198,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1200.00,
    });

    final idCompra199 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-08-02T09:00:00.000',
      'detalles': 'Café cordova',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra199,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra200 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2025-08-05T09:00:00.000',
      'detalles': 'Etiquetas de Sayula',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra200,
      'id_articulo': idArtEtiquetas,
      'cantidad': 100.0,
      'precio_unitario_compra': 3.50,
    });

    final idCompra201 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-08-23T09:00:00.000',
      'detalles': 'café cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra201,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra202 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-09-01T09:00:00.000',
      'detalles': 'Pago trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra202,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra203 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-09-06T09:00:00.000',
      'detalles': 'café cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra203,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra204 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2025-09-12T09:00:00.000',
      'detalles': 'Refill tanque gas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra204,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 580.00,
    });

    final idCompra205 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2025-09-18T09:00:00.000',
      'detalles':
          '50 plantillas de etiquetas de café de Sayula 42 cada una, Nunca decir que me urgen, putos hambriados',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra205,
      'id_articulo': idArtEtiquetas,
      'cantidad': 1.0,
      'precio_unitario_compra': 2.10,
    });

    final idCompra206 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-09-20T09:00:00.000',
      'detalles': 'Café Cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra206,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra207 = await txn.insert('Compra', {
      "id_proveedor": idProvTecnologiaDeEmpaquesFlexibles,
      'fecha': '2025-09-27T09:00:00.000',
      'detalles':
          '800 bolsas ruperto 400 medio 400 cuarto (6176 y yo me clave el cambio)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra207,
      'id_articulo': idArtbolsas,
      'cantidad': 800.0,
      'precio_unitario_compra': 8.13,
    });

    final idCompra208 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-10-02T09:00:00.000',
      'detalles': 'Pago de trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra208,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra209 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-10-04T09:00:00.000',
      'detalles': 'Café Cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra209,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra210 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-10-17T09:00:00.000',
      'detalles': 'mesa para el festival de la tostada',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra210,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 1300.00,
    });

    final idCompra211 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-10-04T09:00:00.000',
      'detalles': 'Café Cordova 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra211,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra212 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-11-01T09:00:00.000',
      'detalles': 'café Córdoba 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra212,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra213 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-11-01T09:00:00.000',
      'detalles': 'Pago trabajadores ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra213,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra214 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2025-11-12T09:00:00.000',
      'detalles': 'bolita 100 KG',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra214,
      'id_articulo': idArtbolita,
      'cantidad': 100.0,
      'precio_unitario_compra': 30.00,
    });

    final idCompra215 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-11-12T09:00:00.000',
      'detalles': 'Regadera Failo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra215,
      'id_articulo': idArtMaquinaria,
      'cantidad': 1.0,
      'precio_unitario_compra': 200.00,
    });

    final idCompra216 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-11-14T09:00:00.000',
      'detalles': 'Suelto para la feria de la tostada',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra216,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 1500.00,
    });

    final idCompra217 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-11-15T09:00:00.000',
      'detalles': 'Suelto para la feria de la tostada',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra217,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 400.00,
    });

    final idCompra218 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-11-17T09:00:00.000',
      'detalles': 'una bolsa Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra218,
      'id_articulo': idArtcordoba,
      'cantidad': 60.0,
      'precio_unitario_compra': 7.00,
    });

    final idCompra219 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-11-17T09:00:00.000',
      'detalles': 'gasolina para Manuel ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra219,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 300.00,
    });

    final idCompra220 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-11-17T09:00:00.000',
      'detalles': 'Lonas Willy ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra220,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 300.00,
    });

    final idCompra221 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-11-17T09:00:00.000',
      'detalles': 'Dinero para mí ama',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra221,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra222 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2025-11-18T09:00:00.000',
      'detalles': 'refill tanque gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra222,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 600.00,
    });

    final idCompra223 = await txn.insert('Compra', {
      "id_proveedor": idProvPlasticosMexico,
      'fecha': '2025-11-20T09:00:00.000',
      'detalles': 'Bolsas al nuevo proveedor 1000',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra223,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 5.46,
    });

    final idCompra224 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-11-25T09:00:00.000',
      'detalles': 'cordoba 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra224,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra225 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2025-11-27T09:00:00.000',
      'detalles': 'etiquetas Sayula 50 laminas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra225,
      'id_articulo': idArtEtiquetas,
      'cantidad': 1.0,
      'precio_unitario_compra': 1.30,
    });

    final idCompra226 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-11-29T09:00:00.000',
      'detalles': 'cordoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra226,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra227 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-11-01T09:00:00.000',
      'detalles': '20mil del terreno primer pago',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra227,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 20000.00,
    });

    final idCompra228 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-12-03T09:00:00.000',
      'detalles': 'Pago trabajadores ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra228,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra229 = await txn.insert('Compra', {
      "id_proveedor": idProvLlamas,
      'fecha': '2025-12-06T09:00:00.000',
      'detalles': 'café de llamas 11.6k',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra229,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 12.0,
      'precio_unitario_compra': 120.69,
    });

    final idCompra230 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-12-09T09:00:00.000',
      'detalles': 'café bola que compro Vicente ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra230,
      'id_articulo': idArtcafecereza,
      'cantidad': 5.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra231 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-12-13T09:00:00.000',
      'detalles': 'café bola que compro Vicente ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra231,
      'id_articulo': idArtcafecereza,
      'cantidad': 6.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra232 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-12-13T09:00:00.000',
      'detalles': 'cordoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra232,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra233 = await txn.insert('Compra', {
      "id_proveedor": idProvPadreDonCegas,
      'fecha': '2025-12-13T09:00:00.000',
      'detalles': 'café que compro el padre',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra233,
      'id_articulo': idArtcafecereza,
      'cantidad': 1.0,
      'precio_unitario_compra': 150.00,
    });

    final idCompra234 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-12-13T09:00:00.000',
      'detalles': '7 kilos de café en cereza comprado a lulis',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra234,
      'id_articulo': idArtcafecereza,
      'cantidad': 7.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra235 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-12-15T09:00:00.000',
      'detalles': 'aguinaldo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra235,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra236 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2025-12-15T09:00:00.000',
      'detalles': 'Despulpadora',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra236,
      'id_articulo': idArtMaquinaria,
      'cantidad': 1.0,
      'precio_unitario_compra': 8000.00,
    });

    final idCompra237 = await txn.insert('Compra', {
      "id_proveedor": idProvMamonaCafecito,
      'fecha': '2025-12-17T09:00:00.000',
      'detalles':
          'café en cereza a la mamona del cafecito a 25 el kilo fueron 8k',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra237,
      'id_articulo': idArtcafecereza,
      'cantidad': 8.0,
      'precio_unitario_compra': 25.75,
    });

    final idCompra238 = await txn.insert('Compra', {
      "id_proveedor": idProvJavierOchoa,
      'fecha': '2025-12-20T09:00:00.000',
      'detalles': 'café cereza a Javier Ochoa 31 kilos ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra238,
      'id_articulo': idArtcafecereza,
      'cantidad': 31.0,
      'precio_unitario_compra': 25.16,
    });

    final idCompra239 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-12-20T09:00:00.000',
      'detalles': 'café que compro Vicente 200 pesos ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra239,
      'id_articulo': idArtcafecereza,
      'cantidad': 2.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra240 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2025-12-25T09:00:00.000',
      'detalles': 'Dinero a manuelito por ayudar',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra240,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra241 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-12-23T09:00:00.000',
      'detalles': 'Café en cereza que me compré a un señor ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra241,
      'id_articulo': idArtcafecereza,
      'cantidad': 9.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra242 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-12-25T09:00:00.000',
      'detalles': 'café en cereza que se le debe a Vicente (no se cuánto es)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra242,
      'id_articulo': idArtcafecereza,
      'cantidad': 40.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra243 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2025-12-27T09:00:00.000',
      'detalles': 'café Córdoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra243,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra244 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2025-12-29T09:00:00.000',
      'detalles': 'refill tanque gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra244,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 590.00,
    });

    final idCompra245 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2025-12-30T09:00:00.000',
      'detalles': 'Caffe en bola que se le compro a vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra245,
      'id_articulo': idArtcafecereza,
      'cantidad': 12.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra246 = await txn.insert('Compra', {
      "id_proveedor": idProvMamonaCafecito,
      'fecha': '2025-12-30T09:00:00.000',
      'detalles':
          'Cafe en bola que se le compro a la nora de la cafeteria y 9 kilos a 25 pesos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra246,
      'id_articulo': idArtcafecereza,
      'cantidad': 9.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra247 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2025-12-31T09:00:00.000',
      'detalles': 'café bola que le compré a un señor 34.4kg a 25 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra247,
      'id_articulo': idArtcafecereza,
      'cantidad': 34.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra248 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-01-02T09:00:00.000',
      'detalles': 'pago trabajadores (aumento)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra248,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1750.00,
    });

    final idCompra249 = await txn.insert('Compra', {
      "id_proveedor": idProvHermanoDeMilio,
      'fecha': '2026-01-05T09:00:00.000',
      'detalles': 'cafe culero del hermano de milio 27 kilos ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra249,
      'id_articulo': idArtcafecereza,
      'cantidad': 27.0,
      'precio_unitario_compra': 22.22,
    });

    final idCompra250 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-01-09T09:00:00.000',
      'detalles': 'café que le pagué a Vicente ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra250,
      'id_articulo': idArtcafecereza,
      'cantidad': 80.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra251 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-09T09:00:00.000',
      'detalles': 'café de magdalena, Juan y mercedes',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra251,
      'id_articulo': idArtcafecereza,
      'cantidad': 65.0,
      'precio_unitario_compra': 25.08,
    });

    final idCompra252 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2026-01-09T09:00:00.000',
      'detalles': 'Café que se le compro a milio 25 kilos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra252,
      'id_articulo': idArtcafecereza,
      'cantidad': 25.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra253 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-01-11T09:00:00.000',
      'detalles': 'Cafe Cordova 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra253,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra254 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-01-09T09:00:00.000',
      'detalles': '50000 que se le prestó a Vicente por las fiestas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra254,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 50000.00,
    });

    final idCompra255 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-11T09:00:00.000',
      'detalles': 'Café que se le compro al señor de la troca 14 kilos ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra255,
      'id_articulo': idArtcafecereza,
      'cantidad': 14.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra256 = await txn.insert('Compra', {
      "id_proveedor": idProvPlasticosMexico,
      'fecha': '2026-01-02T09:00:00.000',
      'detalles': 'Bolsas clifton packaging 1000 (800 de medio, 200 de cuarto)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra256,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 5.85,
    });

    final idCompra257 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-12T09:00:00.000',
      'detalles': 'café en bola comprado (kilos indeterminados)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra257,
      'id_articulo': idArtcafecereza,
      'cantidad': 130.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra258 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-01-12T09:00:00.000',
      'detalles': 'Café seco comprado 5 kilos al fanta',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra258,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 5.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra259 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-01-12T09:00:00.000',
      'detalles': 'Pago a Manuelito del niño jesús por ayudar al cafe',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra259,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 3000.00,
    });

    final idCompra260 = await txn.insert('Compra', {
      "id_proveedor": idProvMercedes,
      'fecha': '2026-01-13T09:00:00.000',
      'detalles': '12 kilos de café cereza de la señora Mercedes ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra260,
      'id_articulo': idArtcafecereza,
      'cantidad': 12.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra261 = await txn.insert('Compra', {
      "id_proveedor": idProvSenorTroca,
      'fecha': '2026-01-13T09:00:00.000',
      'detalles': '1.400 kg de café cereza del señor de la troca ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra261,
      'id_articulo': idArtcafecereza,
      'cantidad': 1.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra262 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-01-13T09:00:00.000',
      'detalles': '3 bolsas de café Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra262,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 2.08,
    });

    final idCompra263 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-01-16T09:00:00.000',
      'detalles': '61 kilos bola a 23 a cuñado de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra263,
      'id_articulo': idArtcafecereza,
      'cantidad': 61.0,
      'precio_unitario_compra': 22.95,
    });

    final idCompra264 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-01-16T09:00:00.000',
      'detalles':
          'No tengo ni idea de cuánto compro Vicente, pero en total son',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra264,
      'id_articulo': idArtcafecereza,
      'cantidad': 200.0,
      'precio_unitario_compra': 22.30,
    });

    final idCompra265 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-16T09:00:00.000',
      'detalles': '31 kilos en bola roja a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra265,
      'id_articulo': idArtcafecereza,
      'cantidad': 31.0,
      'precio_unitario_compra': 25.16,
    });

    final idCompra266 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-17T09:00:00.000',
      'detalles': '4.5 kilos a un señor de café verde',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra266,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 5.0,
      'precio_unitario_compra': 117.78,
    });

    final idCompra267 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-18T09:00:00.000',
      'detalles': '13 kilos bola roja a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra267,
      'id_articulo': idArtcafecereza,
      'cantidad': 13.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra268 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-18T09:00:00.000',
      'detalles': '5 en bola y 2.4 en verde ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra268,
      'id_articulo': idArtcafecereza,
      'cantidad': 7.0,
      'precio_unitario_compra': 57.14,
    });

    final idCompra269 = await txn.insert('Compra', {
      "id_proveedor": idProvHermanoDeMilio,
      'fecha': '2026-01-21T09:00:00.000',
      'detalles': '22 kilos al hermano de milio a 24',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra269,
      'id_articulo': idArtcafecereza,
      'cantidad': 22.0,
      'precio_unitario_compra': 24.09,
    });

    final idCompra270 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2026-01-21T09:00:00.000',
      'detalles': 'Caja de plastico',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra270,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 350.00,
    });

    final idCompra271 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-01-22T09:00:00.000',
      'detalles': '63 kilos en bola del cuñado de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra271,
      'id_articulo': idArtcafecereza,
      'cantidad': 63.0,
      'precio_unitario_compra': 25.08,
    });

    final idCompra272 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-01-24T09:00:00.000',
      'detalles': '850 de como 33 kilos de café en bola',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra272,
      'id_articulo': idArtcafecereza,
      'cantidad': 33.0,
      'precio_unitario_compra': 25.76,
    });

    final idCompra273 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-01-27T09:00:00.000',
      'detalles': '2 cajas de Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra273,
      'id_articulo': idArtcordoba,
      'cantidad': 1.2,
      'precio_unitario_compra': 6.93,
    });

    final idCompra274 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-01-27T09:00:00.000',
      'detalles': 'cafe en bola del cuñado de milio  41 kilos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra274,
      'id_articulo': idArtcafecereza,
      'cantidad': 41.0,
      'precio_unitario_compra': 23.90,
    });

    final idCompra275 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2026-01-27T09:00:00.000',
      'detalles': '31 kilos café bola de milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra275,
      'id_articulo': idArtcafecereza,
      'cantidad': 31.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra276 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-27T09:00:00.000',
      'detalles': '32 kilos de café en grano verde a 150',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra276,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 32.0,
      'precio_unitario_compra': 150.00,
    });

    final idCompra277 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-27T09:00:00.000',
      'detalles': '37 kilos de un señor a 23',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra277,
      'id_articulo': idArtcafecereza,
      'cantidad': 37.0,
      'precio_unitario_compra': 22.97,
    });

    final idCompra278 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-01-28T09:00:00.000',
      'detalles': '95 kilos de cafe en bola que compro Vicente',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra278,
      'id_articulo': idArtcafecereza,
      'cantidad': 95.0,
      'precio_unitario_compra': 22.16,
    });

    final idCompra279 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-01-30T09:00:00.000',
      'detalles': '25 kilos en verde a 160',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra279,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 25.0,
      'precio_unitario_compra': 160.00,
    });

    final idCompra280 = await txn.insert('Compra', {
      "id_proveedor": idProvMercedes,
      'fecha': '2026-02-01T09:00:00.000',
      'detalles': '17 kilos de café en cereza a 25 de mercedes',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra280,
      'id_articulo': idArtcafecereza,
      'cantidad': 17.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra281 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-02T09:00:00.000',
      'detalles': 'cafe verde en grano 13 kilos a 120',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra281,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 13.0,
      'precio_unitario_compra': 120.46,
    });

    final idCompra282 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2026-02-02T09:00:00.000',
      'detalles': '62 kilos de café en bola a 23 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra282,
      'id_articulo': idArtcafecereza,
      'cantidad': 62.0,
      'precio_unitario_compra': 23.13,
    });

    final idCompra283 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2026-02-02T09:00:00.000',
      'detalles': '58 kilos en bola a 23',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra283,
      'id_articulo': idArtcafecereza,
      'cantidad': 58.0,
      'precio_unitario_compra': 22.41,
    });

    final idCompra284 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-02-03T09:00:00.000',
      'detalles': 'pago trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra284,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1125.00,
    });

    final idCompra285 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2026-02-03T09:00:00.000',
      'detalles': 'cafe en bola de milio 18 kilos a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra285,
      'id_articulo': idArtcafecereza,
      'cantidad': 18.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra286 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-04T09:00:00.000',
      'detalles': '530 pesos de 21 kilos de cafe en bola a no se que senor',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra286,
      'id_articulo': idArtcafecereza,
      'cantidad': 21.0,
      'precio_unitario_compra': 25.24,
    });

    final idCompra287 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-02-03T09:00:00.000',
      'detalles': '27.5 kilos de cafe en grano del fanta',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra287,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 28.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra288 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '50 etiquetas del cafe de sayula',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra288,
      'id_articulo': idArtEtiquetas,
      'cantidad': 1.0,
      'precio_unitario_compra': 1.00,
    });

    final idCompra289 = await txn.insert('Compra', {
      "id_proveedor": idProvPeter,
      'fecha': '2026-02-05T09:00:00.000',
      'detalles': '62 kilos de café en bola a peter ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra289,
      'id_articulo': idArtcafecereza,
      'cantidad': 62.0,
      'precio_unitario_compra': 25.81,
    });

    final idCompra290 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-05T09:00:00.000',
      'detalles': '239 kilos de unos señores de tepec a 24 pesos',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra290,
      'id_articulo': idArtcafecereza,
      'cantidad': 239.0,
      'precio_unitario_compra': 24.00,
    });

    final idCompra291 = await txn.insert('Compra', {
      "id_proveedor": idProvPeter,
      'fecha': '2026-02-06T09:00:00.000',
      'detalles': '9 kilos de café a Piter a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra291,
      'id_articulo': idArtcafecereza,
      'cantidad': 9.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra292 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2026-02-06T09:00:00.000',
      'detalles': 'lona para el café despulado',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra292,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 160.00,
    });

    final idCompra293 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-02-06T09:00:00.000',
      'detalles': '108 kilos de café que compro Vicente a 23',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra293,
      'id_articulo': idArtcafecereza,
      'cantidad': 108.0,
      'precio_unitario_compra': 23.15,
    });

    final idCompra294 = await txn.insert('Compra', {
      "id_proveedor": idProvSenorGabanzo,
      'fecha': '2026-02-06T09:00:00.000',
      'detalles': 'anticipo del garbanzo 1 tonelada a 23 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra294,
      'id_articulo': idArtbolita,
      'cantidad': 500.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra295 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '10 bolsas de café Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra295,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 6.93,
    });

    final idCompra296 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '35 kilos a 20 del cuñado de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra296,
      'id_articulo': idArtcafecereza,
      'cantidad': 35.0,
      'precio_unitario_compra': 20.00,
    });

    final idCompra297 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '30 kilos a 23 del cuñado de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra297,
      'id_articulo': idArtcafecereza,
      'cantidad': 30.0,
      'precio_unitario_compra': 23.33,
    });

    final idCompra298 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '23 kilos a 23 del cuñado de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra298,
      'id_articulo': idArtcafecereza,
      'cantidad': 23.0,
      'precio_unitario_compra': 23.04,
    });

    final idCompra299 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '9 kilos de café verde (oro) a 140 para fanta ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra299,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 9.0,
      'precio_unitario_compra': 138.89,
    });

    final idCompra300 = await txn.insert('Compra', {
      "id_proveedor": idProvSenorGabanzo,
      'fecha': '2026-02-08T09:00:00.000',
      'detalles': 'resto del garbanzo de 1 tonelada a 23',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra300,
      'id_articulo': idArtbolita,
      'cantidad': 500.0,
      'precio_unitario_compra': 26.00,
    });

    final idCompra301 = await txn.insert('Compra', {
      "id_proveedor": idProvSenorGabanzo,
      'fecha': '2026-02-08T09:00:00.000',
      'detalles': '250 kilos extra que se compró  de garbanzo ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra301,
      'id_articulo': idArtbolita,
      'cantidad': 250.0,
      'precio_unitario_compra': 22.80,
    });

    final idCompra302 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2026-02-10T09:00:00.000',
      'detalles': 'contenedores para café 4 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra302,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 4.0,
      'precio_unitario_compra': 325.00,
    });

    final idCompra303 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2026-02-10T09:00:00.000',
      'detalles':
          'Resto de las etiquetas, 300. Fueron en total 1300 por 50 etiquetas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra303,
      'id_articulo': idArtEtiquetas,
      'cantidad': 300.0,
      'precio_unitario_compra': 1.00,
    });

    final idCompra304 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-02-10T09:00:00.000',
      'detalles': 'Gasolina para ir por el garbanzo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra304,
      'id_articulo': idArtMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 500.00,
    });

    final idCompra305 = await txn.insert('Compra', {
      "id_proveedor": idProvCristianTepec,
      'fecha': '2026-02-10T09:00:00.000',
      'detalles': 'cafe en bola a Cristian de tepec 182 kilos a 25 pesos ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra305,
      'id_articulo': idArtcafecereza,
      'cantidad': 182.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra306 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-11T09:00:00.000',
      'detalles':
          '60 kilos a 22 a un señor de camioneta café ford chocada del lado izquierdo en los faros',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra306,
      'id_articulo': idArtcafecereza,
      'cantidad': 60.0,
      'precio_unitario_compra': 22.00,
    });

    final idCompra307 = await txn.insert('Compra', {
      "id_proveedor": idProvPeter,
      'fecha': '2026-02-11T09:00:00.000',
      'detalles':
          '68.5 kilos al pendejo de Piter a 26 por el pendejo de mi papa',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra307,
      'id_articulo': idArtcafecereza,
      'cantidad': 69.0,
      'precio_unitario_compra': 25.99,
    });

    final idCompra308 = await txn.insert('Compra', {
      "id_proveedor": idProvPeter,
      'fecha': '2026-02-12T09:00:00.000',
      'detalles': '27 kilos al pendejo de Piter a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra308,
      'id_articulo': idArtcafecereza,
      'cantidad': 27.0,
      'precio_unitario_compra': 22.22,
    });

    final idCompra309 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-12T09:00:00.000',
      'detalles': 'Cosas para el despulpador electrico',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra309,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 700.00,
    });

    final idCompra310 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-12T09:00:00.000',
      'detalles': 'motor y cosas para armar ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra310,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 2000.00,
    });

    final idCompra311 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-02-12T09:00:00.000',
      'detalles': 'Cafe del cunado de milio a 23 fuero 105',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra311,
      'id_articulo': idArtcafecereza,
      'cantidad': 105.0,
      'precio_unitario_compra': 22.86,
    });

    final idCompra312 = await txn.insert('Compra', {
      "id_proveedor": idProvCristianTepec,
      'fecha': '2026-02-12T09:00:00.000',
      'detalles': 'Cafe de cristian, 98 a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra312,
      'id_articulo': idArtcafecereza,
      'cantidad': 98.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra313 = await txn.insert('Compra', {
      "id_proveedor": idProvMercedes,
      'fecha': '2026-02-13T09:00:00.000',
      'detalles': 'Mercedes 18 kilos a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra313,
      'id_articulo': idArtcafecereza,
      'cantidad': 18.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra314 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-13T09:00:00.000',
      'detalles': 'la otra señora, 23 kilos a 25 y medio de pergamino a 80',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra314,
      'id_articulo': idArtcafecereza,
      'cantidad': 23.0,
      'precio_unitario_compra': 26.74,
    });

    final idCompra315 = await txn.insert('Compra', {
      "id_proveedor": idProvPeter,
      'fecha': '2026-02-14T09:00:00.000',
      'detalles': 'Piter 33 kilos a 26 por llorón ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra315,
      'id_articulo': idArtcafecereza,
      'cantidad': 30.0,
      'precio_unitario_compra': 26.67,
    });

    final idCompra316 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-02-14T09:00:00.000',
      'detalles':
          '3000 pesos en kilos de café, kilos y precio de compra desconocido ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra316,
      'id_articulo': idArtcafecereza,
      'cantidad': 140.0,
      'precio_unitario_compra': 21.43,
    });

    final idCompra317 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-02-14T09:00:00.000',
      'detalles': '7.93 kilos de café a fanta a 140 pesos ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra317,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 8.0,
      'precio_unitario_compra': 139.97,
    });

    final idCompra318 = await txn.insert('Compra', {
      "id_proveedor": idProvCristianTepec,
      'fecha': '2026-02-17T09:00:00.000',
      'detalles': '123 kilos de café bola a 25 de Cristian tepec',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra318,
      'id_articulo': idArtcafecereza,
      'cantidad': 123.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra319 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2026-02-18T09:00:00.000',
      'detalles': '40 kilos de cafe bola a 25 de Milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra319,
      'id_articulo': idArtcafecereza,
      'cantidad': 40.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra320 = await txn.insert('Compra', {
      "id_proveedor": idProvAdrian,
      'fecha': '2026-02-19T09:00:00.000',
      'detalles': '137 kilos de café oro de Adrián a 140',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra320,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 137.0,
      'precio_unitario_compra': 140.15,
    });

    final idCompra321 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-02-21T09:00:00.000',
      'detalles': '10 bolsas de Córdoba (subió el precio)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra321,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.20,
    });

    final idCompra322 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-02-21T09:00:00.000',
      'detalles': '33 kilos de café al cuñado de milio a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra322,
      'id_articulo': idArtcafecereza,
      'cantidad': 33.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra323 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-02-21T09:00:00.000',
      'detalles': '5 kilos a fanta',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra323,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 5.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra324 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-02-24T09:00:00.000',
      'detalles': '41 kilos al cunado de milio a 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra324,
      'id_articulo': idArtcafecereza,
      'cantidad': 41.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra325 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-25T09:00:00.000',
      'detalles': 'cafe que se le compro a la vecina Lupe ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra325,
      'id_articulo': idArtcafecereza,
      'cantidad': 16.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra326 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-25T09:00:00.000',
      'detalles':
          '14 kilos de café en grano verde a un muchacho a 140 el kilo ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra326,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 14.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra327 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-02-27T09:00:00.000',
      'detalles': '52 kilos de café en bola a 23 de un señor chaparro de tepc',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra327,
      'id_articulo': idArtcafecereza,
      'cantidad': 52.0,
      'precio_unitario_compra': 23.08,
    });

    final idCompra328 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2026-02-28T09:00:00.000',
      'detalles': 'refill tanque de gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra328,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 560.00,
    });

    final idCompra329 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-02-28T09:00:00.000',
      'detalles': '6 kilos de cafe verde a fanta a 140',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra329,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 6.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra330 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-03-02T09:00:00.000',
      'detalles': '62 kilos de café bola al cuñado de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra330,
      'id_articulo': idArtcafecereza,
      'cantidad': 62.0,
      'precio_unitario_compra': 24.19,
    });

    final idCompra331 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-03-02T09:00:00.000',
      'detalles': '1100 pesos de café que compro Vicente ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra331,
      'id_articulo': idArtcafecereza,
      'cantidad': 50.0,
      'precio_unitario_compra': 22.00,
    });

    final idCompra332 = await txn.insert('Compra', {
      "id_proveedor": idProvMercedes,
      'fecha': '2026-03-03T09:00:00.000',
      'detalles': '7 kilos de cafe en bola para mercedes 25',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra332,
      'id_articulo': idArtcafecereza,
      'cantidad': 7.0,
      'precio_unitario_compra': 25.00,
    });

    final idCompra333 = await txn.insert('Compra', {
      "id_proveedor": idProvMercedes,
      'fecha': '2026-03-03T09:00:00.000',
      'detalles': 'Kilo y medio de nuez de mercedes a 300',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra333,
      'id_articulo': idArtcafecereza,
      'cantidad': 2.0,
      'precio_unitario_compra': 300.00,
    });

    final idCompra334 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-03-07T09:00:00.000',
      'detalles': '10 bolsas de Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra334,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.20,
    });

    final idCompra335 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-03-07T09:00:00.000',
      'detalles': '4 kilos comprados a fanta a 140',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra335,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 4.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra336 = await txn.insert('Compra', {
      "id_proveedor": idProvAdrian,
      'fecha': '2026-03-11T09:00:00.000',
      'detalles': '175 kilos de cafe (verde) comprados a adrian a 140 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra336,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 175.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra337 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-03-11T09:00:00.000',
      'detalles': 'Pago trabajadores ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra337,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1125.00,
    });

    final idCompra338 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-03-14T09:00:00.000',
      'detalles': '5.8 kilos de café verde grano a fanta a 140 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra338,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 6.0,
      'precio_unitario_compra': 140.17,
    });

    final idCompra339 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-03-07T09:00:00.000',
      'detalles': '10 bolsas de Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra339,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.20,
    });

    final idCompra340 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2026-03-21T09:00:00.000',
      'detalles': 'Café bola a milio ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra340,
      'id_articulo': idArtcafecereza,
      'cantidad': 89.0,
      'precio_unitario_compra': 24.42,
    });

    final idCompra341 = await txn.insert('Compra', {
      "id_proveedor": idProvPlasticosMexico,
      'fecha': '2026-03-21T09:00:00.000',
      'detalles': '1000 bolsas de cuarto',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra341,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 6.31,
    });

    final idCompra342 = await txn.insert('Compra', {
      "id_proveedor": idProvCunadoDeMilio,
      'fecha': '2026-03-25T09:00:00.000',
      'detalles': '70 kilos en bola a 23 del cuñado de milio',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra342,
      'id_articulo': idArtcafecereza,
      'cantidad': 70.0,
      'precio_unitario_compra': 23.00,
    });

    final idCompra343 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-03-26T09:00:00.000',
      'detalles': '4.64 kilos de café en grano verde a fanta a 140',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra343,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 5.0,
      'precio_unitario_compra': 140.09,
    });

    final idCompra344 = await txn.insert('Compra', {
      "id_proveedor": idProvLlamas,
      'fecha': '2026-03-30T09:00:00.000',
      'detalles': '26 kilos a llamas a 140',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra344,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 26.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra345 = await txn.insert('Compra', {
      "id_proveedor": idProvMiliano,
      'fecha': '2026-03-30T09:00:00.000',
      'detalles': '15 kilos de café verde a milio a 140',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra345,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 15.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra346 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-04-07T09:00:00.000',
      'detalles': '10 bolsas café Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra346,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra347 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-04-07T09:00:00.000',
      'detalles': 'Pago trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra347,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra348 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2026-04-16T09:00:00.000',
      'detalles': 'etiquetas Sayula 50 laminas primer pago',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra348,
      'id_articulo': idArtEtiquetas,
      'cantidad': 300.0,
      'precio_unitario_compra': 1.00,
    });

    final idCompra349 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-04-18T09:00:00.000',
      'detalles': 'Córdoba 10 bolsas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra349,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.20,
    });

    final idCompra350 = await txn.insert('Compra', {
      "id_proveedor": idProvBolasZacoalco,
      'fecha': '2026-04-22T09:00:00.000',
      'detalles': 'garbanzo  (deuda)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra350,
      'id_articulo': idArtMerma,
      'cantidad': 100.0,
      'precio_unitario_compra': 28.00,
    });

    final idCompra351 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2026-04-22T09:00:00.000',
      'detalles': 'Etiquetas sayula 50 laminas segundo pago',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra351,
      'id_articulo': idArtEtiquetas,
      'cantidad': 800.0,
      'precio_unitario_compra': 1.00,
    });

    final idCompra352 = await txn.insert('Compra', {
      "id_proveedor": idProvAdrian,
      'fecha': '2026-05-01T09:00:00.000',
      'detalles': '128kg de cafe verde grano a adrian a 140 el kilo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra352,
      'id_articulo': idArtcafeverdecalidadPremium,
      'cantidad': 128.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra353 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-05-05T09:00:00.000',
      'detalles': 'pago a trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra353,
      'id_articulo': idArtSalario,
      'cantidad': 4.0,
      'precio_unitario_compra': 1125.00,
    });

    final idCompra354 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-05-05T09:00:00.000',
      'detalles': '10 bolsas cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra354,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra355 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2026-05-14T09:00:00.000',
      'detalles': 'Desgranadora primer pago de 10000 faltan 2k',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra355,
      'id_articulo': idArtMaquinaria,
      'cantidad': 1.0,
      'precio_unitario_compra': 10000.00,
    });

    final idCompra356 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-05-16T09:00:00.000',
      'detalles': '10 bolsas cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra356,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra357 = await txn.insert('Compra', {
      "id_proveedor": idProvVicente,
      'fecha': '2026-05-17T09:00:00.000',
      'detalles': 'Se le prestaron 10000 pesos a Vicente por las fiestas ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra357,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 10000.00,
    });

    final idCompra358 = await txn.insert('Compra', {
      "id_proveedor": idProvMercadoLibre,
      'fecha': '2026-05-19T09:00:00.000',
      'detalles': 'Segundo pago de la desgranadora 2348',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra358,
      'id_articulo': idArtMaquinaria,
      'cantidad': 1.0,
      'precio_unitario_compra': 2348.00,
    });

    final idCompra359 = await txn.insert('Compra', {
      "id_proveedor": idProvOmar,
      'fecha': '2026-05-23T09:00:00.000',
      'detalles': 'Se le prestaron 40000 a tío omar',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra359,
      'id_articulo': idArtPrestamo,
      'cantidad': 1.0,
      'precio_unitario_compra': 40000.00,
    });

    final idCompra360 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-05-30T09:00:00.000',
      'detalles': '10 bolsas cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra360,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra361 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2026-06-05T09:00:00.000',
      'detalles': 'Manguera reforzada de acero inoxidable y conectores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra361,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 400.00,
    });

    final idCompra362 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2026-06-05T09:00:00.000',
      'detalles': 'Refill tanque gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra362,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 600.00,
    });

    final idCompra363 = await txn.insert('Compra', {
      "id_proveedor": idProvPlasticosMexico,
      'fecha': '2026-06-06T09:00:00.000',
      'detalles': 'Bolsas de cafe 600 de cuarto, 300 de medio y 100 de kilo',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra363,
      'id_articulo': idArtbolsas,
      'cantidad': 1.0,
      'precio_unitario_compra': 7.13,
    });

    final idCompra364 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-06-13T09:00:00.000',
      'detalles': '10 bolsas de Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra364,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra365 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-06-13T09:00:00.000',
      'detalles': 'Pago a trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra365,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra366 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2026-06-25T09:00:00.000',
      'detalles': 'Etiquetas 50 plantillas de 20',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra366,
      'id_articulo': idArtEtiquetas,
      'cantidad': 1.0,
      'precio_unitario_compra': 1.30,
    });

    final idCompra367 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-06-27T09:00:00.000',
      'detalles': '10 bolsas de Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra367,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra368 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-07-11T09:00:00.000',
      'detalles': '10 bolsas de Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra368,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra369 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-07-17T09:00:00.000',
      'detalles': 'Pago trabajadores',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra369,
      'id_articulo': idArtSalario,
      'cantidad': 5.0,
      'precio_unitario_compra': 1000.00,
    });

    final idCompra370 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-07-21T09:00:00.000',
      'detalles': 'pago registro de marca ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra370,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 2813.77,
    });

    final idCompra371 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-07-22T09:00:00.000',
      'detalles': 'interruptor 30a ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra371,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 250.00,
    });

    final idCompra372 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-07-23T09:00:00.000',
      'detalles': 'Centro de carga de 4 U',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra372,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 564.00,
    });

    final idCompra373 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-07-23T09:00:00.000',
      'detalles': 'Unidad Termica 40 A',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra373,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 239.00,
    });

    final idCompra374 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-07-23T09:00:00.000',
      'detalles': 'Cable AWG 10 10M',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra374,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 260.00,
    });

    final idCompra375 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-07-23T09:00:00.000',
      'detalles': 'interruptor  40A ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra375,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 833.00,
    });

    final idCompra376 = await txn.insert('Compra', {
      "id_proveedor": idProvSinTecho,
      'fecha': '2026-07-23T09:00:00.000',
      'detalles':
          'Cafe culero del sin techo No supe ni cuanto es ni a cuanto se lo vendio 4.5KG',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra376,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 5.0,
      'precio_unitario_compra': 112.00,
    });

    final idCompra377 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-07-23T09:00:00.000',
      'detalles': 'Macio instalacion',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra377,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 300.00,
    });

    final idCompra378 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-07-25T09:00:00.000',
      'detalles': 'Córdoba 10 bolsas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra378,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra379 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2026-07-29T09:00:00.000',
      'detalles': 'Refill tanque gas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra379,
      'id_articulo': idArtGas,
      'cantidad': 1.0,
      'precio_unitario_compra': 592.00,
    });

    final idCompra380 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-08-08T09:00:00.000',
      'detalles': 'Cafe Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra380,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra381 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-08-22T09:00:00.000',
      'detalles': 'Cafe Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra381,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra382 = await txn.insert('Compra', {
      "id_proveedor": idProvPlasticosMexico,
      'fecha': '2026-08-22T09:00:00.000',
      'detalles': 'Bolsas 2000',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra382,
      'id_articulo': idArtbolsas,
      'cantidad': 2.0,
      'precio_unitario_compra': 7.16,
    });

    final idCompra383 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-08-22T09:00:00.000',
      'detalles': 'Pago trabajadores (Solo yo y mane)',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra383,
      'id_articulo': idArtSalario,
      'cantidad': 2.0,
      'precio_unitario_compra': 1250.00,
    });

    final idCompra384 = await txn.insert('Compra', {
      "id_proveedor": idProvRamiro,
      'fecha': '2026-08-24T09:00:00.000',
      'detalles': '130 x 24 kilos cafe verde ramiro',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra384,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 24.0,
      'precio_unitario_compra': 130.00,
    });

    final idCompra385 = await txn.insert('Compra', {
      "id_proveedor": idProvFanta,
      'fecha': '2026-08-26T09:00:00.000',
      'detalles': 'Fanta 1.7145 kilos a 140 ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra385,
      'id_articulo': idArtcafeverdecalidadBuena,
      'cantidad': 2.0,
      'precio_unitario_compra': 140.00,
    });

    final idCompra386 = await txn.insert('Compra', {
      "id_proveedor": idProvEtiquetasSayula,
      'fecha': '2026-09-03T09:00:00.000',
      'detalles': '50 laminas de etiquetas sayula',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra386,
      'id_articulo': idArtEtiquetas,
      'cantidad': 1.0,
      'precio_unitario_compra': 1.30,
    });

    final idCompra387 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-09-05T09:00:00.000',
      'detalles': 'Cafe Córdoba ',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra387,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra388 = await txn.insert('Compra', {
      "id_proveedor": idProvValdivia,
      'fecha': '2026-09-06T09:00:00.000',
      'detalles': 'Dinero para chonfi por ayudar',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra388,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 200.00,
    });

    final idCompra389 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-09-08T09:00:00.000',
      'detalles':
          'Cafe de un muchacho, cafe verde baja calidad 120 el kilo fueron 10kg',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra389,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 10.0,
      'precio_unitario_compra': 120.00,
    });

    final idCompra390 = await txn.insert('Compra', {
      "id_proveedor": idProvJohnDoe,
      'fecha': '2026-09-08T09:00:00.000',
      'detalles': 'Pago por traer etiquetas al camionero',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra390,
      'id_articulo': idArtSalario,
      'cantidad': 1.0,
      'precio_unitario_compra': 50.00,
    });

    final idCompra391 = await txn.insert('Compra', {
      "id_proveedor": idProvTablitas,
      'fecha': '2026-09-09T09:00:00.000',
      'detalles': 'Reparacion del arnero',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra391,
      'id_articulo': idArtTrabajoPartesNoMerma,
      'cantidad': 1.0,
      'precio_unitario_compra': 100.00,
    });

    final idCompra392 = await txn.insert('Compra', {
      "id_proveedor": idProvSinTecho,
      'fecha': '2026-09-13T09:00:00.000',
      'detalles': 'Otros 500 pesos de mas cafe culero',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra392,
      'id_articulo': idArtcafeverdecalidadbasura,
      'cantidad': 4.0,
      'precio_unitario_compra': 125.00,
    });

    final idCompra393 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-09-19T09:00:00.000',
      'detalles': '10 bolsas cordobas',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra393,
      'id_articulo': idArtcordoba,
      'cantidad': 600.0,
      'precio_unitario_compra': 8.23,
    });

    final idCompra394 = await txn.insert('Compra', {
      "id_proveedor": idProvGas,
      'fecha': '2026-09-26T09:00:00.000',
      'detalles': 'Refill Tanque',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra394,
      'id_articulo': idArtGas,
      'cantidad': 1,
      'precio_unitario_compra': 600,
    });

    final idCompra395 = await txn.insert('Compra', {
      "id_proveedor": idProvFernandoArmando,
      'fecha': '2026-10-03T09:00:00.000',
      'detalles': '20 bolsas cordoba',
      'pagado': 1,
    });

    await txn.insert('Detalle_Compra', {
      "id_compra": idCompra395,
      'id_articulo': idArtcordoba,
      'cantidad': 1200.0,
      'precio_unitario_compra': 8.23,
    });
    // // ============================================================
    // // 7. VENTAS (3 transacciones)
    // // ============================================================

    final idVenta1 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta2 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta2,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 240,
    });

    final idVenta3 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta3,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta4 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta4,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta5 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta5,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta6 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta6,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta7 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta7,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta8 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta8,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 240,
    });

    final idVenta9 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta9,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta10 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta10,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta11 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta11,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta12 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta12,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta13 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta13,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta14 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta14,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta15 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta15,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 240,
    });

    final idVenta16 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta16,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta17 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta17,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta18 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta18,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta19 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta19,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta20 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta20,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta21 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta21,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta22 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta22,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta23 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta23,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta24 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta24,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta25 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta25,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 240,
    });

    final idVenta26 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta26,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta27 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta27,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta28 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta28,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta29 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta29,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta30 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta30,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 240,
    });

    final idVenta31 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta31,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 240,
    });

    final idVenta32 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta32,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta33 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta33,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta34 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta34,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta35 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta35,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta36 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta36,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta37 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta37,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta38 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta38,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta39 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta39,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta40 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta40,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta41 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta41,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta42 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta42,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 240,
    });

    final idVenta43 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta43,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta44 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta44,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 240,
    });

    final idVenta45 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta45,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta46 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta46,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta47 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta47,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 240,
    });

    final idVenta48 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta48,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta49 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta49,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta50 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta50,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta51 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta51,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta52 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta52,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta53 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta53,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta54 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta54,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta55 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta55,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta56 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta56,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta57 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta57,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta58 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta58,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta59 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta59,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta60 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta60,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 240,
    });

    final idVenta61 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta61,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta62 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta62,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 240,
    });

    final idVenta63 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta63,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta64 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta64,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 240,
    });

    final idVenta65 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta65,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta66 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta66,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta67 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta67,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta68 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta68,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta69 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta69,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 240,
    });

    final idVenta70 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta70,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 240,
    });

    final idVenta71 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta71,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta72 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta72,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta73 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta73,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta74 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta74,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta75 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta75,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta76 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-02-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta76,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta77 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta77,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta78 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta78,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 240,
    });

    final idVenta79 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta79,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta80 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta80,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta81 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta81,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta82 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta82,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 240,
    });

    final idVenta83 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta83,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 240,
    });

    final idVenta84 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta84,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta85 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta85,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 240,
    });

    final idVenta86 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta86,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 15,
      'precio_unitario_venta': 240,
    });

    final idVenta87 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta87,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta88 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta88,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta89 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta89,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta90 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta90,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 240,
    });

    final idVenta91 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta91,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta92 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta92,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 240,
    });

    final idVenta93 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta93,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta94 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta94,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta95 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta95,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta96 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta96,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta97 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta97,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 240,
    });

    final idVenta98 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta98,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta99 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta99,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta100 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta100,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta101 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta101,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta102 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta102,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta103 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta103,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta104 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta104,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta105 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta105,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta106 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta106,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta107 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta107,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 240,
    });

    final idVenta108 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-03-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta108,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 240,
    });

    final idVenta109 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta109,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta110 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta110,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta111 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta111,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta112 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta112,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta113 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta113,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta114 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta114,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta115 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta115,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta116 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta116,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta117 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta117,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta118 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta118,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta119 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta119,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta120 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta120,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta121 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta121,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta122 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta122,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta123 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta123,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta124 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta124,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta125 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta125,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta126 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta126,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta127 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta127,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta128 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta128,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta129 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta129,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta130 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta130,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta131 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta131,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta132 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta132,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta133 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta133,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta134 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta134,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta135 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta135,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta136 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta136,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta137 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta137,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta138 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta138,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta139 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta139,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta140 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta140,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta141 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta141,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta142 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta142,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta143 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta143,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta144 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta144,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta145 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta145,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta146 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta146,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta147 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta147,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 240,
    });

    final idVenta148 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta148,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta149 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-04-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta149,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta150 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta150,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta151 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta151,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 240,
    });

    final idVenta152 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta152,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta153 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta153,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta154 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta154,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta155 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta155,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 260,
    });

    final idVenta156 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta156,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta157 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta157,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta158 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta158,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta159 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta159,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta160 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta160,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta161 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta161,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta162 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta162,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta163 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta163,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta164 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta164,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta165 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta165,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta166 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta166,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta167 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta167,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta168 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta168,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta169 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta169,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta170 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta170,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 260,
    });

    final idVenta171 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta171,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta172 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta172,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 15,
      'precio_unitario_venta': 260,
    });

    final idVenta173 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta173,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.25,
      'precio_unitario_venta': 260,
    });

    final idVenta174 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta174,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta175 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta175,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta176 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta176,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta177 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta177,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta178 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta178,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 260,
    });

    final idVenta179 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta179,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta180 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta180,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta181 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta181,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta182 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta182,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta183 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta183,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta184 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta184,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 260,
    });

    final idVenta185 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta185,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta186 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta186,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta187 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta187,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 260,
    });

    final idVenta188 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta188,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta189 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta189,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta190 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta190,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta191 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta191,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 240,
    });

    final idVenta192 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta192,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta193 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta193,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta194 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta194,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta195 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta195,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta196 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta196,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta197 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta197,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta198 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta198,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta199 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta199,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta200 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta200,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta201 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta201,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta202 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta202,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta203 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta203,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta204 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta204,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 260,
    });

    final idVenta205 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta205,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta206 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta206,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta207 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta207,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta208 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta208,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta209 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta209,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta210 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta210,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta211 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta211,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta212 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta212,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta213 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta213,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta214 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta214,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta215 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta215,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta216 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta216,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta217 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta217,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta218 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta218,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta219 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta219,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta220 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta220,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta221 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta221,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta222 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta222,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta223 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta223,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta224 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta224,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta225 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta225,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta226 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta226,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta227 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta227,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta228 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta228,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta229 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta229,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta230 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta230,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta231 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta231,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta232 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta232,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta233 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta233,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta234 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta234,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta235 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-06-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta235,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 260,
    });

    final idVenta236 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta236,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta237 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta237,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta238 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta238,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta239 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta239,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta240 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta240,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 260,
    });

    final idVenta241 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta241,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta242 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta242,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta243 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta243,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta244 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta244,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta245 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta245,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta246 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta246,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta247 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta247,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta248 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta248,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta249 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta249,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta250 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta250,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta251 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta251,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta252 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta252,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta253 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta253,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta254 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta254,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta255 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta255,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta256 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta256,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta257 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta257,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta258 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta258,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta259 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta259,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta260 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta260,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta261 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta261,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta262 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta262,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta263 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta263,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta264 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta264,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta265 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta265,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta266 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta266,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 260,
    });

    final idVenta267 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta267,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta268 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta268,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta269 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta269,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta270 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta270,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta271 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta271,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta272 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta272,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 9,
      'precio_unitario_venta': 260,
    });

    final idVenta273 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta273,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta274 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta274,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta275 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta275,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 260,
    });

    final idVenta276 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta276,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta277 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta277,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta278 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta278,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta279 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-07-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta279,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta280 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta280,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta281 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta281,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 260,
    });

    final idVenta282 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta282,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta283 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta283,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 260,
    });

    final idVenta284 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta284,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta285 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta285,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta286 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta286,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta287 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta287,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta288 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta288,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta289 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta289,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta290 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta290,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta291 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta291,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta292 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta292,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta293 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta293,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta294 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta294,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta295 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta295,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta296 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta296,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta297 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta297,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta298 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta298,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta299 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta299,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta300 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta300,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta301 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta301,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta302 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta302,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta303 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta303,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta304 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta304,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta305 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta305,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta306 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta306,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta307 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta307,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 260,
    });

    final idVenta308 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta308,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 260,
    });

    final idVenta309 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta309,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta310 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta310,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 260,
    });

    final idVenta311 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta311,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta312 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta312,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 260,
    });

    final idVenta313 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta313,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta314 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta314,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8.5,
      'precio_unitario_venta': 260,
    });

    final idVenta315 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta315,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta316 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta316,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10.75,
      'precio_unitario_venta': 260,
    });

    final idVenta317 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta317,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 260,
    });

    final idVenta318 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta318,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta319 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta319,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 260,
    });

    final idVenta320 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta320,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta321 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta321,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta322 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta322,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta323 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta323,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta324 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta324,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 260,
    });

    final idVenta325 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta325,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta326 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta326,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta327 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta327,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta328 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta328,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta329 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta329,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta330 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta330,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta331 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta331,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta332 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta332,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta333 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta333,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta334 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta334,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta335 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta335,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta336 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta336,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta337 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta337,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta338 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta338,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta339 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta339,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta340 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta340,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta341 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta341,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta342 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta342,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta343 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta343,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 260,
    });

    final idVenta344 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta344,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta345 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-09-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta345,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta346 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta346,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta347 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta347,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta348 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta348,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta349 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta349,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta350 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta350,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta351 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta351,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 260,
    });

    final idVenta352 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta352,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta353 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta353,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta354 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta354,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta355 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta355,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta356 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta356,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 260,
    });

    final idVenta357 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta357,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta358 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta358,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 260,
    });

    final idVenta359 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta359,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta360 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta360,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta361 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta361,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta362 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta362,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta363 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta363,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 260,
    });

    final idVenta364 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta364,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.5,
      'precio_unitario_venta': 260,
    });

    final idVenta365 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta365,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta366 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta366,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta367 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta367,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta368 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta368,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta369 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta369,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta370 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta370,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta371 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta371,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta372 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta372,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta373 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta373,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta374 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta374,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta375 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta375,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta376 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta376,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta377 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-10-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta377,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta378 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta378,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta379 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta379,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta380 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta380,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta381 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta381,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta382 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta382,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 260,
    });

    final idVenta383 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta383,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta384 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta384,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta385 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta385,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta386 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta386,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta387 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta387,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta388 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta388,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta389 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta389,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta390 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta390,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta391 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta391,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta392 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta392,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta393 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta393,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta394 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta394,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta395 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta395,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta396 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta396,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta397 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta397,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta398 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta398,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta399 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta399,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta400 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta400,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta401 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta401,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 260,
    });

    final idVenta402 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta402,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 260,
    });

    final idVenta403 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta403,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 260,
    });

    final idVenta404 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta404,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta405 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta405,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 260,
    });

    final idVenta406 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta406,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta407 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta407,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta408 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta408,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta409 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta409,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta410 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta410,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta411 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta411,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta412 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta412,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta413 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-11-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta413,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta414 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta414,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta415 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta415,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta416 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta416,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta417 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta417,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta418 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta418,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta419 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta419,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta420 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta420,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta421 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta421,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta422 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta422,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta423 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta423,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta424 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta424,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta425 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta425,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 260,
    });

    final idVenta426 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta426,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta427 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta427,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta428 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta428,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta429 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta429,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta430 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta430,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 260,
    });

    final idVenta431 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta431,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta432 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta432,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta433 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta433,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta434 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta434,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta435 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta435,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta436 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta436,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta437 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta437,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta438 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta438,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 260,
    });

    final idVenta439 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta439,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta440 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta440,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta441 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta441,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta442 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta442,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta443 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta443,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta444 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta444,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta445 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta445,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta446 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta446,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta447 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta447,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta448 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta448,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta449 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta449,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.5,
      'precio_unitario_venta': 260,
    });

    final idVenta450 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta450,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta451 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2024-12-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta451,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta452 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta452,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta453 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta453,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta454 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta454,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta455 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta455,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta456 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta456,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta457 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta457,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta458 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta458,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta459 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta459,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta460 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta460,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta461 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta461,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 260,
    });

    final idVenta462 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta462,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta463 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta463,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta464 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta464,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta465 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta465,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta466 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta466,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta467 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta467,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta468 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta468,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta469 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta469,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta470 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta470,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 260,
    });

    final idVenta471 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta471,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 260,
    });

    final idVenta472 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta472,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta473 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta473,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta474 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta474,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta475 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta475,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 260,
    });

    final idVenta476 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta476,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 260,
    });

    final idVenta477 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta477,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta478 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta478,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 260,
    });

    final idVenta479 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta479,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta480 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta480,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.25,
      'precio_unitario_venta': 260,
    });

    final idVenta481 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta481,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta482 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta482,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta483 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta483,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta484 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta484,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta485 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta485,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta486 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta486,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta487 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta487,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta488 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta488,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta489 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta489,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta490 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta490,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta491 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta491,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta492 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta492,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta493 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta493,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta494 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta494,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta495 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta495,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta496 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta496,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta497 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta497,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta498 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta498,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta499 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta499,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta500 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta500,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 280,
    });

    final idVenta501 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta501,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta502 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta502,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta503 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta503,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta504 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta504,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta505 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta505,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 280,
    });

    final idVenta506 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta506,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta507 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta507,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta508 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta508,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta509 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta509,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta510 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-02-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta510,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta511 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta511,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta512 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta512,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta513 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta513,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta514 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta514,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 280,
    });

    final idVenta515 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta515,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta516 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta516,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 9,
      'precio_unitario_venta': 280,
    });

    final idVenta517 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta517,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.5,
      'precio_unitario_venta': 280,
    });

    final idVenta518 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta518,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta519 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta519,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 280,
    });

    final idVenta520 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta520,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta521 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta521,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta522 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta522,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta523 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta523,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta524 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta524,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta525 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta525,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta526 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta526,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta527 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta527,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta528 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta528,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta529 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta529,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta530 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta530,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta531 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta531,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 280,
    });

    final idVenta532 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta532,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta533 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta533,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 280,
    });

    final idVenta534 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta534,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta535 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta535,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta536 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-03-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta536,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta537 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta537,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta538 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta538,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta539 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta539,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta540 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta540,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta541 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta541,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 280,
    });

    final idVenta542 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta542,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta543 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta543,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta544 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta544,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta545 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta545,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta546 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta546,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta547 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta547,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta548 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta548,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta549 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta549,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta550 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta550,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta551 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta551,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 280,
    });

    final idVenta552 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta552,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta553 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta553,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta554 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta554,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta555 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta555,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta556 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta556,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta557 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta557,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta558 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta558,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta559 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta559,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta560 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta560,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta561 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta561,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta562 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta562,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 280,
    });

    final idVenta563 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta563,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta564 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta564,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta565 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta565,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta566 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta566,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta567 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta567,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta568 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta568,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta569 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta569,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta570 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta570,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta571 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta571,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta572 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta572,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta573 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-04-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta573,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta574 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta574,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta575 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta575,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.1,
      'precio_unitario_venta': 280,
    });

    final idVenta576 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta576,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta577 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta577,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta578 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta578,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta579 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta579,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta580 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta580,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta581 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta581,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta582 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta582,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta583 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta583,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta584 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta584,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta585 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta585,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta586 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta586,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta587 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta587,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta588 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta588,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta589 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta589,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 280,
    });

    final idVenta590 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta590,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta591 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta591,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta592 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta592,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta593 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta593,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta594 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta594,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta595 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta595,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta596 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta596,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta597 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta597,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta598 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta598,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta599 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta599,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta600 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta600,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta601 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta601,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta602 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta602,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta603 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta603,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta604 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta604,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta605 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta605,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta606 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta606,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta607 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta607,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta608 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta608,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta609 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta609,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta610 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta610,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta611 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta611,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta612 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta612,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta613 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta613,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta614 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta614,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta615 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta615,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta616 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta616,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta617 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta617,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta618 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta618,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta619 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta619,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 280,
    });

    final idVenta620 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta620,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta621 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta621,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta622 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta622,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta623 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta623,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta624 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta624,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta625 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta625,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta626 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta626,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta627 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta627,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta628 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta628,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta629 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta629,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta630 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta630,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta631 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta631,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta632 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta632,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta633 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta633,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta634 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2023-12-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta634,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 37,
      'precio_unitario_venta': 240,
    });

    final idVenta635 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta635,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta636 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta636,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta637 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta637,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta638 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta638,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta639 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta639,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta640 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta640,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta641 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta641,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.208,
      'precio_unitario_venta': 240,
    });

    final idVenta642 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta642,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta643 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta643,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta644 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta644,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta645 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta645,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta646 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta646,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta647 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta647,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta648 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta648,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta649 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta649,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta650 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta650,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta651 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta651,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta652 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta652,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 240,
    });

    final idVenta653 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta653,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta654 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta654,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta655 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta655,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 240,
    });

    final idVenta656 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta656,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta657 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta657,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta658 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta658,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta659 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta659,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta660 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta660,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta661 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta661,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 18.5,
      'precio_unitario_venta': 240,
    });

    final idVenta662 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta662,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta663 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta663,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta664 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta664,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta665 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta665,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta666 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta666,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta667 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta667,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta668 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta668,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta669 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta669,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta670 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta670,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta671 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta671,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta672 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta672,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta673 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta673,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta674 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta674,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta675 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta675,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta676 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta676,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta677 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta677,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta678 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta678,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 240,
    });

    final idVenta679 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta679,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta680 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta680,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta681 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta681,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta682 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta682,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta683 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta683,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta684 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta684,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta685 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta685,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta686 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta686,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta687 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta687,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta688 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta688,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta689 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta689,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta690 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta690,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta691 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta691,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta692 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta692,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta693 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta693,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta694 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta694,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta695 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta695,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta696 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta696,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta697 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta697,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta698 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta698,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta699 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta699,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta700 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta700,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta701 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta701,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta702 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta702,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta703 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta703,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta704 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta704,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 240,
    });

    final idVenta705 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta705,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta706 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta706,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta707 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta707,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta708 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta708,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 240,
    });

    final idVenta709 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta709,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta710 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta710,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta711 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta711,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta712 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta712,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta713 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta713,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta714 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta714,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 240,
    });

    final idVenta715 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta715,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta716 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta716,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta717 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-02-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta717,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta718 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta718,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta719 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta719,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta720 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta720,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta721 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta721,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta722 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta722,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta723 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta723,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta724 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta724,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta725 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta725,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta726 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta726,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta727 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta727,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta728 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta728,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta729 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta729,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta730 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta730,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta731 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta731,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta732 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta732,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta733 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta733,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta734 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta734,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta735 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta735,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta736 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta736,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta737 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta737,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta738 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta738,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta739 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta739,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta740 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta740,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 240,
    });

    final idVenta741 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta741,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta742 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta742,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta743 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta743,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta744 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta744,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 240,
    });

    final idVenta745 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta745,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta746 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-03-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta746,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta747 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta747,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 240,
    });

    final idVenta748 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta748,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta749 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta749,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta750 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta750,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta751 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta751,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta752 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta752,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta753 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta753,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta754 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta754,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta755 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta755,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 240,
    });

    final idVenta756 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta756,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta757 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta757,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta758 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta758,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta759 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta759,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta760 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta760,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta761 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta761,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta762 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta762,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta763 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta763,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.5,
      'precio_unitario_venta': 240,
    });

    final idVenta764 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta764,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta765 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta765,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta766 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta766,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta767 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta767,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta768 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta768,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta769 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta769,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta770 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta770,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta771 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta771,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta772 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta772,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta773 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta773,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta774 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta774,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 240,
    });

    final idVenta775 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta775,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 240,
    });

    final idVenta776 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta776,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta777 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta777,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta778 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta778,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 240,
    });

    final idVenta779 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta779,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta780 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta780,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta781 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-04-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta781,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta782 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta782,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta783 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta783,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta784 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta784,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta785 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta785,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 260,
    });

    final idVenta786 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta786,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta787 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta787,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta788 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta788,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta789 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta789,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta790 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta790,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta791 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta791,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta792 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta792,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta793 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta793,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta794 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta794,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta795 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta795,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta796 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta796,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta797 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta797,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta798 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta798,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.75,
      'precio_unitario_venta': 260,
    });

    final idVenta799 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta799,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta800 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta800,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta801 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta801,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta802 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta802,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta803 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta803,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta804 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta804,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta805 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta805,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta806 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta806,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta807 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta807,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta808 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta808,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 260,
    });

    final idVenta809 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta809,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta810 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta810,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta811 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta811,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta812 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta812,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta813 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta813,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta814 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta814,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 260,
    });

    final idVenta815 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta815,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta816 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta816,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta817 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta817,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta818 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta818,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta819 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta819,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta820 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta820,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta821 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta821,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta822 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta822,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta823 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta823,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta824 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta824,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 260,
    });

    final idVenta825 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta825,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 260,
    });

    final idVenta826 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta826,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta827 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta827,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta828 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta828,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta829 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta829,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta830 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta830,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta831 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta831,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta832 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta832,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta833 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-06-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta833,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta834 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta834,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta835 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta835,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta836 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta836,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 260,
    });

    final idVenta837 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta837,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta838 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta838,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta839 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta839,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta840 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta840,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta841 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta841,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta842 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta842,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta843 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta843,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta844 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta844,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 260,
    });

    final idVenta845 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta845,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta846 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta846,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta847 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta847,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta848 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta848,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta849 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta849,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta850 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta850,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta851 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta851,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta852 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta852,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta853 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta853,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta854 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta854,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta855 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta855,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta856 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta856,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta857 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta857,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta858 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-07-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta858,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 260,
    });

    final idVenta859 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta859,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta860 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta860,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 260,
    });

    final idVenta861 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta861,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta862 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta862,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta863 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta863,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta864 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta864,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta865 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta865,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta866 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta866,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta867 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta867,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta868 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta868,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta869 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta869,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta870 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta870,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta871 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta871,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta872 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta872,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.5,
      'precio_unitario_venta': 260,
    });

    final idVenta873 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta873,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta874 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta874,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta875 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta875,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta876 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta876,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta877 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta877,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta878 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta878,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta879 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta879,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta880 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta880,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta881 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta881,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta882 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta882,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta883 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta883,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta884 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta884,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta885 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta885,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta886 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta886,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 11,
      'precio_unitario_venta': 260,
    });

    final idVenta887 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta887,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta888 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta888,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta889 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta889,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta890 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta890,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta891 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta891,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta892 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-09-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta892,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta893 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta893,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta894 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta894,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta895 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta895,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta896 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta896,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta897 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta897,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta898 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta898,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta899 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta899,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta900 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta900,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta901 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta901,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta902 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta902,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 260,
    });

    final idVenta903 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta903,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta904 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta904,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta905 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta905,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta906 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta906,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta907 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta907,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta908 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta908,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta909 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta909,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta910 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta910,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta911 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-10-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta911,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta912 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta912,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta913 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta913,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.5,
      'precio_unitario_venta': 260,
    });

    final idVenta914 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta914,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta915 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta915,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta916 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta916,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta917 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta917,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta918 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta918,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta919 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta919,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta920 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta920,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta921 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta921,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta922 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta922,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta923 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta923,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 260,
    });

    final idVenta924 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta924,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta925 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta925,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta926 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta926,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 260,
    });

    final idVenta927 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta927,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta928 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta928,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta929 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-11-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta929,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta930 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta930,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta931 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta931,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta932 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta932,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta933 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta933,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 260,
    });

    final idVenta934 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta934,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta935 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta935,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta936 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta936,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta937 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2024-12-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta937,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 260,
    });

    final idVenta938 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-01-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta938,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta939 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-02-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta939,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta940 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-02-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta940,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta941 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-02-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta941,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta942 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta942,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta943 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta943,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta944 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-03-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta944,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta945 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-05-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta945,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta946 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta946,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta947 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2023-12-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta947,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 240,
    });

    final idVenta948 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta948,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta949 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta949,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta950 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta950,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta951 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta951,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 240,
    });

    final idVenta952 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta952,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta953 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta953,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta954 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta954,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta955 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta955,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta956 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta956,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta957 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta957,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta958 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta958,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta959 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta959,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 240,
    });

    final idVenta960 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta960,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta961 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-01-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta961,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta962 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-02-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta962,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta963 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta963,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta964 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta964,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta965 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-02-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta965,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta966 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta966,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta967 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-02-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta967,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta968 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-02-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta968,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta969 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-03-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta969,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta970 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-03-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta970,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta971 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta971,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta972 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta972,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta973 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-03-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta973,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 240,
    });

    final idVenta974 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-04-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta974,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta975 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-04-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta975,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 240,
    });

    final idVenta976 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-04-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta976,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta977 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta977,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta978 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-04-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta978,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta979 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-05-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta979,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta980 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta980,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta981 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta981,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta982 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-05-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta982,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta983 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-07-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta983,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 260,
    });

    final idVenta984 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-08-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta984,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta985 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-10-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta985,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta986 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2024-11-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta986,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta987 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2025-01-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta987,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta988 = await txn.insert('Venta', {
      "id_cliente": idClienSofiaValdivia,
      'fecha': '2025-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta988,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta989 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta989,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 240,
    });

    final idVenta990 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-04-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta990,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 240,
    });

    final idVenta991 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta991,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta992 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-05-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta992,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 240,
    });

    final idVenta993 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-05-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta993,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 240,
    });

    final idVenta994 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-06-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta994,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta995 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-06-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta995,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta996 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-06-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta996,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta997 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta997,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 240,
    });

    final idVenta998 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-09-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta998,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta999 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-09-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta999,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta1000 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-10-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1000,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta1001 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-10-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1001,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta1002 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-10-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1002,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 240,
    });

    final idVenta1003 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1003,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 240,
    });

    final idVenta1004 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-10-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1004,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta1005 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-10-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1005,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta1007 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-10-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1007,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 240,
    });

    final idVenta1008 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2024-12-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1008,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 240,
    });

    final idVenta1009 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-02-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1009,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta1010 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-02-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1010,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 240,
    });

    final idVenta1011 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2025-03-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1011,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 240,
    });

    final idVenta1012 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2025-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1012,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta1013 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2025-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1013,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1014 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2025-05-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1014,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1015 = await txn.insert('Venta', {
      "id_cliente": idClienTiendaRolon,
      'fecha': '2025-03-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1015,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1016 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-03-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1016,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta1017 = await txn.insert('Venta', {
      "id_cliente": idClienRestauranteBuenSason,
      'fecha': '2025-03-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1017,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1018 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-04-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1018,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta1019 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-04-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1019,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1020 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-04-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1020,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta1021 = await txn.insert('Venta', {
      "id_cliente": idClienSanBartolo,
      'fecha': '2025-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1021,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1022 = await txn.insert('Venta', {
      "id_cliente": idClienMarcos,
      'fecha': '2025-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1022,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1023 = await txn.insert('Venta', {
      "id_cliente": idClienMarcos,
      'fecha': '2025-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1023,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1024 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1024,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta1025 = await txn.insert('Venta', {
      "id_cliente": idClienChavaAlvarez,
      'fecha': '2025-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1025,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1026 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-05-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1026,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta1027 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-05-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1027,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta1028 = await txn.insert('Venta', {
      "id_cliente": idClienTiendaRolon,
      'fecha': '2025-05-22T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1028,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1029 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-05-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1029,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta1030 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2025-05-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1030,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1031 = await txn.insert('Venta', {
      "id_cliente": idClienRabago,
      'fecha': '2025-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1031,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta1032 = await txn.insert('Venta', {
      "id_cliente": idClienSuperVicky,
      'fecha': '2025-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1032,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1033 = await txn.insert('Venta', {
      "id_cliente": idClienTiaCruz,
      'fecha': '2025-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1033,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1034 = await txn.insert('Venta', {
      "id_cliente": idClienCarmelilia,
      'fecha': '2025-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1034,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1035 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1035,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1036 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1036,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 260,
    });

    final idVenta1037 = await txn.insert('Venta', {
      "id_cliente": idClienTiendaEsquina,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1037,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1038 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2025-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1038,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1039 = await txn.insert('Venta', {
      "id_cliente": idClienLuisManuel,
      'fecha': '2025-05-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1039,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1040 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1040,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1041 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1041,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1042 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1042,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1043 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-06-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1043,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta1044 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1044,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1045 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1045,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1046 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1046,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1047 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1047,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1048 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1048,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1049 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1049,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1050 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1050,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1051 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1051,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1052 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1052,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 15,
      'precio_unitario_venta': 280,
    });

    final idVenta1053 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1053,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1054 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1054,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1055 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1055,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1056 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1056,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1057 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1057,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1058 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1058,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1059 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1059,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1060 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1060,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1061 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1061,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1062 = await txn.insert('Venta', {
      "id_cliente": idClienDulce,
      'fecha': '2025-06-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1062,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1063 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1063,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1064 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1064,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1065 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1065,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1066 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1066,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1067 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1067,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1068 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-06-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1068,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta1069 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1069,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1070 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1070,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1071 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1071,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1072 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1072,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1073 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1073,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1074 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1074,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1075 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1075,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1076 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1076,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1077 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1077,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1078 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2025-06-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1078,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1079 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1079,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1080 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1080,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1081 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1081,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1082 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1082,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1083 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1083,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1084 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-06-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1084,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 280,
    });

    final idVenta1085 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1085,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1086 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1086,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1087 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1087,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1088 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1088,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1089 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1089,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1090 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1090,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1091 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1091,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta1092 = await txn.insert('Venta', {
      "id_cliente": idClienMicheladas,
      'fecha': '2025-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1092,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1093 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1093,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1094 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-07-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1094,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1095 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1095,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1096 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1096,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1097 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1097,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1098 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1098,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1099 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1099,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1100 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1100,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 280,
    });

    final idVenta1101 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1101,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1102 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1102,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1103 = await txn.insert('Venta', {
      "id_cliente": idClienDulce,
      'fecha': '2025-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1103,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1104 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1104,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1105 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1105,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1106 = await txn.insert('Venta', {
      "id_cliente": idClienTiendaEsquina,
      'fecha': '2025-07-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1106,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta1107 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1107,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1108 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-07-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1108,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 280,
    });

    final idVenta1109 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1109,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1110 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1110,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1111 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1111,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1112 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1112,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1113 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1113,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1114 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1114,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1115 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1115,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1116 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1116,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1117 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1117,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1118 = await txn.insert('Venta', {
      "id_cliente": idClienYoy,
      'fecha': '2025-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1118,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta1119 = await txn.insert('Venta', {
      "id_cliente": idClienRabago,
      'fecha': '2025-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1119,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1120 = await txn.insert('Venta', {
      "id_cliente": idClienTiaCruz,
      'fecha': '2025-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1120,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1121 = await txn.insert('Venta', {
      "id_cliente": idClienSuperVicky,
      'fecha': '2025-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1121,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1122 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1122,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1123 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1123,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1124 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1124,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1125 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1125,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1126 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1126,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1127 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-07-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1127,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1128 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1128,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1129 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1129,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 280,
    });

    final idVenta1130 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1130,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1131 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2025-07-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1131,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1132 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1132,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1133 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1133,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1134 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1134,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1135 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1135,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1136 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1136,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1137 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-07-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1137,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1138 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-07-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1138,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1139 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1139,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1140 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1140,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1141 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1141,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1142 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1142,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1143 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1143,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1144 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1144,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1145 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1145,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1146 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1146,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1147 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1147,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1148 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-07-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1148,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1149 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1149,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.35,
      'precio_unitario_venta': 280,
    });

    final idVenta1150 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1150,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1151 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1151,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1152 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1152,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1153 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1153,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1154 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1154,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1155 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1155,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1156 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1156,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1157 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1157,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1158 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-08-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1158,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1159 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1159,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1160 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2025-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1160,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 260,
    });

    final idVenta1161 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2025-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1161,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1162 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1162,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1163 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1163,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1164 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1164,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1165 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1165,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1166 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1166,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1167 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1167,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1168 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1168,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1169 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1169,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1170 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1170,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1171 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1171,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1172 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1172,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1173 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1173,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1174 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1174,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1175 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1175,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1176 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1176,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1177 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-08-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1177,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 260,
    });

    final idVenta1178 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-08-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1178,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1179 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-08-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1179,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1180 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-08-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1180,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1181 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1181,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1182 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1182,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1183 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-08-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1183,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1184 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-08-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1184,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1185 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1185,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1186 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1186,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1187 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1187,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1188 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-08-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1188,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1189 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1189,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1190 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1190,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1191 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1191,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1192 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1192,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1193 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1193,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1194 = await txn.insert('Venta', {
      "id_cliente": idClienMicheladas,
      'fecha': '2025-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1194,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1195 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1195,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1196 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1196,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1197 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1197,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1198 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1198,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1199 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1199,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1200 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-08-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1200,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1201 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1201,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1202 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2025-09-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1202,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1203 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1203,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1204 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1204,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1205 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1205,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1206 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1206,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1207 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1207,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1208 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1208,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1209 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1209,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 280,
    });

    final idVenta1210 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1210,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1211 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1211,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1212 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1212,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1213 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1213,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1214 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1214,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1215 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1215,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1216 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1216,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 280,
    });

    final idVenta1217 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1217,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1218 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1218,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1219 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1219,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1220 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-09-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1220,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta1221 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1221,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1222 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1222,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1223 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1223,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1224 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1224,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1225 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1225,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1226 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1226,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1227 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-09-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1227,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta1228 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1228,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1229 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1229,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1230 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1230,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1231 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1231,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1232 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-09-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1232,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1233 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1233,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1234 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2025-09-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1234,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1235 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1235,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1236 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1236,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1237 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-09-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1237,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1238 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1238,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1239 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1239,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1240 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1240,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1241 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-09-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1241,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1242 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1242,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1243 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1243,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1244 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1244,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1245 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1245,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1246 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1246,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 260,
    });

    final idVenta1247 = await txn.insert('Venta', {
      "id_cliente": idClienDulce,
      'fecha': '2025-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1247,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1248 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1248,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1249 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1249,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1250 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1250,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 16,
      'precio_unitario_venta': 280,
    });

    final idVenta1251 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1251,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1252 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1252,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1253 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1253,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1254 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1254,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1255 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2025-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1255,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1256 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1256,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1257 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-10-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1257,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta1258 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1258,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1259 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1259,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1260 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2025-10-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1260,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1261 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-10-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1261,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1262 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1262,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1263 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1263,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1264 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1264,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1265 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1265,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1266 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1266,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1267 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1267,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1268 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1268,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1269 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1269,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1270 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1270,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1271 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1271,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1272 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1272,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 280,
    });

    final idVenta1273 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1273,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1274 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1274,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1275 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1275,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1276 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1276,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1277 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1277,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1278 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1278,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1279 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1279,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1280 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-10-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1280,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta1281 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1281,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1282 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1282,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1283 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1283,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1284 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1284,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1285 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1285,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1286 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1286,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1287 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1287,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1288 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1288,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1289 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1289,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1290 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1290,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1291 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1291,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1292 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-10-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1292,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1293 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1293,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1294 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1294,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1295 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1295,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1296 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1296,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1297 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1297,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1298 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1298,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1299 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1299,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1300 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1300,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1301 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1301,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1302 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-11-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1302,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 260,
    });

    final idVenta1303 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1303,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1304 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1304,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1305 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1305,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1306 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1306,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1307 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1307,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1308 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1308,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1309 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1309,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1310 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-11-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1310,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 18,
      'precio_unitario_venta': 280,
    });

    final idVenta1311 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1311,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1312 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1312,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1313 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-11-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1313,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 260,
    });

    final idVenta1314 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1314,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1315 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1315,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1316 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-11-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1316,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1317 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-11-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1317,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1318 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1318,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1319 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1319,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1320 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1320,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1321 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1321,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1322 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-11-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1322,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta1323 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1323,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1324 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1324,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1325 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1325,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1326 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2025-11-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1326,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1327 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1327,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1328 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2025-11-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1328,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1329 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2025-11-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1329,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1330 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-11-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1330,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta1331 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1331,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1332 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1332,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1333 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1333,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1334 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1334,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1335 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1335,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1336 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-11-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1336,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1337 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1337,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1338 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1338,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1339 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1339,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1340 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-11-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1340,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 280,
    });

    final idVenta1341 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-11-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1341,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1342 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1342,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1343 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1343,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1344 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1344,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1345 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1345,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1346 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1346,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1347 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1347,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1348 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1348,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1349 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1349,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1350 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-12-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1350,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 260,
    });

    final idVenta1351 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1351,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1352 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1352,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1353 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1353,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1354 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1354,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1355 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1355,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1356 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1356,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1357 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1357,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1358 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1358,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1359 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1359,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1360 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1360,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1361 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1361,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1362 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1362,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1363 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1363,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1364 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1364,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1365 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1365,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1366 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1366,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1367 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1367,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1368 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1368,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1369 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1369,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1370 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1370,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1371 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1371,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1372 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1372,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1373 = await txn.insert('Venta', {
      "id_cliente": idClienTiaCruz,
      'fecha': '2025-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1373,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1374 = await txn.insert('Venta', {
      "id_cliente": idClienRabago,
      'fecha': '2025-12-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1374,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1375 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1375,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1376 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1376,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1377 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1377,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1378 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1378,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1379 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1379,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1380 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2025-12-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1380,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 260,
    });

    final idVenta1381 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1381,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1382 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1382,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1383 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1383,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1384 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1384,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1385 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1385,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1386 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1386,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1387 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1387,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 280,
    });

    final idVenta1388 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1388,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1389 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1389,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1390 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1390,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1391 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2025-12-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1391,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 260,
    });

    final idVenta1392 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1392,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1393 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1393,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1394 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2025-12-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1394,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1395 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2025-12-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1395,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1396 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1396,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1397 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1397,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1398 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2025-12-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1398,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1399 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1399,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1400 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1400,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1401 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1401,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1402 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1402,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1403 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1403,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 260,
    });

    final idVenta1404 = await txn.insert('Venta', {
      "id_cliente": idClienMicheladas,
      'fecha': '2026-01-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1404,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1405 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1405,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 280,
    });

    final idVenta1406 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1406,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1407 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1407,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 280,
    });

    final idVenta1408 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1408,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1409 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1409,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 280,
    });

    final idVenta1410 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1410,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 280,
    });

    final idVenta1411 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1411,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 280,
    });

    final idVenta1412 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1412,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 280,
    });

    final idVenta1413 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1413,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 280,
    });

    final idVenta1414 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1414,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1415 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1415,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1416 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1416,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1417 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1417,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1418 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1418,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1419 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1419,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1420 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1420,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1421 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1421,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1422 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1422,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1423 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1423,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1424 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1424,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1425 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1425,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1426 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1426,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1427 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1427,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 320,
    });

    final idVenta1428 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-01-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1428,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1429 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1429,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 320,
    });

    final idVenta1430 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1430,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1431 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1431,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1432 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1432,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1433 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1433,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1434 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1434,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1435 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-01-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1435,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 300,
    });

    final idVenta1436 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1436,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1437 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1437,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1438 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1438,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1439 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1439,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1440 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1440,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1441 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1441,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1442 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1442,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1443 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1443,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1444 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1444,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1445 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1445,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1446 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1446,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1447 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1447,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1448 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1448,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1449 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2026-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1449,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1450 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1450,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1451 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1451,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1452 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1452,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1453 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-01-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1453,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1454 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1454,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1455 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1455,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1456 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1456,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1457 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-02-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1457,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1458 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2026-02-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1458,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1459 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1459,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1460 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1460,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1461 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1461,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1462 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1462,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1463 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1463,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1464 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1464,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 320,
    });

    final idVenta1465 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1465,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1466 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1466,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1467 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1467,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1468 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1468,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1469 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1469,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1470 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1470,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1471 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1471,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1472 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1472,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1473 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1473,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1474 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1474,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1475 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1475,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 320,
    });

    final idVenta1476 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-02-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1476,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1477 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1477,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1478 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1478,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1479 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1479,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1480 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1480,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1481 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2026-02-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1481,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1482 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1482,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1483 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1483,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1484 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1484,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1485 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1485,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1486 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1486,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1487 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1487,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1488 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2026-02-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1488,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1489 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-02-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1489,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1490 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-02-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1490,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1491 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-02-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1491,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1492 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1492,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1493 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1493,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1494 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1494,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1495 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1495,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1496 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-02-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1496,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1497 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1497,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1498 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1498,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1499 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1499,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1500 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-02-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1500,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 300,
    });

    final idVenta1501 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1501,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1502 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1502,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1503 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-02-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1503,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1504 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-02-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1504,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1505 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1505,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1506 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1506,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1507 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1507,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1508 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-03-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1508,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1509 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-03-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1509,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 300,
    });

    final idVenta1510 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1510,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1511 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-03-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1511,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1512 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1512,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1513 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1513,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1514 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1514,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1515 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1515,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1516 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1516,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1517 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1517,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1518 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1518,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1519 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1519,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1520 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-03-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1520,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1521 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1521,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1522 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-03-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1522,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1523 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1523,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1524 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-03-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1524,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1525 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1525,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1526 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-03-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1526,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1527 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1527,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1528 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1528,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1529 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1529,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1530 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1530,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1531 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1531,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1532 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1532,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 300,
    });

    final idVenta1533 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1533,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1534 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-03-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1534,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1535 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1535,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1536 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1536,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1537 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1537,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1538 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1538,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1539 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1539,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1540 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1540,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1541 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1541,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1542 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1542,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1543 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1543,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1544 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1544,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1545 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1545,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1546 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-03-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1546,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1547 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1547,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1548 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1548,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1549 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1549,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1550 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1550,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1551 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1551,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1552 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-03-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1552,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1553 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1553,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1554 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1554,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1555 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1555,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1556 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1556,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1557 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1557,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1558 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1558,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1559 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1559,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1560 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1560,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1561 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1561,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1562 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2026-04-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1562,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 300,
    });

    final idVenta1563 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1563,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1564 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-04-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1564,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1565 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1565,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1566 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1566,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1567 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1567,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1568 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1568,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1569 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1569,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1570 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1570,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1571 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1571,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1572 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1572,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1573 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1573,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1574 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1574,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1575 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1575,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1576 = await txn.insert('Venta', {
      "id_cliente": idClienMiguelAlgo,
      'fecha': '2026-04-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1576,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 320,
    });

    final idVenta1577 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1577,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1578 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1578,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1579 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1579,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1580 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1580,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1581 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1581,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1582 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1582,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1583 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1583,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1584 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1584,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1585 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1585,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1586 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-04-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1586,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 300,
    });

    final idVenta1587 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1587,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1588 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1588,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1589 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1589,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1590 = await txn.insert('Venta', {
      "id_cliente": idClienSenoraChayo,
      'fecha': '2026-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1590,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 300,
    });

    final idVenta1591 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-04-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1591,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1592 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1592,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1593 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1593,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1594 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1594,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1595 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1595,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1596 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-04-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1596,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1597 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1597,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1598 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-04-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1598,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1599 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1599,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1600 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1600,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1601 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-05-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1601,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1602 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1602,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 280,
    });

    final idVenta1603 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1603,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 320,
    });

    final idVenta1604 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2026-05-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1604,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1605 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1605,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1606 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1606,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1607 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1607,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1608 = await txn.insert('Venta', {
      "id_cliente": idClienRabago,
      'fecha': '2026-05-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1608,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1609 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1609,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1610 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-05-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1610,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 300,
    });

    final idVenta1611 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1611,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1612 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-05-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1612,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1613 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1613,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1614 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1614,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1615 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1615,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1616 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1616,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1617 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1617,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1618 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1618,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1619 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1619,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1620 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1620,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1621 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1621,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1622 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-05-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1622,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1623 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1623,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1624 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1624,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1625 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1625,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1626 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1626,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1627 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1627,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1628 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2026-05-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1628,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1629 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1629,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1630 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1630,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 320,
    });

    final idVenta1631 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1631,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1632 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1632,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1633 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1633,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1634 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1634,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1635 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1635,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 9.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1636 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1636,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1637 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1637,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1638 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1638,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1639 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1639,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1640 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1640,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1641 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1641,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1642 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1642,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1643 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1643,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1644 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1644,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1645 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1645,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1646 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1646,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 10,
      'precio_unitario_venta': 320,
    });

    final idVenta1647 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1647,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1648 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1648,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1649 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1649,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1650 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1650,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1651 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-05-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1651,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1652 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1652,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1653 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1653,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1654 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-06-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1654,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1655 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1655,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1656 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-06-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1656,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1657 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1657,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1658 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1658,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1659 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1659,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1660 = await txn.insert('Venta', {
      "id_cliente": idClienSanBartolo,
      'fecha': '2026-06-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1660,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1661 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1661,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1662 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1662,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1663 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1663,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1664 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1664,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1665 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-06-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1665,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1666 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1666,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1667 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1667,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1668 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-06-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1668,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1669 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1669,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1670 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1670,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1671 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1671,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1672 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-06-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1672,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 300,
    });

    final idVenta1673 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1673,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1674 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1674,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 320,
    });

    final idVenta1675 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1675,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1676 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1676,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1677 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1677,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1678 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1678,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1679 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1679,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1680 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1680,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1681 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1681,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 300,
    });

    final idVenta1682 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1682,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1683 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1683,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1684 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1684,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1685 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1685,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1686 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1686,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1687 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1687,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1688 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1688,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1689 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-06-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1689,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1690 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1690,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1691 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1691,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1692 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-06-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1692,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1693 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-06-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1693,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1694 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1694,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1695 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1695,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1696 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-06-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1696,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1697 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1697,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1698 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2026-07-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1698,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 300,
    });

    final idVenta1699 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-07-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1699,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1700 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1700,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1701 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1701,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1702 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-07-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1702,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1703 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1703,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1704 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1704,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1705 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-07-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1705,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1706 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1706,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1707 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1707,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1708 = await txn.insert('Venta', {
      "id_cliente": idClienSenoraChayo,
      'fecha': '2026-07-06T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1708,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 300,
    });

    final idVenta1709 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1709,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1710 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1710,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1711 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1711,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1712 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-07-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1712,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1713 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1713,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1714 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1714,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1715 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1715,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1716 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1716,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1717 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1717,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1718 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1718,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1719 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1719,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1720 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1720,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1721 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-07-17T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1721,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 300,
    });

    final idVenta1722 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1722,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1723 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1723,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6,
      'precio_unitario_venta': 320,
    });

    final idVenta1724 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1724,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1725 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1725,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1726 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1726,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 9.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1727 = await txn.insert('Venta', {
      "id_cliente": idClienEmmanuelValdivia,
      'fecha': '2026-07-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1727,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1728 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1728,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1729 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1729,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1730 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1730,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1731 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1731,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1732 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1732,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1733 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1733,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1734 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1734,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1735 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-07-30T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1735,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1736 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1736,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1737 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-07-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1737,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 300,
    });

    final idVenta1738 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-07-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1738,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1739 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1739,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1740 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1740,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1741 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1741,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1742 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1742,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1743 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1743,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1744 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1744,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1745 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1745,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1746 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-08-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1746,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1747 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1747,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1748 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1748,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1749 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-08-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1749,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1750 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1750,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1751 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1751,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1752 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1752,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1753 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1753,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1754 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1754,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1755 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1755,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1756 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1756,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1757 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1757,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1758 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1758,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1759 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1759,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1760 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1760,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1761 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1761,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1762 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1762,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1763 = await txn.insert('Venta', {
      "id_cliente": idClienAlonso,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1763,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1764 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1764,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1765 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2026-08-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1765,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 300,
    });

    final idVenta1766 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1766,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1767 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1767,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1768 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1768,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1769 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-10T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1769,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1770 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1770,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1771 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1771,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1772 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1772,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1773 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1773,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1774 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1774,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1775 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1775,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1776 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-08-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1776,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 300,
    });

    final idVenta1777 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1777,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1778 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1778,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1779 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1779,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1780 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1780,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1781 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-22T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1781,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1782 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1782,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1783 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1783,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1784 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1784,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1785 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1785,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1786 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1786,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1787 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1787,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1788 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1788,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1789 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1789,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1790 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2026-08-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1790,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1791 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-08-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1791,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1792 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-08-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1792,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1793 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-08-31T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1793,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1794 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2026-09-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1794,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 300,
    });

    final idVenta1795 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1795,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1796 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-09-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1796,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 300,
    });

    final idVenta1797 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-09-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1797,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 300,
    });

    final idVenta1798 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1798,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1799 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1799,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1800 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1800,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 6.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1801 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-05T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1801,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1802 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-06T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1802,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1803 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-08T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1803,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1804 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-09T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1804,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1805 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1805,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1806 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1806,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 300,
    });

    final idVenta1807 = await txn.insert('Venta', {
      "id_cliente": idClienCerealesZacoalco,
      'fecha': '2026-09-11T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1807,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 300,
    });

    final idVenta1808 = await txn.insert('Venta', {
      "id_cliente": idClienPanaderiaTapalpa,
      'fecha': '2026-09-12T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1808,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 300,
    });

    final idVenta1809 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-12T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1809,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1810 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-13T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1810,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1811 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-14T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1811,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1812 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1812,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1813 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-15T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1813,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1814 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-16T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1814,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1815 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-09-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1815,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1816 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1816,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 15,
      'precio_unitario_venta': 320,
    });

    final idVenta1817 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-18T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1817,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1818 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1818,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1819 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-19T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1819,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 320,
    });

    final idVenta1820 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-20T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1820,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1821 = await txn.insert('Venta', {
      "id_cliente": idClienGuadalupana,
      'fecha': '2026-09-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1821,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 260,
    });

    final idVenta1822 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-23T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1822,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1823 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-21T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1823,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 3,
      'precio_unitario_venta': 320,
    });

    final idVenta1824 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1824,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1825 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-24T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1825,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1826 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-25T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1826,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 8,
      'precio_unitario_venta': 320,
    });

    final idVenta1827 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-26T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1827,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1828 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1828,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1829 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1829,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1830 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-27T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1830,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1831 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-28T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1831,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1832 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1832,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1833 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-09-29T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1833,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1834 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-01T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1834,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

    final idVenta1835 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-10-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1835,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.75,
      'precio_unitario_venta': 320,
    });

    final idVenta1836 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-02T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1836,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1837 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-03T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1837,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1838 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-04T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1838,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 9,
      'precio_unitario_venta': 320,
    });

    final idVenta1839 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-10-06T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1839,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.25,
      'precio_unitario_venta': 300,
    });

    final idVenta1840 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1840,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2,
      'precio_unitario_venta': 320,
    });

    final idVenta1841 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaGomez,
      'fecha': '2026-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1841,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 1,
      'precio_unitario_venta': 320,
    });

    final idVenta1842 = await txn.insert('Venta', {
      "id_cliente": idClienVeronicaValdivia,
      'fecha': '2026-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1842,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 2.5,
      'precio_unitario_venta': 300,
    });

    final idVenta1843 = await txn.insert('Venta', {
      "id_cliente": idClienPedro,
      'fecha': '2026-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 1,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1843,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 0.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1844 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1844,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 7,
      'precio_unitario_venta': 320,
    });

    final idVenta1845 = await txn.insert('Venta', {
      "id_cliente": idClienRafaelValdivia,
      'fecha': '2026-10-07T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1845,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4,
      'precio_unitario_venta': 320,
    });

    final idVenta1846 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-08T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1846,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 4.5,
      'precio_unitario_venta': 320,
    });

    final idVenta1847 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-08T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1847,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5.25,
      'precio_unitario_venta': 320,
    });

    final idVenta1848 = await txn.insert('Venta', {
      "id_cliente": idClienVicenteValdivia,
      'fecha': '2026-10-10T09:00:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'completado',
    });

    await txn.insert('Detalle_Venta', {
      "id_venta": idVenta1848,
      'id_articulo': idArtCafeMolidoOscuro,
      'cantidad': 5,
      'precio_unitario_venta': 320,
    });

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
