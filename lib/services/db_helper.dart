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
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cafe_sales.db");

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  // Metodos para facilitar las pruebas
  Future<void> testOnCreate(Database db, [int version = 2]) =>
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

  // Crea las tablas cuando la BD se crea por primera vez
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
        email TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Proveedor (
        id_proveedor INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        telefono TEXT,
        email TEXT,
        direccion TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Insumo (
        id_insumo INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL UNIQUE,
        descripcion TEXT,
        id_unidad INTEGER NOT NULL,
        costo_unitario REAL DEFAULT 0.0,
        FOREIGN KEY (id_unidad) REFERENCES Unidad_Medida (id_unidad)
      )
    ''');

    await db.execute('''
      CREATE TABLE Producto (
        id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL UNIQUE,
        descripcion TEXT,
        precio_venta REAL DEFAULT 0.0
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

    await db.execute('''
      CREATE TABLE Venta (
        id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
        id_cliente INTEGER NOT NULL,
        fecha DATETIME NOT NULL,
        detalles TEXT,
        pagado BOOLEAN DEFAULT 0,
        estado TEXT NOT NULL DEFAULT 'Completa',
        FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente) ON DELETE RESTRICT
      )
    ''');

    await db.execute('''
      CREATE TABLE Detalle_Venta (
        id_detalle_venta INTEGER PRIMARY KEY AUTOINCREMENT,
        id_venta INTEGER NOT NULL,
        id_producto INTEGER NOT NULL,
        cantidad INTEGER NOT NULL,
        precio_unitario_venta REAL NOT NULL,
        FOREIGN KEY (id_venta) REFERENCES Venta (id_venta),
        FOREIGN KEY (id_producto) REFERENCES Producto (id_producto)
      )
    ''');

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
        precio_unitario_compra REAL NOT NULL,
        FOREIGN KEY (id_compra) REFERENCES Compra (id_compra),
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo)
      )
    ''');

    await db.execute('''
      CREATE TABLE Inventario(
        id_insumo INTEGER PRIMARY KEY AUTOINCREMENT,
        stock REAL NOT NULL DEFAULT 0,
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo)
      )
      ''');

    await db.execute('''
      CREATE TABLE Movimiento_Inventario(
        id_movimiento INTEGER PRIMARY KEY AUTOINCREMENT,
        id_insumo INTEGER NOT NULL,
        tipo TEXT NOT NULL CHECK (tipo IN ('Entrada', 'Salida', 'Ajuste Entrada', 'Ajuste Salida', 'invalid')),
        cantidad REAL NOT NULL,
        fecha DATETIME NOT NULL,
        id_detalle_compra INTEGER,
        id_detalle_venta INTEGER,
        motivo TEXT,
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo),
FOREIGN KEY (id_detalle_compra) REFERENCES Detalle_Compra(id_detalle_compra),
        FOREIGN KEY (id_detalle_venta) REFERENCES Detalle_Venta (id_detalle_venta)
      )
      ''');

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
      'CREATE INDEX idx_movimiento_inventario ON Movimiento_Inventario(id_insumo)',
    );
  }
}
