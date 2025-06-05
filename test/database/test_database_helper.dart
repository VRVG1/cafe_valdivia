import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> openTestDatabase() async {
  sqfliteFfiInit();

  final Database db = await databaseFactoryFfi.openDatabase(
    inMemoryDatabasePath,
    options: OpenDatabaseOptions(
      version: 1,
      onCreate: (db, version) async {
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
        // Crear índices
        await db.execute(
          'CREATE INDEX idx_venta_cliente ON Venta (id_cliente)',
        );
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
          'CREATE INDEX idx_compra_insumo ON Compra (id_insumo)',
        );
      },
    ),
  );
  return db;
}
