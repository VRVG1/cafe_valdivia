import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cafe_sales.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Crea las tablas cuando la BD se crea por primera vez
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Cliente (
        id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        apellido TEXT,
        telefono TEXT,
        email TEXT,
        kilos_comprados REAL DEFAULT 0.0,
        ventas_totales REAL DEFAULT 0.0
      )
    ''');

    await db.execute('''
      CREATE TABLE Venta (
        id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
        id_cliente INTEGER NOT NULL,
        fecha TEXT NOT NULL,
        kilos_vendidos REAL DEFAULT 0.0,
        monto_total REAL DEFAULT 0.0,
        detalles TEXT,
        pagado BOOLEAN DEFAULT 0,
        FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
      )
    ''');

    await db.execute('''
      CREATE TABLE Insumo (
        id_insumo INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL UNIQUE,
        descripcion TEXT,
        unidad_medida TEXT NOT NULL,
        stock_actual REAL DEFAULT 0.0,
        costo_unitario REAL DEFAULT 0.0
      )
    ''');

    await db.execute('''
      CREATE TABLE Producto (
        id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL UNIQUE,
        descripcion TEXT,
        precio_venta REAL DEFAULT 0.0,
        stock_disponible INTEGER DEFAULT 0
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
      CREATE TABLE Detalle_Venta (
        id_detalle_venta INTEGER PRIMARY KEY AUTOINCREMENT,
        id_venta INTEGER NOT NULL,
        id_producto INTEGER NOT NULL,
        cantidad INTEGER NOT NULL,
        precio_unitario_venta REAL DEFAULT 0.0,
        subtotal REAL DEFAULT 0.0,
        FOREIGN KEY (id_venta) REFERENCES Venta (id_venta),
        FOREIGN KEY (id_producto) REFERENCES Producto (id_producto)
      )
    ''');
    await db.execute('''
      CREATE TABLE Compra(
        id_compra INTEGER PRIMARY KEY AUTOINCREMENT,
        id_insumo INTEGER NOT NULL,
        cantidad REAL NOT NULL,
        fecha TEXT NOT NULL,
        monto_total REAL DEFAULT 0.0,
        detalles TEXT,
        pagado BOOLEAN DEFAULT 0,
        FOREIGN KEY (id_insumo) REFERENCES Insumo (id_insumo)
      )
    ''');

    // Crear índices
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
    await db.execute('CREATE INDEX idx_compra_insumo ON Compra (id_insumo)');
  }

  // Maneja las actualizaciones del esquema de la BD (cuando cambias la versión)
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Aquí puedes manejar migraciones si tu esquema cambia en futuras versiones.
    // Por ejemplo:
    // if (oldVersion < 2) {
    //   await db.execute("ALTER TABLE Cliente ADD COLUMN nueva_columna TEXT");
    // }
  }
}
