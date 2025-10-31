import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cafe_sales.db");

    return await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  // Metodos para facilitar las pruebas
  Future<void> testOnCreate(Database db, [int version = 3]) =>
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
    // Actualizaciones
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
        nombre TEXT NOT NULL UNIQUE
      )
    ''');

    await db.execute('''
      CREATE TABLE Cliente (
        id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        apellido TEXT,
        telefono TEXT,
        email TEXT UNIQUE
      )
    ''');

    await db.execute('''
      CREATE TABLE Proveedor (
        id_proveedor INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        telefono TEXT,
        email TEXT UNIQUE,
        direccion TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Insumo (
        id_insumo INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL UNIQUE,
        descripcion TEXT,
        id_unidad INTEGER NOT NULL,
        costo_unitario TEXT DEFAULT 0.0,
        FOREIGN KEY (id_unidad) REFERENCES Unidad_Medida (id_unidad)
      )
    ''');

    await db.execute('''
      CREATE TABLE Producto (
        id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL UNIQUE,
        descripcion TEXT,
        precio_venta TEXT DEFAULT 0.0
      )
    ''');

    await db.execute('''
      CREATE TABLE Insumo_Producto (
        id_insumo_producto INTEGER PRIMARY KEY AUTOINCREMENT,
        id_insumo INTEGER NOT NULL,
        id_producto INTEGER NOT NULL,
        cantidad_requerida REAL DEFAULT 0.0,
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo),
        FOREIGN KEY (id_producto) REFERENCES Producto (id_producto),
        UNIQUE (id_insumo, id_producto)
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
        id_insumo INTEGER NOT NULL,
        cantidad INTEGER NOT NULL,
        precio_unitario_compra TEXT NOT NULL,
        FOREIGN KEY (id_compra) REFERENCES Compra (id_compra),
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo)
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
        estado TEXT NOT NULL DEFAULT 'pendiente' CHECK (estado IN ('pendiente', 'completado', 'cancelado'))
        FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente) ON DELETE RESTRICT
      )
    ''');

    await db.execute('''
      CREATE TABLE Detalle_Venta (
        id_detalle_venta INTEGER PRIMARY KEY AUTOINCREMENT,
        id_venta INTEGER NOT NULL,
        id_producto INTEGER NOT NULL,
        cantidad INTEGER NOT NULL,
        precio_unitario_venta TEXT NOT NULL,
        FOREIGN KEY (id_venta) REFERENCES Venta (id_venta),
        FOREIGN KEY (id_producto) REFERENCES Producto (id_producto)
        UNIQUE(id_venta, id_producto)
      )
    ''');

    //Produccion
    //
    await db.execute('''
      CREATE TABLE Orden_Produccion (
      id_orden_produccion INTEGER PRIMARY KEY AUTOINCREMENT,
      id_producto INTEGER NOT NULL,
      cantidad_producida INTEGER NOT NULL,
      fecha DATETIME NOT NULL,
      costo_total_produccion TEXT DEFAULT '0.0',
      notas TEXT,
      FOREIGN KEY (id_producto) REFERENCES Producto (id_producto)
      )
    ''');

    await db.execute('''
      CREATE TABLE Detalle_Produccion_Insumo (
        id_detalle_produccion INTEGER PRIMARY KEY AUTOINCREMENT,
        id_orden_produccion INTEGER NOT NULL,
        id_insumo INTEGER NOT NULL,
        costo_insumo_momento TEXT DEFAULT '0.0',
        FOREIGN KEY (id_orden_produccion) REFERENCES Orden_Produccion (id_orden_produccion),
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo)
      )
      ''');

    // Inventario de Insumos (SOLO MOVIMIENTOS)
    await db.execute('''
      CREATE TABLE Movimiento_Inventario_Insumo (
        id_movimiento INTEGER PRIMARY KEY AUTOINCREMENT,
        id_insumo INTEGER NOT NULL,
        tipo TEXT NOT NULL CHECK (tipo IN ('entrada', 'salida', 'ajuste')),
        cantidad INTEGER NOT NULL, -- Positivo para entradas, Negativo para salidas
        fecha DATETIME NOT NULL,
        id_detalle_compra INTEGER,
        id_detalle_produccion INTEGER,
        motivo TEXT,
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo),
        FOREIGN KEY (id_detalle_compra) REFERENCES Detalle_Compra(id_detalle_compra),
        FOREIGN KEY (id_detalle_produccion) REFERENCES Detalle_Produccion_Insumo(id_detalle_produccion)
        CHECK (id_detalle_compra IS NULL OR id_detalle_produccion IS NULL)
      )
      ''');

    // --- Inventario de Productos (SOLO MOVIMIENTOS) ---
    await db.execute('''
      CREATE TABLE Movimiento_Inventario_Producto (
        id_movimiento_producto INTEGER PRIMARY KEY AUTOINCREMENT,
        id_producto INTEGER NOT NULL,
        tipo TEXT NOT NULL CHECK (tipo IN ('entrada', 'salida', 'ajuste')),
        cantidad INTEGER NOT NULL, -- Positivo para entradas, Negativo para salidas
        fecha DATETIME NOT NULL,
        id_detalle_venta INTEGER,
        id_orden_produccion INTEGER,
        motivo TEXT,
        FOREIGN KEY (id_producto) REFERENCES Producto (id_producto),
        FOREIGN KEY (id_detalle_venta) REFERENCES Detalle_Venta(id_detalle_venta),
        FOREIGN KEY (id_orden_produccion) REFERENCES Orden_Produccion(id_orden_produccion),
        CHECK (id_detalle_venta IS NULL OR id_orden_produccion IS NULL)
      )
    ''');

    // Indices

    await db.execute('CREATE INDEX idx_venta_cliente ON Venta (id_cliente)');
    await db.execute(
      'CREATE INDEX idx_detalle_venta_venta ON Detalle_Venta (id_venta)',
    );
    await db.execute(
      'CREATE INDEX idx_detalle_venta_producto ON Detalle_Venta (id_producto)',
    );
    await db.execute(
      'CREATE INDEX idx_insumo_producto_insumo ON Insumo_Producto (id_insumo)',
    );
    await db.execute(
      'CREATE INDEX idx_insumo_producto_producto ON Insumo_Producto (id_producto)',
    );
    await db.execute(
      'CREATE INDEX idx_compra_proveedor ON Compra (id_proveedor)',
    );
    await db.execute(
      'CREATE INDEX idx_detalle_compra_insumo ON Detalle_Compra (id_insumo)',
    );
    await db.execute(
      'CREATE INDEX idx_orden_prod_prod ON Orden_Produccion (id_producto)',
    );
    await db.execute(
      'CREATE INDEX idx_detalle_prod_orden ON Detalle_Produccion_Insumo (id_orden_produccion)',
    );
    await db.execute(
      'CREATE INDEX idx_detalle_prod_insumo ON Detalle_Produccion_Insumo (id_insumo)',
    );
    await db.execute(
      'CREATE INDEX idx_mov_insumo_insumo ON Movimiento_Inventario_Insumo (id_insumo)',
    );
    await db.execute(
      'CREATE INDEX idx_mov_prod_prod ON Movimiento_Inventario_Producto (id_producto)',
    );

    // Views
    await db.execute('''
    CREATE VIEW V_Inventario_Insumo_Stock AS 
    SELECT
      i.id_insumo,
      i.nombre,
      i.costo_unitario,
      u.nombre AS unidad_medida,
      COALESCE(SUM(mii.cantidad), 0) AS stock_actual
    FROM
      Insumo AS i
    JOIN
      Unidad_Medida AS u ON i.id_unidad = u.id_unidad
    LEFT JOIN
      Movimiento_Inventario_Insumo AS mii ON i.id_insumo = mii.id_insumo
    GROUP BY
      i.id_insumo, i.nombre, i.costo_unitario, u.nombre
    ''');

    await db.execute('''
    CREATE VIEW V_Inventario_Producto_Stock AS
    SELECT
      p.id_producto,
      p.nombre,
      p.precio_venta,
      COALESCE(SUM(mip.cantidad), 0) AS stock_actual
    FROM
      Producto AS p
    LEFT JOIN
      Movimiento_Inventario_Producto AS mip ON p.id_producto = mip.id_producto
    GROUP BY
      p.id_producto, p.nombre, p.precio_venta
    ''');

    //TRIGGERS
    await db.execute('''
      CREATE TRIGGER trg_compra_insumo
      AFTER INSERT ON Detalle_Compra
      BEGIN
        INSERT INTO Movimiento_Inventario_Insumo (
        id_insumo, tipo, cantidad, fecha, id_detalle_compra, motivo
        )
        VALUES (
        NEW.id_insumo, 
        'entrada',
        NEW.cantidad,
        (SELECT fecha FROM Compra WHERE id_compra = NEW.id_compra),
        NEW.id_detalle_compra,
        'Compra'
        );
        END
    ''');
    await db.execute('''
      CREATE TRIGGER trg_produccion_insumo
      AFTER INSERT ON Detalle_Produccion_Insumo
      BEGIN
        INSERT INTO Movimiento_Inventario_Insumo (
        id_insumo, tipo, cantidad, fecha, id_detalle_produccion, motivo
        )
        VALUES (
        NEW.id_insumo,
        'salida',
        -NEW.cantidad_usada,
        (SELECT fecha FROM Orden_Produccion WHERE id_orden_produccion = NEW.id_orden_produccion)
        NEW.id_detalle_produccion,
        'Produccion'
        );
        END
    ''');
    await db.execute('''
      CREATE TRIGGER trg_produccion_producto
      AFTER INSERT ON Orden_Produccion
      BEGIN
        INSERT INTO Movimiento_Inventario_Producto (
        id_producto, tipo, cantidad, fecha, id_orden_produccion, motivo
        )
        VALUES (
        NEW.id_producto,
        'entrada',
        NEW.cantidad_producida,
        NEW.fecha,
        NEW.id_orden_produccion,
        'Produccion'
        );
        END
    ''');
    await db.execute('''
      CREATE TRIGGER trg_venta_producto
      AFTER INSERT ON Detalle_Venta
      BEGIN
        INSERT INTO Movimiento_Inventario_Producto (
          id_producto, tipo, cantidad, fecha, id_detalle_venta, motivo
        )
        VALUES (
          NEW.id_producto,
          'salida',
          -NEW.cantidad, -- Cantidad en negativo
          (SELECT fecha FROM Venta WHERE id_venta = NEW.id_venta),
          NEW.id_detalle_venta,
          'Venta'
        );
      END
    ''');
  }
}
