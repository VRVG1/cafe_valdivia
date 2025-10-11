erDiagram

  Unidad_Medida {
        INTEGER id_unidad PK
        TEXT nombre UK
    }

    Cliente {
        INTEGER id_cliente PK
        TEXT nombre
        TEXT apellido
        TEXT telefono
        TEXT email
    }

    Proveedor {
        INTEGER id_proveedor PK
        TEXT nombre
        TEXT telefono
        TEXT email
        TEXT direccion
    }

    Insumo {
        INTEGER id_insumo PK
        TEXT nombre UK
        TEXT descripcion
        INTEGER id_unidad FK
        REAL costo_unitario
    }

    Producto {
        INTEGER id_producto PK
        TEXT nombre UK
        TEXT descripcion
        REAL precio_venta
    }

    Insumo_Producto {
        INTEGER id_insumo_producto PK
        INTEGER id_insumo FK
        INTEGER id_producto FK
        REAL cantidad_requerida
    }

    Venta {
        INTEGER id_venta PK
        INTEGER id_cliente FK
        DATETIME fecha
        TEXT detalles
        BOOLEAN pagado
        TEXT estado
    }

    Detalle_Venta {
        INTEGER id_detalle_venta PK
        INTEGER id_venta FK
        INTEGER id_producto FK
        INTEGER cantidad
        REAL precio_unitario_venta
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
        REAL precio_unitario_compra
    }

    Inventario {
        INTEGER id_insumo PK
        REAL stock
    }

    Movimiento_Inventario {
        INTEGER id_movimiento PK
        INTEGER id_insumo FK
        TEXT tipo
        REAL cantidad
        DATETIME fecha
        INTEGER id_detalle_compra FK
        INTEGER id_detalle_venta FK
        TEXT motivo
    }

    Unidad_Medida ||--o{ Insumo : "tiene"
    Cliente ||--o{ Venta : "realiza"
    Proveedor ||--o{ Compra : "provee"
    Insumo ||--o{ Insumo_Producto : "es parte de"
    Producto ||--o{ Insumo_Producto : "contiene"
    Insumo ||--o{ Detalle_Compra : "se compra en"
    Producto ||--o{ Detalle_Venta : "se vende en"
    Venta ||--o{ Detalle_Venta : "tiene"
    Compra ||--o{ Detalle_Compra : "tiene"
    Insumo ||--o{ Inventario : "tiene stock"
    Insumo ||--o{ Movimiento_Inventario : "tiene movimientos"
    Detalle_Compra ||--o{ Movimiento_Inventario : "origen de"
    Detalle_Venta ||--o{ Movimiento_Inventario : "origen de"
