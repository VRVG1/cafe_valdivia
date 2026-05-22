import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // var databaseFactory = databaseFactoryFfi;
    //Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String directory = Directory.current.path;
    String path = join(directory, "cafe_sales.db");

    return await openDatabase(
      path,
      version: 5,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  // Metodos para facilitar las pruebas
  Future<void> testOnCreate(Database db, [int version = 5]) =>
      _onCreate(db, version);

  Future<void> testOnConfigure(Database db) => _onConfigure(db);
  void setMockDatabase(Database database) {
    _database = database;
  }

  Future<void> _onConfigure(Database db) async {
    // Configura la base de datos para permitir el uso de transacciones
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onUpgrade(Database db, int oldversion, int newVersion) async {
    if (oldversion < 10) {
      _migrateToV4(db);
    }
  }

  Future<void> _migrateToV4(Database db) async {
    await db.execute('''
    CREATE VIEW IF NOT EXISTS v_compras_list AS 
      SELECT
        c.id_compra,
        c.fecha,
        c.pagado,
        p.id_proveedor,
        p.nombre AS nombre_proveedor,
        SUM(CAST(dc.cantidad AS REAL) * CAST(dc.precio_unitario_compra AS REAL)) AS total_compra
      FROM
        Compra AS c
      JOIN
        Proveedor AS p ON c.id_proveedor = p.id_proveedor
      JOIN
        Detalle_Compra as dc ON c.id_compra = dc.id_compra
      GROUP BY C.id_compra
      ORDER BY c.fecha ASC
  ''');
  }

  // ============== MÉTODOS DE UTILIDAD ==============
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final db = await database;
    return await db.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  Future<int> update(
    String table,
    Map<String, dynamic> data, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    final db = await database;
    return await db.update(
      table,
      data,
      where: where,
      whereArgs: whereArgs,
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<T> transaction<T>(Future<T> Function(Transaction txn) action) async {
    final db = await database;
    return db.transaction<T>(action);
  }

  Future<void> execute(String sql, [List<Object?>? arguments]) async {
    final db = await database;
    await db.execute(sql, arguments);
  }

  // ============== ESQUEMA DE BASE DE DATOS  ==============
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Unidad_Medida (
        id_unidad INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL UNIQUE CHECK(nombre != '')
      )
    ''');

    await db.execute('''
      CREATE TABLE Cliente (
        id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL CHECK(nombre != ''),
        apellido TEXT NOT NULL CHECK(apellido != ''),
        telefono TEXT,
        email TEXT UNIQUE
      )
    ''');

    await db.execute('''
      CREATE TABLE Proveedor (
        id_proveedor INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL CHECK(nombre != ''),
        telefono TEXT,
        email TEXT UNIQUE,
        direccion TEXT
      )
    ''');

    await db.execute('''
  CREATE TABLE Articulo (
    id_articulo INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE CHECK(nombre != ''),
    descripcion TEXT,
    tipo TEXT NOT NULL DEFAULT 'INSUMO' CHECK(tipo IN ('INSUMO', 'PRODUCTO_INTERMEDIO', 'PRODUCTO')),
    id_unidad INTEGER NOT NULL,
    costo_unitario REAL DEFAULT 0.0,
    precio_venta REAL DEFAULT 0.0,
    stock REAL DEFAULT 0.0,
    FOREIGN KEY (id_unidad) REFERENCES Unidad_Medida (id_unidad)
      ON DELETE RESTRICT ON UPDATE CASCADE
  )
''');

    // Compras
    await db.execute('''
      CREATE TABLE Compra(
        id_compra INTEGER PRIMARY KEY AUTOINCREMENT,
        id_proveedor INTEGER NOT NULL,
        fecha DATETIME NOT NULL,
        detalles TEXT,
        pagado BOOLEAN DEFAULT 0,
        FOREIGN KEY (id_proveedor) REFERENCES Proveedor (id_proveedor)
      )
    ''');

    await db.execute('''
  CREATE TABLE Detalle_Compra (
    id_detalle_compra INTEGER PRIMARY KEY AUTOINCREMENT,
    id_compra INTEGER NOT NULL,
    id_articulo INTEGER NOT NULL,
    cantidad REAL NOT NULL CHECK(cantidad > 0),
    precio_unitario_compra REAL NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES Compra (id_compra) ON DELETE CASCADE,
    FOREIGN KEY (id_articulo) REFERENCES Articulo (id_articulo) ON DELETE RESTRICT
  )
''');

    //Ventas

    await db.execute('''
      CREATE TABLE Venta (
        id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
        id_cliente INTEGER NOT NULL,
        fecha DATETIME NOT NULL,
        detalles TEXT,
        pagado BOOLEAN DEFAULT 0,
        estado TEXT NOT NULL DEFAULT 'pendiente' CHECK (estado IN ('pendiente', 'completado', 'cancelado')),
        FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente) ON DELETE RESTRICT
      )
    ''');

    await db.execute('''
  CREATE TABLE Detalle_Venta (
    id_detalle_venta INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venta INTEGER NOT NULL,
    id_articulo INTEGER NOT NULL,
    cantidad REAL NOT NULL CHECK(cantidad > 0),
    precio_unitario_venta REAL NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta (id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_articulo) REFERENCES Articulo (id_articulo) ON DELETE RESTRICT,
    UNIQUE(id_venta, id_articulo)
  )
''');

    //RECETA

    await db.execute('''
      CREATE TABLE Receta(
      id_receta INTEGER PRIMARY KEY AUTOINCREMENT,
      id_articulo_producto INTEGER NOT NULL,
      nombre TEXT NOT NULL,
      cantidad_base REAL NOT NULL,
      FOREIGN KEY (id_articulo_producto) REFERENCES Articulo (id_articulo)
      )
    ''');

    await db.execute('''
      CREATE TABLE Receta_Detalle(
        id_receta_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
        id_receta INTEGER NOT NULL,
        id_articulo_componente INTEGER NOT NULL,
        cantidad REAL NOT NULL,
        id_unidad INTEGER NOT NULL,
        FOREIGN KEY (id_receta) REFERENCES Receta (id_receta),
        FOREIGN KEY (id_articulo_componente) REFERENCES Articulo (id_articulo),
        FOREIGN KEY (id_unidad) REFERENCES Unidad_Medida (id_unidad)
      )
    ''');

    //Produccion
    await db.execute('''
  CREATE TABLE Orden_Produccion (
    id_orden_produccion INTEGER PRIMARY KEY AUTOINCREMENT,
    id_receta INTEGER NOT NULL,
    cantidad_producida REAL NOT NULL CHECK(cantidad_producida > 0),
    fecha DATETIME NOT NULL,
    costo_total_produccion REAL DEFAULT 0.0,
    notas TEXT,
    FOREIGN KEY (id_receta) REFERENCES Receta (id_receta) ON DELETE RESTRICT
  )
''');

    await db.execute('''
  CREATE TABLE Orden_Produccion_Consumo(
    id_consumo INTEGER PRIMARY KEY AUTOINCREMENT,
    id_orden_produccion INTEGER NOT NULL,
    id_articulo INTEGER NOT NULL,
    cantidad_usada REAL DEFAULT 0.0 CHECK(cantidad_usada >= 0),
    costo_articulo_momento REAL DEFAULT 0.0,
    FOREIGN KEY (id_orden_produccion) REFERENCES Orden_Produccion (id_orden_produccion) ON DELETE CASCADE,
    FOREIGN KEY (id_articulo) REFERENCES Articulo (id_articulo) ON DELETE RESTRICT
  )
''');

    // --- Búsquedas por nombre ---
    await db.execute('CREATE INDEX idx_articulo_nombre ON Articulo(nombre)');
    await db.execute(
      'CREATE INDEX idx_cliente_nombre ON Cliente(nombre, apellido)',
    );
    await db.execute('CREATE INDEX idx_proveedor_nombre ON Proveedor(nombre)');

    // --- Fechas (reportes mensuales/anuales) ---
    await db.execute('CREATE INDEX idx_compra_fecha ON Compra(fecha)');
    await db.execute('CREATE INDEX idx_venta_fecha ON Venta(fecha)');
    await db.execute(
      'CREATE INDEX idx_orden_prod_fecha ON Orden_Produccion(fecha)',
    );

    // --- Claves foráneas (JOINs frecuentes) ---
    await db.execute('CREATE INDEX idx_articulo_unidad ON Articulo(id_unidad)');
    await db.execute(
      'CREATE INDEX idx_compra_proveedor ON Compra(id_proveedor)',
    );
    await db.execute('CREATE INDEX idx_venta_cliente ON Venta(id_cliente)');
    await db.execute(
      'CREATE INDEX idx_detalle_compra_compra ON Detalle_Compra(id_compra)',
    );
    await db.execute(
      'CREATE INDEX idx_detalle_compra_articulo ON Detalle_Compra(id_articulo)',
    );
    await db.execute(
      'CREATE INDEX idx_detalle_venta_venta ON Detalle_Venta(id_venta)',
    );
    await db.execute(
      'CREATE INDEX idx_detalle_venta_articulo ON Detalle_Venta(id_articulo)',
    );
    await db.execute(
      'CREATE INDEX idx_receta_producto ON Receta(id_articulo_producto)',
    );
    await db.execute(
      'CREATE INDEX idx_receta_detalle_receta ON Receta_Detalle(id_receta)',
    );
    await db.execute(
      'CREATE INDEX idx_receta_detalle_componente ON Receta_Detalle(id_articulo_componente)',
    );
    await db.execute(
      'CREATE INDEX idx_orden_prod_receta ON Orden_Produccion(id_receta)',
    );
    await db.execute(
      'CREATE INDEX idx_orden_prod_consumo_orden ON Orden_Produccion_Consumo(id_orden_produccion)',
    );
    await db.execute(
      'CREATE INDEX idx_orden_prod_consumo_articulo ON Orden_Produccion_Consumo(id_articulo)',
    );

    // --- Estados y tipos (filtros comunes) ---
    await db.execute('CREATE INDEX idx_venta_estado ON Venta(estado)');
    await db.execute('CREATE INDEX idx_articulo_tipo ON Articulo(tipo)');
    await db.execute('CREATE INDEX idx_compra_pagado ON Compra(pagado)');
    await db.execute('CREATE INDEX idx_venta_pagado ON Venta(pagado)');

    // Views

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_articulos_completos AS
  SELECT 
    a.id_articulo,
    a.nombre AS articulo,
    a.descripcion,
    a.tipo,
    a.costo_unitario,
    a.precio_venta,
    a.stock,
    um.nombre AS unidad_medida
  FROM Articulo a
  JOIN Unidad_Medida um ON a.id_unidad = um.id_unidad
''');

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_compras_resumen AS
  SELECT 
    c.id_compra,
    c.fecha,
    c.detalles,
    c.pagado,
    p.nombre AS proveedor,
    p.telefono AS telefono_proveedor,
    COUNT(dc.id_detalle_compra) AS cantidad_items,
    SUM(dc.cantidad * dc.precio_unitario_compra) AS total_compra
  FROM Compra c
  JOIN Proveedor p ON c.id_proveedor = p.id_proveedor
  LEFT JOIN Detalle_Compra dc ON c.id_compra = dc.id_compra
  GROUP BY c.id_compra
''');

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_ventas_resumen AS
  SELECT 
    v.id_venta,
    v.fecha,
    v.detalles,
    v.pagado,
    v.estado,
    cl.nombre || ' '  AS cliente,
    cl.telefono AS telefono_cliente,
    cl.email AS email_cliente,
    COUNT(dv.id_detalle_venta) AS cantidad_items,
    SUM(dv.cantidad * dv.precio_unitario_venta) AS total_venta
  FROM Venta v
  JOIN Cliente cl ON v.id_cliente = cl.id_cliente
  LEFT JOIN Detalle_Venta dv ON v.id_venta = dv.id_venta
  GROUP BY v.id_venta
''');

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_recetas_detalle AS
  SELECT 
    r.id_receta,
    r.nombre AS nombre_receta,
    r.cantidad_base,
    ap.nombre AS producto_final,
    ap.id_articulo AS id_producto_final,
    ac.nombre AS componente,
    ac.id_articulo AS id_componente,
    rd.cantidad AS cantidad_necesaria,
    um.nombre AS unidad_componente,
    ac.costo_unitario AS costo_unitario_actual,
    (rd.cantidad * ac.costo_unitario) AS costo_componente,
    (SELECT SUM(rd2.cantidad * a2.costo_unitario)
     FROM Receta_Detalle rd2
     JOIN Articulo a2 ON rd2.id_articulo_componente = a2.id_articulo
     WHERE rd2.id_receta = r.id_receta) AS costo_total_receta_estimado
  FROM Receta r
  JOIN Articulo ap ON r.id_articulo_producto = ap.id_articulo
  JOIN Receta_Detalle rd ON r.id_receta = rd.id_receta
  JOIN Articulo ac ON rd.id_articulo_componente = ac.id_articulo
  JOIN Unidad_Medida um ON rd.id_unidad = um.id_unidad
''');

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_produccion_resumen AS
  SELECT 
    op.id_orden_produccion,
    op.fecha,
    op.cantidad_producida,
    op.costo_total_produccion,
    op.notas,
    r.nombre AS receta,
    ap.nombre AS producto_producido,
    COUNT(opc.id_consumo) AS cantidad_insumos_diferentes,
    SUM(opc.cantidad_usada) AS total_unidades_consumidas,
    SUM(opc.cantidad_usada * opc.costo_articulo_momento) AS costo_real_calculado
  FROM Orden_Produccion op
  JOIN Receta r ON op.id_receta = r.id_receta
  JOIN Articulo ap ON r.id_articulo_producto = ap.id_articulo
  LEFT JOIN Orden_Produccion_Consumo opc ON op.id_orden_produccion = opc.id_orden_produccion
  GROUP BY op.id_orden_produccion
''');

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_rentabilidad_ventas AS
  SELECT 
    v.id_venta,
    v.fecha,
    cl.nombre || ' ' || cl.apellido AS cliente,
    a.nombre AS articulo,
    dv.cantidad,
    dv.precio_unitario_venta,
    a.costo_unitario,
    (dv.cantidad * dv.precio_unitario_venta) AS ingreso,
    (dv.cantidad * a.costo_unitario) AS costo_estimado,
    (dv.cantidad * dv.precio_unitario_venta) - (dv.cantidad * a.costo_unitario) AS ganancia_neta,
    CASE 
      WHEN (dv.cantidad * dv.precio_unitario_venta) > 0 
      THEN ROUND(((dv.cantidad * dv.precio_unitario_venta) - (dv.cantidad * a.costo_unitario)) * 100.0 / (dv.cantidad * dv.precio_unitario_venta), 2)
      ELSE 0 
    END AS margen_porcentaje
  FROM Venta v
  JOIN Cliente cl ON v.id_cliente = cl.id_cliente
  JOIN Detalle_Venta dv ON v.id_venta = dv.id_venta
  JOIN Articulo a ON dv.id_articulo = a.id_articulo
