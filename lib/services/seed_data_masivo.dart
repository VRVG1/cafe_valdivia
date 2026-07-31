import 'dart:math';
import 'package:cafe_valdivia/services/db_helper.dart';

Future<void> seedDatabaseMasivo() async {
  final db = DatabaseHelper();

  final existing = await db.query('Cliente');
  if (existing.length >= 400) return;

  final r = Random(42);

  String randomDate(int y1, int m1, int y2, int m2) {
    final start = DateTime(y1, m1, 1);
    final end = DateTime(y2, m2 + 1, 1);
    final diff = end.difference(start).inDays;
    final d = start.add(Duration(days: r.nextInt(diff)));
    return '${d.year}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')}T'
        '${(r.nextInt(14) + 7).toString().padLeft(2, '0')}:'
        '${r.nextInt(60).toString().padLeft(2, '0')}:00.000';
  }

  await db.transaction((txn) async {
    // ====================================================================
    // 1. UNIDADES DE MEDIDA
    // ====================================================================
    final u = <String, int>{};
    for (final n in [
      'Kg',
      'Pieza',
      'Litro',
      'Gramo',
      'Paquete',
      'Mililitro',
      'Bolsa',
      'Caja',
      'Sobre',
      'Unidad',
    ]) {
      u[n] = await txn.insert('Unidad_Medida', {'nombre': n});
    }
    final kg = u['Kg']!;
    final bolsa = u['Bolsa']!;

    // ====================================================================
    // 2. CLIENTES  (500)
    // ====================================================================
    final nomM =
        'Juan Carlos Luis José Miguel Pedro Antonio Manuel Jorge '
                'Francisco David Javier Ricardo Fernando Andrés Diego Pablo Sergio '
                'Alejandro Raúl Alberto Eduardo Héctor Óscar Víctor Gabriel Hugo '
                'Iván Rafael Mario Daniel Armando Arturo Roberto'
            .split(' ');
    final nomF =
        'María Ana Sofía Carmen Isabel Laura Rosa Elena Patricia '
                'Teresa Claudia Mónica Silvia Verónica Adriana Andrea Gabriela '
                'Valeria Daniela Mariana Fernanda Lucía Paola Ximena Liliana '
                'Alejandra Jimena Natalia Diana Angélica Lorena Marcela'
            .split(' ');
    final ap =
        'González López Martínez Ramírez Hernández Torres Pérez García '
                'Rodríguez Flores Sánchez Reyes Morales Cruz Ortiz Castillo Vargas '
                'Guzmán Mendoza Molina Rivas Acosta Delgado Campos Vega Aguilar '
                'Cortés Ramos Chávez Medina Castro Ríos Paredes Romero Álvarez '
                'Salazar Soto Peña Navarro Gutiérrez Silva Jiménez'
            .split(' ');

    for (int i = 0; i < 500; i++) {
      final m = r.nextBool();
      final nom = (m ? nomM : nomF)[r.nextInt(m ? nomM.length : nomF.length)];
      final ape1 = ap[r.nextInt(ap.length)];
      final ape2 = ap[r.nextInt(ap.length)];
      final c = <String, dynamic>{
        'nombre': nom,
        'apellido': '$ape1 $ape2',
        'telefono': '555-${(1000 + i)}',
      };
      if (r.nextDouble() < 0.7) {
        c['email'] = '${nom.toLowerCase()}.${ape1.toLowerCase()}$i@correo.com';
      }
      await txn.insert('Cliente', c);
    }

    // ====================================================================
    // 3. PROVEEDORES  (200)
    // ====================================================================
    final provNombres =
        'Distribuidora Comercializadora Industria Proveedora '
                'Suministros Alimentos Insumos Empaques Lácteos Cafetalera Granos '
                'Limpieza Refrigeración Transporte Logística Agrícola Ganadera'
            .split(' ');
    final provSufijos = 'SA de CV SRL SPA EIRL Ltda. S.A.S. C.A. S.A.'.split(
      ' ',
    );
    final provRubros =
        'Café Leche Azúcar Empaques Granos Lácteos Frutas'
                ' Panela Chocolate Vainilla Plásticos Papel Químicos'
            .split(' ');

    final provIds = <int>[];
    for (int i = 0; i < 200; i++) {
      final rubro = provRubros[r.nextInt(provRubros.length)];
      final p = <String, dynamic>{
        'nombre':
            '${provNombres[r.nextInt(provNombres.length)]} '
            '$rubro ${provSufijos[r.nextInt(provSufijos.length)]}',
        'telefono': '555-${(2000 + i)}',
        'direccion':
            'Calle ${r.nextInt(100) + 1} #${r.nextInt(500) + 1}, '
            'Col. ${['Centro', 'Industrial', 'Norte', 'Sur', 'Oriente', 'Poniente'][r.nextInt(6)]}',
      };
      if (r.nextDouble() < 0.7) {
        p['email'] = 'contacto$i@${rubro.toLowerCase()}.com';
      }
      provIds.add(await txn.insert('Proveedor', p));
    }

    // ====================================================================
    // 4. ARTÍCULOS
    //     INSUMO:   café verde (materia prima)
    //     PRODUCTO: café tostado en grano y café molido (venta)
    // ====================================================================
    const origenes = [
      'Arábica',
      'Robusta',
      'Geisha',
      'Colombia',
      'Guatemala',
      'Etiopía',
      'Brasil',
      'Perú',
      'México',
      'Honduras',
      'Costa Rica',
      'Nicaragua',
      'El Salvador',
      'Jamaica',
      'Kenia',
    ];
    const tamanos = ['250g', '500g', '1kg'];
    const tamInfo = {
      '250g': [30.0, 70.0],
      '500g': [50.0, 120.0],
      '1kg': [80.0, 190.0],
    };
    const kgEq = {'250g': 0.26, '500g': 0.52, '1kg': 1.05};

    final aDefs = <Map<String, dynamic>>[];

    // --- café verde (materia prima) ---
    for (final o in origenes) {
      aDefs.add({
        'nombre': 'Café Verde $o',
        'tipo': 'INSUMO',
        'um': kg,
        'costo': 80.0 + r.nextDouble() * 70,
        'pv': 0.0,
      });
    }

    // --- café tostado en grano y café molido (productos terminados) ---
    for (final o in origenes) {
      for (final t in tamanos) {
        final costo = tamInfo[t]![0];
        final pv = tamInfo[t]![1];
        aDefs.add({
          'nombre': 'Café Tostado en Grano $o $t',
          'tipo': 'PRODUCTO',
          'um': bolsa,
          'costo': costo + r.nextDouble() * 10,
          'pv': pv + r.nextDouble() * 10,
        });
        aDefs.add({
          'nombre': 'Café Molido $o $t',
          'tipo': 'PRODUCTO',
          'um': bolsa,
          'costo': costo * 1.1 + r.nextDouble() * 10,
          'pv': pv * 1.1 + r.nextDouble() * 10,
        });
      }
    }

    // shuffle for variety
    aDefs.shuffle(r);

    final aIds = <int>[];
    final aTipo = <int, String>{};
    final aNombre = <int, String>{};
    final aCosto = <int, double>{};
    final aPrecio = <int, double>{};
    for (final ad in aDefs) {
      final costo = double.parse((ad['costo'] as double).toStringAsFixed(2));
      final pv = double.parse((ad['pv'] as double).toStringAsFixed(2));
      final id = await txn.insert('Articulo', {
        'nombre': ad['nombre'],
        'descripcion': ad['tipo'] == 'INSUMO'
            ? 'Café verde (materia prima)'
            : 'Café tostado y empacado para venta',
        'tipo': ad['tipo'],
        'id_unidad': ad['um'],
        'costo_unitario': costo,
        'precio_venta': pv,
        'stock': 0.0,
      });
      aIds.add(id);
      aTipo[id] = ad['tipo'] as String;
      aNombre[id] = ad['nombre'] as String;
      aCosto[id] = costo;
      aPrecio[id] = pv;
    }

    final aInsumos = aIds.where((id) => aTipo[id] == 'INSUMO').toList();
    final aProductos = aIds.where((id) => aTipo[id] == 'PRODUCTO').toList();
    final verdePorOrigen = <String, int>{
      for (final id in aInsumos)
        aNombre[id]!.replaceFirst('Café Verde ', ''): id,
    };

    // ====================================================================
    // 5. RECETAS + RECETA_DETALLE  (una por producto, consume café verde)
    // ====================================================================
    for (final prodId in aProductos) {
      final nombre = aNombre[prodId]!;

      String? origen;
      for (final o in origenes) {
        if (nombre.contains(o)) {
          origen = o;
          break;
        }
      }
      String? tam;
      for (final t in tamanos) {
        if (nombre.endsWith(t)) {
          tam = t;
          break;
        }
      }
      final verdeId = origen == null ? null : verdePorOrigen[origen];
      if (origen == null || tam == null || verdeId == null) continue;

      final recId = await txn.insert('Receta', {
        'id_articulo_producto': prodId,
        'nombre': 'Receta $nombre',
        'cantidad_base': 1.0,
      });

      // pérdida por tostado/empaque: se requieren un poco más de kilos de verde
      final cant = kgEq[tam]! * (1.0 + r.nextDouble() * 0.15);
      await txn.insert('Receta_Detalle', {
        'id_receta': recId,
        'id_articulo_componente': verdeId,
        'cantidad': double.parse(cant.toStringAsFixed(3)),
        'id_unidad': kg,
      });
    }

    // get all recipe IDs
    final recetas = await txn.rawQuery(
      'SELECT id_receta, id_articulo_producto FROM Receta',
    );
    final recMap = <int, int>{};
    for (final r in recetas) {
      recMap[r['id_receta'] as int] = r['id_articulo_producto'] as int;
    }
    final recIds = recMap.keys.toList();

    // ====================================================================
    // 6. COMPRAS + DETALLE_COMPRA  (500 compras, solo café verde)
    // ====================================================================
    for (int i = 0; i < 500; i++) {
      final provId = provIds[r.nextInt(provIds.length)];
      final esPagada = r.nextDouble() < 0.75;
      final compraId = await txn.insert('Compra', {
        'id_proveedor': provId,
        'fecha': randomDate(2025, 1, 2026, 7),
        'detalles': 'Compra ${i + 1}',
        'pagado': esPagada ? 1 : 0,
      });

      final numItems = r.nextInt(4) + 1;
      for (int j = 0; j < numItems; j++) {
        // solo se compra café verde (materia prima)
        final artId = aInsumos[r.nextInt(aInsumos.length)];
        final cant = 25.0 + r.nextInt(200) * 1.0;
        final precio = aCosto[artId]! * (0.85 + r.nextDouble() * 0.3);
        await txn.insert('Detalle_Compra', {
          'id_compra': compraId,
          'id_articulo': artId,
          'cantidad': cant,
          'precio_unitario_compra': double.parse(precio.toStringAsFixed(2)),
        });
      }
    }

    // ====================================================================
    // 7. ÓRDENES DE PRODUCCIÓN + CONSUMO  (500)
    // ====================================================================
    for (int i = 0; i < 500; i++) {
      if (recIds.isEmpty) break;
      final recId = recIds[r.nextInt(recIds.length)];

      // consumo: get recipe details and consume proportionally
      final detalles = await txn.rawQuery(
        'SELECT id_articulo_componente, cantidad, id_unidad FROM Receta_Detalle WHERE id_receta = ?',
        [recId],
      );
      if (detalles.isEmpty) continue;

      final cantProd = 1.0 + r.nextInt(50) * 1.0;

      // validate stock for every component before inserting, otherwise
      // trg_validar_stock_produccion aborts the whole transaction
      final consumos = <Map<String, dynamic>>[];
      var stockOk = true;
      for (final det in detalles) {
        final cantUsada =
            (det['cantidad'] as double) *
            cantProd *
            (0.9 + r.nextDouble() * 0.2);
        final stockRows = await txn.rawQuery(
          'SELECT IFNULL(stock, 0) AS stock FROM Articulo WHERE id_articulo = ?',
          [det['id_articulo_componente']],
        );
        final stock = stockRows.isEmpty
            ? 0.0
            : (stockRows.first['stock'] as num).toDouble();
        if (stock < cantUsada) {
          stockOk = false;
          break;
        }
        consumos.add({
          'id_articulo': det['id_articulo_componente'],
          'cantidad_usada': double.parse(cantUsada.toStringAsFixed(3)),
          'costo_articulo_momento': 0.0,
        });
      }
      if (!stockOk) continue;

      final costo = 10.0 + r.nextDouble() * 100;
      final opId = await txn.insert('Orden_Produccion', {
        'id_receta': recId,
        'cantidad_producida': cantProd,
        'fecha': randomDate(2025, 1, 2026, 7),
        'costo_total_produccion': double.parse(costo.toStringAsFixed(2)),
        'notas': 'Orden de producción ${i + 1}',
      });

      for (final c in consumos) {
        await txn.insert('Orden_Produccion_Consumo', {
          'id_orden_produccion': opId,
          ...c,
        });
      }
    }

    // ====================================================================
    // 8. VENTAS + DETALLE_VENTA  (500, solo café tostado/molido)
    // ====================================================================
    for (int i = 0; i < 500; i++) {
      final cliId = r.nextInt(500) + 1;
      final estado = [
        'completado',
        'completado',
        'completado',
        'pendiente',
        'cancelado',
      ][r.nextInt(5)];
      final esPagada = estado == 'completado' ? (r.nextDouble() < 0.9) : false;

      final ventaId = await txn.insert('Venta', {
        'id_cliente': cliId,
        'fecha': randomDate(2025, 3, 2026, 7),
        'detalles': 'Venta ${i + 1}',
        'pagado': esPagada ? 1 : 0,
        'estado': estado,
      });

      final numItems = r.nextInt(4) + 1;
      final used = <int>{};
      var inserted = 0;
      for (int j = 0; j < numItems; j++) {
        // solo se vende café tostado en grano o café molido
        if (aProductos.isEmpty) continue;
        var artId = aProductos[r.nextInt(aProductos.length)];
        var attempts = 0;
        while (used.contains(artId) && attempts < 5) {
          artId = aProductos[r.nextInt(aProductos.length)];
          attempts++;
        }
        used.add(artId);

        final cant = 1.0 + r.nextInt(5) * 1.0;
        final precioVenta = aPrecio[artId]!;

        try {
          await txn.insert('Detalle_Venta', {
            'id_venta': ventaId,
            'id_articulo': artId,
            'cantidad': cant,
            'precio_unitario_venta': double.parse(
              precioVenta.toStringAsFixed(2),
            ),
          });
          inserted++;
        } catch (_) {
          // skip if stock insufficient for this item
        }
      }
      if (inserted == 0) {
        await txn.delete('Venta', where: 'id_venta = ?', whereArgs: [ventaId]);
      }
    }
  });
}
