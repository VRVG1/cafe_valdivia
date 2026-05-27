erDiagram
Unidad_Medida {
INTEGER id_unidad PK "Identificador único de la unidad de medida"
TEXT nombre UK "Nombre de la unidad (ej: kg, litros, unidades) - No puede estar vacío"
TEXT descripcion "Descripción de la unidad"
}

    Cliente {
        INTEGER id_cliente PK "Identificador único del cliente"
        TEXT nombre "Nombre del cliente - No puede estar vacío"
        TEXT apellido "Apellido del cliente - No puede estar vacío"
        TEXT telefono "Número de teléfono del cliente"
        TEXT email UK "Correo electrónico único del cliente"
    }

    Proveedor {
        INTEGER id_proveedor PK "Identificador único del proveedor"
        TEXT nombre "Nombre del proveedor - No puede estar vacío"
        TEXT telefono "Número de teléfono del proveedor"
        TEXT email UK "Correo electrónico único del proveedor"
        TEXT direccion "Dirección física del proveedor"
    }

    Articulo {
        INTEGER id_articulo PK "Identificador único del artículo"
        TEXT nombre UK "Nombre del artículo - No puede estar vacío y debe ser único"
        TEXT descripcion "Descripción detallada del artículo"
        TEXT tipo "INSUMO | PRODUCTO_INTERMEDIO | PRODUCTO_FINAL"
        INTEGER id_unidad FK "Referencia a la unidad de medida"
        TEXT costo_unitario "Costo por unidad en formato texto"
        TEXT precio_venta "Precio de venta en formato texto (si aplica)"
        REAL stock "Inventario actual"
    }

    Compra {
        INTEGER id_compra PK "Identificador único de la compra"
        INTEGER id_proveedor FK "Referencia al proveedor de la compra"
        DATETIME fecha "Fecha y hora en que se realizó la compra"
        TEXT detalles "Información adicional sobre la compra"
        BOOLEAN pagado "Indica si la compra ha sido pagada (0=false, 1=true)"
    }

    Detalle_Compra {
        INTEGER id_detalle_compra PK "Identificador único del detalle de compra"
        INTEGER id_compra FK "Referencia a la compra padre"
        INTEGER id_articulo FK "Referencia al artículo comprado"
        REAL cantidad "Cantidad comprada del artículo"
        TEXT precio_unitario_compra "Precio unitario al que se compró el artículo"
    }

    Venta {
        INTEGER id_venta PK "Identificador único de la venta"
        INTEGER id_cliente FK "Referencia al cliente que realiza la compra"
        DATETIME fecha "Fecha y hora en que se realizó la venta"
        TEXT detalles "Información adicional sobre la venta"
        BOOLEAN pagado "Indica si la venta ha sido pagada (0=false, 1=true)"
        TEXT estado "Estado de la venta: pendiente, completado, cancelado"
    }

    Detalle_Venta {
        INTEGER id_detalle_venta PK "Identificador único del detalle de venta"
        INTEGER id_venta FK "Referencia a la venta padre"
        INTEGER id_articulo FK "Referencia al artículo vendido"
        REAL cantidad "Cantidad vendida del artículo"
        TEXT precio_unitario_venta "Precio unitario al que se vendió el artículo"
    }

    Receta {
        INTEGER id_receta PK "Identificador único de la receta (BOM)"
        INTEGER id_articulo_producto FK "Producto que resulta de esta receta"
        TEXT nombre "Nombre descriptivo de la receta"
        TEXT version "Versión de la receta (ej: 1.0)"
        REAL cantidad_base "Cantidad de producto que genera la receta (ej: 1 kg)"
        BOOLEAN activa "Indica si la receta está activa"
    }

    Receta_Detalle {
        INTEGER id_receta_detalle PK "Identificador único del componente de receta"
        INTEGER id_receta FK "Referencia a la receta padre"
        INTEGER id_articulo_componente FK "Artículo consumido en la receta"
        REAL cantidad "Cantidad necesaria por cada cantidad_base"
        INTEGER id_unidad FK "Unidad de medida del componente"
    }

    Orden_Produccion {
        INTEGER id_orden_produccion PK "Identificador único de la orden de producción"
        INTEGER id_receta FK "Receta que se ejecuta en esta orden"
        REAL cantidad_producida "Cantidad de unidades producidas (multiplicador de cantidad_base)"
        DATETIME fecha "Fecha y hora de la producción"
        TEXT costo_total_produccion "Costo total de la producción en formato texto"
        TEXT notas "Observaciones y notas sobre la producción"
    }

    Orden_Produccion_Consumo {
        INTEGER id_consumo PK "Identificador único del registro de consumo"
        INTEGER id_orden_produccion FK "Referencia a la orden de producción"
        INTEGER id_articulo FK "Artículo consumido (insumo o producto intermedio)"
        REAL cantidad_usada "Cantidad real utilizada en la producción"
        TEXT costo_insumo_momento "Costo del artículo al momento de la producción"
    }

    %% Relaciones de Unidades
    Unidad_Medida ||--o{ Articulo : "define_unidad"
    Unidad_Medida ||--o{ Receta_Detalle : "define_unidad"

    %% Cadena de Compras
    Proveedor ||--o{ Compra : "provee"
    Compra ||--o{ Detalle_Compra : "contiene"
    Detalle_Compra }o--|| Articulo : "adquiere"

    %% Cadena de Ventas
    Cliente ||--o{ Venta : "realiza"
    Venta ||--o{ Detalle_Venta : "contiene"
    Detalle_Venta }o--|| Articulo : "vende"

    %% Cadena de Recetas (BOM)
    Articulo ||--o{ Receta : "produce_con"
    Receta ||--o{ Receta_Detalle : "compuesta_por"
    Receta_Detalle }o--|| Articulo : "consume"

    %% Cadena de Producción
    Receta ||--o{ Orden_Produccion : "se_ejecuta_en"
    Orden_Produccion ||--o{ Orden_Produccion_Consumo : "registra_consumo"
    Orden_Produccion_Consumo }o--|| Articulo : "consume"
