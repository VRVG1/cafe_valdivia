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
    for (final nombre in ['Kg', 'Pieza', 'Litro', 'Gramo', 'Paquete']) {
      qId.add(await txn.insert('Unidad_Medida', {'nombre': nombre}));
    }
    final [kg, pieza, litro, gramo, paquete] = qId;

    // ============================================================
    // 2. CLIENTES
    // ============================================================
    final clientes = [
      {
        'nombre': 'María',
        'apellido': 'González',
        'telefono': '555-0101',
        'email': 'maria@email.com',
      },
      {
        'nombre': 'Carlos',
        'apellido': 'López',
        'telefono': '555-0102',
        'email': 'carlos@email.com',
      },
      {'nombre': 'Ana', 'apellido': 'Martínez', 'telefono': '555-0103'},
      {
        'nombre': 'Pedro',
        'apellido': 'Ramírez',
        'telefono': '555-0104',
        'email': 'pedro@email.com',
      },
      {'nombre': 'Sofía', 'apellido': 'Hernández', 'telefono': '555-0105'},
      {
        'nombre': 'Miguel',
        'apellido': 'Torres',
        'telefono': '555-0106',
        'email': 'miguel@email.com',
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
        'nombre': 'Distribuidora Café Ltda.',
        'telefono': '555-0201',
        'email': 'ventas@cafeltda.com',
      },
      {
        'nombre': 'Lácteos del Valle',
        'telefono': '555-0202',
        'email': 'info@lechevalle.com',
      },
      {'nombre': 'Empaques y Suministros SA', 'telefono': '555-0203'},
      {
        'nombre': 'Azúcares Industrializadas',
        'telefono': '555-0204',
        'email': 'pedidos@azucarind.com',
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
        'nombre': 'Café en Grano Arábica',
        'descripcion': 'Café de especialidad',
        'tipo': 'INSUMO',
        'id_unidad': kg,
        'costo_unitario': 28.0,
        'precio_venta': 0.0,
        'stock': 100.0,
      },
      {
        'nombre': 'Azúcar Blanca',
        'tipo': 'INSUMO',
        'id_unidad': kg,
        'costo_unitario': 12.0,
        'precio_venta': 0.0,
        'stock': 50.0,
      },
      {
        'nombre': 'Leche Entera',
        'tipo': 'INSUMO',
        'id_unidad': litro,
        'costo_unitario': 8.0,
        'precio_venta': 0.0,
        'stock': 40.0,
      },
      {
        'nombre': 'Canela en Polvo',
        'tipo': 'INSUMO',
        'id_unidad': gramo,
        'costo_unitario': 0.5,
        'precio_venta': 0.0,
        'stock': 200.0,
      },
      {
        'nombre': 'Vasos Térmicos 8oz',
        'tipo': 'INSUMO',
        'id_unidad': paquete,
        'costo_unitario': 25.0,
        'precio_venta': 0.0,
        'stock': 30.0,
      },
      {
        'nombre': 'Café Molido Premium',
        'descripcion': 'Café molido listo para preparar',
        'tipo': 'PRODUCTO',
        'id_unidad': kg,
        'costo_unitario': 40.0,
        'precio_venta': 120.0,
        'stock': 20.0,
      },
      {
        'nombre': 'Capuchino',
        'tipo': 'PRODUCTO',
        'id_unidad': pieza,
        'costo_unitario': 15.0,
        'precio_venta': 55.0,
        'stock': 50.0,
      },
      {
        'nombre': 'Latte Macchiato',
        'tipo': 'PRODUCTO',
        'id_unidad': pieza,
        'costo_unitario': 12.0,
        'precio_venta': 50.0,
        'stock': 30.0,
      },
      {
        'nombre': 'Café Americano',
        'tipo': 'PRODUCTO',
        'id_unidad': pieza,
        'costo_unitario': 8.0,
        'precio_venta': 35.0,
        'stock': 40.0,
      },
      {
        'nombre': 'Chocolate Artesanal',
        'tipo': 'PRODUCTO',
        'id_unidad': pieza,
        'costo_unitario': 10.0,
        'precio_venta': 45.0,
        'stock': 25.0,
      },
      {
        'nombre': 'Leche Condensada',
        'tipo': 'INSUMO_PRODUCTO',
        'id_unidad': litro,
        'costo_unitario': 20.0,
        'precio_venta': 35.0,
        'stock': 15.0,
      },
      {
        'nombre': 'Jarabe de Vainilla',
        'tipo': 'INSUMO_PRODUCTO',
        'id_unidad': litro,
        'costo_unitario': 45.0,
        'precio_venta': 80.0,
        'stock': 10.0,
      },
    ];
    final aId = <int>[];
    for (final a in articulos) {
      aId.add(await txn.insert('Articulo', a));
    }
    final [
      idCafeGrano,
      idAzucar,
      idLeche,
      idCanela,
      idVasos,
      idCafeMolido,
      idCapuchino,
      idLatte,
      idAmericano,
      idChocolate,
      idLecheCond,
      idJarabeVainilla,
    ] = aId;

    // ============================================================
    // 5. RECETAS
    // ============================================================
    final idRecCafeMolido = await txn.insert('Receta', {
      'id_articulo_producto': idCafeMolido,
      'nombre': 'Tostado y Molido',
      'cantidad_base': 1.0,
    });
    await txn.insert('Receta_Detalle', {
      'id_receta': idRecCafeMolido,
      'id_articulo_componente': idCafeGrano,
      'cantidad': 1.2,
      'id_unidad': kg,
    });

    final idRecCapuchino = await txn.insert('Receta', {
      'id_articulo_producto': idCapuchino,
      'nombre': 'Receta Capuchino',
      'cantidad_base': 1.0,
    });
    await txn.insert('Receta_Detalle', {
      'id_receta': idRecCapuchino,
      'id_articulo_componente': idCafeMolido,
      'cantidad': 0.02,
      'id_unidad': kg,
    });
    await txn.insert('Receta_Detalle', {
      'id_receta': idRecCapuchino,
      'id_articulo_componente': idLeche,
      'cantidad': 0.2,
      'id_unidad': litro,
    });

    // ============================================================
    // 6. COMPRAS (2 transacciones)
    // ============================================================
    final idCompra1 = await txn.insert('Compra', {
      'id_proveedor': idProvCafe,
      'fecha': '2026-06-01T09:00:00.000',
      'detalles': 'Compra mensual de café',
      'pagado': 1,
    });
    await txn.insert('Detalle_Compra', {
      'id_compra': idCompra1,
      'id_articulo': idCafeGrano,
      'cantidad': 50.0,
      'precio_unitario_compra': 28.0,
    });
    await txn.insert('Detalle_Compra', {
      'id_compra': idCompra1,
      'id_articulo': idCanela,
      'cantidad': 500.0,
      'precio_unitario_compra': 0.5,
    });

    final idCompra2 = await txn.insert('Compra', {
      'id_proveedor': idProvLeche,
      'fecha': '2026-06-05T10:30:00.000',
      'detalles': 'Pedido semanal lácteos',
      'pagado': 0,
    });
    await txn.insert('Detalle_Compra', {
      'id_compra': idCompra2,
      'id_articulo': idLeche,
      'cantidad': 30.0,
      'precio_unitario_compra': 8.0,
    });
    await txn.insert('Detalle_Compra', {
      'id_compra': idCompra2,
      'id_articulo': idLecheCond,
      'cantidad': 10.0,
      'precio_unitario_compra': 20.0,
    });

    // ============================================================
    // 7. VENTAS (3 transacciones)
    // ============================================================
    final idVenta1 = await txn.insert('Venta', {
      'id_cliente': 1,
      'fecha': '2026-06-10T11:00:00.000',
      'detalles': 'Venta mostrador',
      'pagado': 1,
      'estado': 'completado',
    });
    await txn.insert('Detalle_Venta', {
      'id_venta': idVenta1,
      'id_articulo': idCafeMolido,
      'cantidad': 2.0,
      'precio_unitario_venta': 120.0,
    });
    await txn.insert('Detalle_Venta', {
      'id_venta': idVenta1,
      'id_articulo': idCapuchino,
      'cantidad': 3.0,
      'precio_unitario_venta': 55.0,
    });

    final idVenta2 = await txn.insert('Venta', {
      'id_cliente': 2,
      'fecha': '2026-06-12T15:45:00.000',
      'detalles': 'Pedido especial',
      'pagado': 1,
      'estado': 'completado',
    });
    await txn.insert('Detalle_Venta', {
      'id_venta': idVenta2,
      'id_articulo': idAmericano,
      'cantidad': 5.0,
      'precio_unitario_venta': 35.0,
    });
    await txn.insert('Detalle_Venta', {
      'id_venta': idVenta2,
      'id_articulo': idChocolate,
      'cantidad': 2.0,
      'precio_unitario_venta': 45.0,
    });

    final idVenta3 = await txn.insert('Venta', {
      'id_cliente': 1,
      'fecha': '2026-06-15T09:30:00.000',
      'detalles': '',
      'pagado': 0,
      'estado': 'pendiente',
    });
    await txn.insert('Detalle_Venta', {
      'id_venta': idVenta3,
      'id_articulo': idCafeMolido,
      'cantidad': 1.0,
      'precio_unitario_venta': 120.0,
    });
    await txn.insert('Detalle_Venta', {
      'id_venta': idVenta3,
      'id_articulo': idLatte,
      'cantidad': 2.0,
      'precio_unitario_venta': 50.0,
    });

    // ============================================================
    // 8. ORDEN DE PRODUCCIÓN
    // ============================================================
    final ordenesProduccion = [
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 15.0,
        'fecha': '2025-01-05T08:00:00.000',
        'costo_total_produccion': 420.0,
        'notas': 'Producción inicio de año',
      },
      {
        'id_receta': idRecCapuchino,
        'cantidad_producida': 50.0,
        'fecha': '2025-02-12T10:30:00.000',
        'costo_total_produccion': 750.0,
        'notas': 'Pedido grande febrero',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 20.0,
        'fecha': '2025-03-01T07:00:00.000',
        'costo_total_produccion': 560.0,
        'notas': 'Primera producción marzo',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 30.0,
        'fecha': '2025-04-18T14:00:00.000',
        'costo_total_produccion': 840.0,
        'notas': 'Producción tarde abril',
      },
      {
        'id_receta': idRecCapuchino,
        'cantidad_producida': 25.0,
        'fecha': '2025-05-22T09:15:00.000',
        'costo_total_produccion': 375.0,
        'notas': 'Capuchinos para evento',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 40.0,
        'fecha': '2025-06-10T11:00:00.000',
        'costo_total_produccion': 1120.0,
        'notas': 'Producción semanal junio',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 10.0,
        'fecha': '2025-07-03T16:45:00.000',
        'costo_total_produccion': 280.0,
        'notas': 'Producción pequeña julio',
      },
      {
        'id_receta': idRecCapuchino,
        'cantidad_producida': 60.0,
        'fecha': '2025-08-15T08:30:00.000',
        'costo_total_produccion': 900.0,
        'notas': 'Pedido grande agosto',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 18.0,
        'fecha': '2025-09-20T12:00:00.000',
        'costo_total_produccion': 504.0,
        'notas': 'Producción mediodía septiembre',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 25.0,
        'fecha': '2025-10-08T07:30:00.000',
        'costo_total_produccion': 700.0,
        'notas': 'Producción octubre',
      },
      {
        'id_receta': idRecCapuchino,
        'cantidad_producida': 35.0,
        'fecha': '2025-11-14T13:00:00.000',
        'costo_total_produccion': 525.0,
        'notas': 'Capuchinos noviembre',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 50.0,
        'fecha': '2025-12-20T09:00:00.000',
        'costo_total_produccion': 1400.0,
        'notas': 'Producción fin de año',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 12.0,
        'fecha': '2026-01-07T08:15:00.000',
        'costo_total_produccion': 336.0,
        'notas': 'Primera semana enero',
      },
      {
        'id_receta': idRecCapuchino,
        'cantidad_producida': 45.0,
        'fecha': '2026-02-14T10:00:00.000',
        'costo_total_produccion': 675.0,
        'notas': 'Día San Valentín',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 22.0,
        'fecha': '2026-03-25T15:30:00.000',
        'costo_total_produccion': 616.0,
        'notas': 'Producción tarde marzo',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 35.0,
        'fecha': '2026-04-10T07:00:00.000',
        'costo_total_produccion': 980.0,
        'notas': 'Producción abril',
      },
      {
        'id_receta': idRecCapuchino,
        'cantidad_producida': 20.0,
        'fecha': '2026-05-05T11:45:00.000',
        'costo_total_produccion': 300.0,
        'notas': 'Capuchinos mayo',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 15.0,
        'fecha': '2026-06-08T08:00:00.000',
        'costo_total_produccion': 420.0,
        'notas': 'Producción semanal',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 28.0,
        'fecha': '2026-06-20T14:15:00.000',
        'costo_total_produccion': 784.0,
        'notas': 'Producción junio extra',
      },
      {
        'id_receta': idRecCapuchino,
        'cantidad_producida': 40.0,
        'fecha': '2026-07-02T09:30:00.000',
        'costo_total_produccion': 600.0,
        'notas': 'Capuchinos julio',
      },
      {
        'id_receta': idRecCafeMolido,
        'cantidad_producida': 16.0,
        'fecha': '2026-07-09T16:00:00.000',
        'costo_total_produccion': 448.0,
        'notas': 'Producción tarde julio',
      },
    ];
    for (final op in ordenesProduccion) {
      await txn.insert('Orden_Produccion', op);
    }
  });
}