''');

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_inventario_stock AS
  SELECT 
    a.id_articulo,
    a.nombre,
    a.descripcion,
    a.tipo,
    a.stock,
    um.nombre AS unidad,
    a.costo_unitario,
    (a.stock * a.costo_unitario) AS valor_inventario,
    CASE 
      WHEN a.stock <= 0 THEN 'SIN STOCK'
      WHEN a.stock < 10 THEN 'BAJO'   -- ajusta el umbral según tu negocio
      ELSE 'OK'
    END AS estado_stock
  FROM Articulo a
  JOIN Unidad_Medida um ON a.id_unidad = um.id_unidad
''');

    await db.execute('''
  CREATE VIEW IF NOT EXISTS v_consumo_insumos_periodo AS
  SELECT 
    a.id_articulo,
    a.nombre AS insumo,
    um.nombre AS unidad,
    SUM(opc.cantidad_usada) AS total_consumido,
    SUM(opc.cantidad_usada * opc.costo_articulo_momento) AS costo_total_consumido,
    MIN(op.fecha) AS primera_fecha,
    MAX(op.fecha) AS ultima_fecha
  FROM Orden_Produccion_Consumo opc
  JOIN Orden_Produccion op ON opc.id_orden_produccion = op.id_orden_produccion
  JOIN Articulo a ON opc.id_articulo = a.id_articulo
  JOIN Unidad_Medida um ON a.id_unidad = um.id_unidad
  GROUP BY a.id_articulo
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_validar_stock_venta
  BEFORE INSERT ON Detalle_Venta
  BEGIN
    SELECT CASE
      WHEN (SELECT IFNULL(stock, 0) FROM Articulo WHERE id_articulo = NEW.id_articulo) < NEW.cantidad
      THEN RAISE(ABORT, 'Stock insuficiente para registrar la venta')
    END;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_validar_stock_produccion
  BEFORE INSERT ON Orden_Produccion_Consumo
  BEGIN
    SELECT CASE
      WHEN (SELECT IFNULL(stock, 0) FROM Articulo WHERE id_articulo = NEW.id_articulo) < NEW.cantidad_usada
      THEN RAISE(ABORT, 'Stock insuficiente para consumo en producción')
    END;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_compra_insert
  AFTER INSERT ON Detalle_Compra
  BEGIN
    UPDATE Articulo
    SET 
      stock = stock + NEW.cantidad,
      costo_unitario = NEW.precio_unitario_compra
    WHERE id_articulo = NEW.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_compra_update
  AFTER UPDATE ON Detalle_Compra
  WHEN OLD.cantidad != NEW.cantidad
  BEGIN
    UPDATE Articulo
    SET stock = stock - OLD.cantidad + NEW.cantidad
    WHERE id_articulo = NEW.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_compra_delete
  AFTER DELETE ON Detalle_Compra
  BEGIN
    UPDATE Articulo
    SET stock = stock - OLD.cantidad
    WHERE id_articulo = OLD.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_venta_insert
  AFTER INSERT ON Detalle_Venta
  BEGIN
    UPDATE Articulo
    SET stock = stock - NEW.cantidad
    WHERE id_articulo = NEW.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_venta_update
  AFTER UPDATE ON Detalle_Venta
  WHEN OLD.cantidad != NEW.cantidad
  BEGIN
    UPDATE Articulo
    SET stock = stock + OLD.cantidad - NEW.cantidad
    WHERE id_articulo = NEW.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_venta_delete
  AFTER DELETE ON Detalle_Venta
  BEGIN
    UPDATE Articulo
    SET stock = stock + OLD.cantidad
    WHERE id_articulo = OLD.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_prod_consumo_insert
  AFTER INSERT ON Orden_Produccion_Consumo
  BEGIN
    UPDATE Articulo
    SET stock = stock - NEW.cantidad_usada
    WHERE id_articulo = NEW.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_prod_consumo_update
  AFTER UPDATE ON Orden_Produccion_Consumo
  WHEN OLD.cantidad_usada != NEW.cantidad_usada
  BEGIN
    UPDATE Articulo
    SET stock = stock + OLD.cantidad_usada - NEW.cantidad_usada
    WHERE id_articulo = NEW.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_prod_consumo_delete
  AFTER DELETE ON Orden_Produccion_Consumo
  BEGIN
    UPDATE Articulo
    SET stock = stock + OLD.cantidad_usada
    WHERE id_articulo = OLD.id_articulo;
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_orden_prod_insert
  AFTER INSERT ON Orden_Produccion
  BEGIN
    UPDATE Articulo
    SET stock = stock + NEW.cantidad_producida
    WHERE id_articulo = (
      SELECT id_articulo_producto 
      FROM Receta 
      WHERE id_receta = NEW.id_receta
    );
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_orden_prod_update
  AFTER UPDATE ON Orden_Produccion
  WHEN OLD.cantidad_producida != NEW.cantidad_producida
  BEGIN
    UPDATE Articulo
    SET stock = stock - OLD.cantidad_producida + NEW.cantidad_producida
    WHERE id_articulo = (
      SELECT id_articulo_producto 
      FROM Receta 
      WHERE id_receta = NEW.id_receta
    );
  END;
''');

    await db.execute('''
  CREATE TRIGGER IF NOT EXISTS trg_orden_prod_delete
  AFTER DELETE ON Orden_Produccion
  BEGIN
    UPDATE Articulo
    SET stock = stock - OLD.cantidad_producida
    WHERE id_articulo = (
      SELECT id_articulo_producto 
      FROM Receta 
      WHERE id_receta = OLD.id_receta
    );
  END;
''');
  }
}
