Future<void> ventas(txn, clientes, articulos) async {
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
  ] = clientes;

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
  ] = articulos;
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
    'fecha': '2026-05-12T09:00:00.000',
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
    'pagado': 1,
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
    'pagado': 1,
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
    'pagado': 1,
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
    'pagado': 1,
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
    'pagado': 1,
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
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1848,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });

  final idVenta1849 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-11T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1849,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 4,
    'precio_unitario_venta': 320,
  });

  final idVenta1850 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-11T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1850,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 1.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1851 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-11T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1851,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });

  final idVenta1852 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-12T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1852,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 1.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1853 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-12T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1853,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 3.5,
    'precio_unitario_venta': 320,
  });

  final idVenta1854 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-13T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1854,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });

  final idVenta1855 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-14T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1855,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 4,
    'precio_unitario_venta': 320,
  });

  final idVenta1856 = await txn.insert('Venta', {
    "id_cliente": idClienPanaderiaTapalpa,
    'fecha': '2026-10-16T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1856,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });

  final idVenta1857 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-16T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1857,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });

  final idVenta1858 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-17T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1858,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 2,
    'precio_unitario_venta': 320,
  });

  final idVenta1859 = await txn.insert('Venta', {
    "id_cliente": idClienGuadalupana,
    'fecha': '2026-10-17T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1859,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 300,
  });

  final idVenta1860 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-17T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1860,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 4,
    'precio_unitario_venta': 320,
  });

  final idVenta1861 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-18T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1861,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });

  final idVenta1862 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-18T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1862,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });

  final idVenta1863 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1863,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.5,
    'precio_unitario_venta': 320,
  });

  final idVenta1864 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1864,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1865 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1865,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1866 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1866,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1867 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1867,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1868 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1868,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1869 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1869,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.5,
    'precio_unitario_venta': 320,
  });

  final idVenta1870 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1870,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.5,
    'precio_unitario_venta': 320,
  });

  final idVenta1871 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1871,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 1,
    'precio_unitario_venta': 320,
  });

  final idVenta1872 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1872,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 1,
    'precio_unitario_venta': 320,
  });

  final idVenta1873 = await txn.insert('Venta', {
    "id_cliente": idClienAlonso,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1873,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 1,
    'precio_unitario_venta': 320,
  });

  final idVenta1874 = await txn.insert('Venta', {
    "id_cliente": idClienRabago,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1874,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 2,
    'precio_unitario_venta': 320,
  });

  final idVenta1875 = await txn.insert('Venta', {
    "id_cliente": idClienVeronicaValdivia,
    'fecha': '2026-10-19T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1875,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 3,
    'precio_unitario_venta': 300,
  });

  final idVenta1876 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-20T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1876,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 1.75,
    'precio_unitario_venta': 320,
  });

  final idVenta1877 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-21T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1877,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 4.75,
    'precio_unitario_venta': 320,
  });

  final idVenta1878 = await txn.insert('Venta', {
    "id_cliente": idClienPedro,
    'fecha': '2026-10-22T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1878,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 0.5,
    'precio_unitario_venta': 320,
  });

  final idVenta1879 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-23T09:00:00.000',
    'detalles': '',
    'pagado': 1,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1879,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 2,
    'precio_unitario_venta': 320,
  });

  final idVenta1880 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-23T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1880,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 2,
    'precio_unitario_venta': 320,
  });

  final idVenta1881 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-23T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1881,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 1.25,
    'precio_unitario_venta': 320,
  });

  final idVenta1882 = await txn.insert('Venta', {
    "id_cliente": idClienVicenteValdivia,
    'fecha': '2026-10-24T09:00:00.000',
    'detalles': '',
    'pagado': 0,
    'estado': 'completado',
  });

  await txn.insert('Detalle_Venta', {
    "id_venta": idVenta1882,
    'id_articulo': idArtCafeMolidoOscuro,
    'cantidad': 5,
    'precio_unitario_venta': 320,
  });
}
