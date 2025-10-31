erDiagram

Unidad_Medida {
INTEGER id_unidad PK
VARCHAR(50) nombre UK
}

Cliente {
INTEGER id_cliente PK
VARCHAR(100) nombre
VARCHAR(100) apellido
VARCHAR(20) telefono
VARCHAR(255) email UK
}

Proveedor {
INTEGER id_proveedor PK
VARCHAR(255) nombre
VARCHAR(20) telefono
VARCHAR(255) email UK
TEXT direccion
}


Insumo {
INTEGER id_insumo PK
VARCHAR(255) nombre UK
TEXT descripcion
INTEGER id_unidad FK
DECIMAL(12, 4) costo_unitario  %% <-- APLICADO
}

Producto {
INTEGER id_producto PK
VARCHAR(255) nombre UK
TEXT descripcion
DECIMAL(10, 2) precio_venta %% <-- APLICADO
}

Insumo_Producto {
INTEGER id_insumo_producto PK
INTEGER id_insumo FK
INTEGER id_producto FK
REAL cantidad_requerida
UNIQUE(id_insumo, id_producto) %% <-- RECOMENDACION APLICADA
}


Compra {
INTEGER id_compra PK
INTEGER id_proveedor FK
DATETIME fecha
TEXT detalles
BOOLEAN pagado
}

Detalle_Compra {
INTEGER id_detalle_compra PK
INTEGER id_compra FK
INTEGER id_insumo FK
INTEGER cantidad
DECIMAL(12, 4) precio_unitario_compra %% <-- APLICADO
UNIQUE(id_compra, id_insumo) %% <-- RECOMENDACION APLICADA
}


Venta {
INTEGER id_venta PK
INTEGER id_cliente FK
DATETIME fecha
TEXT detalles
BOOLEAN pagado
VARCHAR(50) estado %% RECOMENDACION APLICADA: Usar ENUM('pendiente', 'completado', 'cancelado') o una tabla FK
}

Detalle_Venta {
INTEGER id_detalle_venta PK
INTEGER id_venta FK
INTEGER id_producto FK
INTEGER cantidad
DECIMAL(10, 2) precio_unitario_venta %% <-- APLICADO
UNIQUE(id_venta, id_producto) %% <-- RECOMENDACION APLICADA
}


Orden_Produccion {
INTEGER id_orden_produccion PK
INTEGER id_producto FK %% Producto que se va a crear
INTEGER cantidad_producida
DATETIME fecha
DECIMAL(12, 4) costo_total_produccion %% Costo calculado de los insumos
TEXT notas
}

Detalle_Produccion_Insumo {
INTEGER id_detalle_produccion PK
INTEGER id_orden_produccion FK
INTEGER id_insumo FK
REAL cantidad_usada
DECIMAL(12, 4) costo_insumo_momento %% Costo del insumo al producir
}


Movimiento_Inventario_Insumo {
INTEGER id_movimiento PK
INTEGER id_insumo FK
VARCHAR(50) tipo %% RECOMENDACION APLICADA: Usar ENUM('entrada', 'salida', 'ajuste') o tabla FK
REAL cantidad %% Positivo para entradas, Negativo para salidas
DATETIME fecha
INTEGER id_detalle_compra FK
INTEGER id_detalle_produccion FK
TEXT motivo
%% RECOMENDACION APLICADA: Añadir CHECK (id_detalle_compra IS NULL OR id_detalle_produccion IS NULL)
}


Movimiento_Inventario_Producto {
INTEGER id_movimiento_producto PK
INTEGER id_producto FK
VARCHAR(50) tipo %% RECOMENDACION APLICADA: Usar ENUM('entrada', 'salida', 'ajuste') o tabla FK
INTEGER cantidad %% Positivo para entradas, Negativo para salidas
DATETIME fecha
INTEGER id_detalle_venta FK %% Origen de una SALIDA
INTEGER id_orden_produccion FK %% Origen de una ENTRADA
TEXT motivo
%% RECOMENDARION APLICADA: Añadir CHECK (id_detalle_venta IS NULL OR id_orden_produccion IS NULL)
}

Unidad_Medida ||--o{ Insumo
Cliente ||--o{ Venta
Proveedor ||--o{ Compra
Compra ||--o{ Detalle_Compra
Venta ||--o{ Detalle_Venta
Producto ||--o{ Detalle_Venta
Insumo ||--o{ Detalle_Compra
Insumo ||--o{ Insumo_Producto
Producto ||--o{ Insumo_Producto

Insumo ||--o{ Movimiento_Inventario_Insumo
Detalle_Compra |o--o{ Movimiento_Inventario_Insumo : "genera entrada"

Producto ||--o{ Orden_Produccion : "se produce"
Orden_Produccion ||--o{ Detalle_Produccion_Insumo : "consume"
Insumo ||--o{ Detalle_Produccion_Insumo
Detalle_Produccion_Insumo |o--o{ Movimiento_Inventario_Insumo : "genera salida"
Orden_Produccion |o--o{ Movimiento_Inventario_Producto : "genera entrada"

Producto ||--o{ Movimiento_Inventario_Producto
Detalle_Venta |o--o{ Movimiento_Inventario_Producto : "genera salida"
