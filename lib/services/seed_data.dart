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
        'apellido': 'Autlán',
        'telefono': '3330000007',
        'email': 'tienda.rolon@email.com',
      },
      {
        'nombre': 'Restaurante Buen Sason',
        'apellido': 'NoNo',
        'telefono': '3330000008',
        'email': 'buensason@email.com',
      },
      {
        'nombre': 'Guadalupana',
        'apellido': 'Sayula',
        'telefono': '3330000009',
        'email': 'guadalupana@email.com',
      },
      {
        'nombre': 'San Bartolo',
        'apellido': 'Desconocido',
        'telefono': '3330000010',
        'email': 'san.bartolo@email.com',
      },
      {
        'nombre': 'Marcos',
        'apellido': 'Desconocido',
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
        'apellido': 'Tapalpa',
        'telefono': '3330000013',
        'email': 'panaderia.tapalpa@email.com',
      },
      {
        'nombre': 'Rabago',
        'apellido': 'Autlán',
        'telefono': '3330000014',
        'email': 'rabago@email.com',
      },
      {
        'nombre': 'Super Vicky',
        'apellido': 'Autlán',
        'telefono': '3330000015',
        'email': 'super.vicky@email.com',
      },
      {
        'nombre': 'Tia Cruz',
        'apellido': 'Autlán',
        'telefono': '3330000016',
        'email': 'tia.cruz@email.com',
      },
      {
        'nombre': 'Carmelilia',
        'apellido': 'Autlán',
        'telefono': '3330000017',
        'email': 'carmelilia@email.com',
      },
      {
        'nombre': 'Dulce',
        'apellido': 'Guzman',
        'telefono': '3330000018',
        'email': 'dulce@email.com',
      },
      {
        'nombre': 'Tienda esquina',
        'apellido': 'Guzman',
        'telefono': '3330000019',
        'email': 'tienda.esquina@email.com',
      },
      {
        'nombre': 'Eriberto',
        'apellido': 'Guzman',
        'telefono': '3330000020',
        'email': 'eriberto@email.com',
      },
      {
        'nombre': 'Luis Manuel',
        'apellido': 'Guzman',
        'telefono': '3330000021',
        'email': 'luis.manuel@email.com',
      },
      {
        'nombre': 'Cereales Zacoalco',
        'apellido': 'Zacoalco',
        'telefono': '3330000022',
        'email': 'cereales.zacoalco@email.com',
      },
      {
        'nombre': 'Micheladas',
        'apellido': 'Tapalpa',
        'telefono': '3330000023',
        'email': 'micheladas@email.com',
      },
      {
        'nombre': 'Yoy',
        'apellido': 'Autlán',
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
        'apellido': 'Guzman',
        'telefono': '3330000026',
        'email': 'senora.chayo@email.com',
      },
      {
        'nombre': 'Alonso',
        'apellido': 'Autlán',
        'telefono': '3330000027',
        'email': 'alonso@email.com',
      },
      {
        'nombre': 'Pedro',
        'apellido': 'Guzman',
        'telefono': '3330000028',
        'email': 'pedro@email.com',
      },
      {
        'nombre': 'Paco',
        'apellido': 'Amacueca',
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
    //
    final proveedores = [
      {
        'nombre': 'Fernando/Armando',
        'telefono': '1234567890',
        'email': 'fernando.armando88@gmail.com',
      },
      {
        'nombre': 'Miliano',
        'telefono': '1234567891',
        'email': 'miliano.dev@outlook.com',
      },
      {
        'nombre': 'Merma',
        'telefono': '1234567892',
        'email': 'contacto.merma@yahoo.com',
      },
      {
        'nombre': 'John Doe',
        'telefono': '1234567893',
        'email': 'johndoe.user@hotmail.com',
      },
      {
        'nombre': 'Vicente',
        'telefono': '1234567894',
        'email': 'vicente_v@icloud.com',
      },
      {
        'nombre': 'Bolas Zacoalco',
        'telefono': '1234567895',
        'email': 'zacoalco.ventas@gmail.com',
      },
      {
        'nombre': 'Padre Don Cegas',
        'telefono': '1234567896',
        'email': 'padre.doncegas@proton.me',
      },
      {
        'nombre': 'Valdivia',
        'telefono': '1234567897',
        'email': 'valdivia_ing@outlook.com',
      },
      {
        'nombre': 'Tecnologia de empaques flexibles',
        'telefono': '1234567898',
        'email': 'empaques.flexibles@empresamx.com',
      },
      {
        'nombre': 'Gas',
        'telefono': '1234567899',
        'email': 'servicio.gas@servicios.net',
      },
      {
        'nombre': 'Llamas',
        'telefono': '1234567900',
        'email': 'llamas.info@gmail.com',
      },
      {
        'nombre': 'Cafiver',
        'telefono': '1234567901',
        'email': 'cafiver_comercial@yahoo.com',
      },
      {
        'nombre': 'Gerardo',
        'telefono': '1234567902',
        'email': 'gerardo.m92@hotmail.com',
      },
      {
        'nombre': 'Nando',
        'telefono': '1234567903',
        'email': 'nando_tech@outlook.es',
      },
      {
        'nombre': 'Ramiro',
        'telefono': '1234567904',
        'email': 'ramiro.logistica@gmail.com',
      },
      {
        'nombre': 'Adrian',
        'telefono': '1234567905',
        'email': 'adrian.soluciones@icloud.com',
      },
      {
        'nombre': 'MercadoLibre',
        'telefono': '1234567906',
        'email': 'compras.ml@mercadolibre.com',
      },
      {
        'nombre': 'Etiquetas Sayula',
        'telefono': '1234567907',
        'email': 'contacto@etiquetassayula.com',
      },
      {
        'nombre': 'Cartero',
        'telefono': '1234567908',
        'email': 'cartero_envios@outlook.com',
      },
      {
        'nombre': 'Plasticos Mexico',
        'telefono': '1234567909',
        'email': 'ventas@plasticosmexico.com.mx',
      },
      {
        'nombre': 'Mamona cafecito',
        'telefono': '1234567910',
        'email': 'cafecito.pedidos@gmail.com',
      },
      {
        'nombre': 'Javier Ochoa',
        'telefono': '1234567911',
        'email': 'javier.ochoa@hotmail.com',
      },
      {
        'nombre': 'Hermano de milio',
        'telefono': '1234567912',
        'email': 'milio_fam@yahoo.es',
      },
      {
        'nombre': 'Fanta',
        'telefono': '1234567913',
        'email': 'fanta.distribucion@gmail.com',
      },
      {
        'nombre': 'Mercedes',
        'telefono': '1234567914',
        'email': 'mercedes.admin@outlook.com',
      },
      {
        'nombre': 'Senor troca',
        'telefono': '1234567915',
        'email': 'fletes.troca@gmail.com',
      },
      {
        'nombre': 'Cunado de milio',
        'telefono': '1234567916',
        'email': 'milio.cunado@hotmail.com',
      },
      {
        'nombre': 'Peter',
        'telefono': '1234567917',
        'email': 'peter_parker@gmail.com',
      },
      {
        'nombre': 'Senor Gabanzo',
        'telefono': '1234567918',
        'email': 'garbanzo.proveedor@yahoo.com',
      },
      {
        'nombre': 'Cristian Tepec',
        'telefono': '1234567919',
        'email': 'cristian.tepec@outlook.com',
      },
      {
        'nombre': 'Omar',
        'telefono': '1234567920',
        'email': 'omar_dev21@gmail.com',
      },
      {
        'nombre': 'Sin techo',
        'telefono': '1234567921',
        'email': 'sin.techo.proyectos@proton.me',
      },
      {
        'nombre': 'tablitas',
        'telefono': '1234567922',
        'email': 'tablitas_madera@hotmail.com',
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
    //
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

    /// FIN COMPRAS

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
