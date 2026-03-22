erDiagram
Unidad_Medida {
INTEGER id_unidad PK "Identificador único de la unidad de medida"
TEXT nombre UK "Nombre de la unidad (ej: kg, litros, unidades) - No puede estar vacío"
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

Insumo {
INTEGER id_insumo PK "Identificador único del insumo"
TEXT nombre UK "Nombre del insumo - No puede estar vacío y debe ser único"
TEXT descripcion "Descripción detallada del insumo"
INTEGER id_unidad FK "Referencia a la unidad de medida"
TEXT costo_unitario "Costo por unidad del insumo en formato texto"
}

Producto {
INTEGER id_producto PK "Identificador único del producto terminado"
TEXT nombre UK "Nombre del producto - No puede estar vacío y debe ser único"
TEXT descripcion "Descripción detallada del producto"
TEXT precio_venta "Precio de venta del producto en formato texto"
}

Insumo_Producto {
INTEGER id_insumo_producto PK "Identificador único de la relación insumo-producto"
INTEGER id_insumo FK "Referencia al insumo utilizado"
INTEGER id_producto FK "Referencia al producto que requiere el insumo"
REAL cantidad_requerida "Cantidad de insumo necesaria para producir una unidad de producto"
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
INTEGER id_insumo FK "Referencia al insumo comprado"
INTEGER cantidad "Cantidad comprada del insumo"
TEXT precio_unitario_compra "Precio unitario al que se compró el insumo"
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
INTEGER id_producto FK "Referencia al producto vendido"
INTEGER cantidad "Cantidad vendida del producto"
TEXT precio_unitario_venta "Precio unitario al que se vendió el producto"
}

Orden_Produccion {
INTEGER id_orden_produccion PK "Identificador único de la orden de producción"
INTEGER id_producto FK "Referencia al producto a producir"
INTEGER cantidad_producida "Cantidad de unidades producidas"
DATETIME fecha "Fecha y hora de la producción"
TEXT costo_total_produccion "Costo total de la producción en formato texto"
TEXT notas "Observaciones y notas sobre la producción"
}

Detalle_Produccion_Insumo {
INTEGER id_detalle_produccion PK "Identificador único del detalle de producción"
INTEGER id_orden_produccion FK "Referencia a la orden de producción"
INTEGER id_insumo FK "Referencia al insumo utilizado"
REAL cantidad_usada "Cantidad de insumo utilizada en la producción"
TEXT costo_insumo_momento "Costo del insumo al momento de la producción"
}

Movimiento_Inventario_Insumo {
INTEGER id_movimiento PK "Identificador único del movimiento de insumo"
INTEGER id_insumo FK "Referencia al insumo del movimiento"
TEXT tipo "Tipo de movimiento: entrada, salida, ajuste"
INTEGER cantidad "Cantidad movida (positivo=entrada, negativo=salida)"
DATETIME fecha "Fecha y hora del movimiento"
INTEGER id_detalle_compra FK "Referencia opcional a detalle de compra"
INTEGER id_detalle_produccion FK "Referencia opcional a detalle de producción"
TEXT motivo "Razón o justificación del movimiento"
}

Movimiento_Inventario_Producto {
INTEGER id_movimiento_producto PK "Identificador único del movimiento de producto"
INTEGER id_producto FK "Referencia al producto del movimiento"
TEXT tipo "Tipo de movimiento: entrada, salida, ajuste"
INTEGER cantidad "Cantidad movida (positivo=entrada, negativo=salida)"
DATETIME fecha "Fecha y hora del movimiento"
INTEGER id_detalle_venta FK "Referencia opcional a detalle de venta"
INTEGER id_orden_produccion FK "Referencia opcional a orden de producción"
TEXT motivo "Razón o justificación del movimiento"
}

%% Relaciones principales
Unidad_Medida ||--o{ Insumo : define
Insumo }o--o{ Producto : compone_via "Insumo_Producto"

Proveedor ||--o{ Compra : realiza
Compra ||--o{ Detalle_Compra : contiene
Detalle_Compra }o--|| Insumo : corresponde_a

Cliente ||--o{ Venta : realiza
Venta ||--o{ Detalle_Venta : contiene
Detalle_Venta }o--|| Producto : corresponde_a

Producto ||--o{ Orden_Produccion : produce
Orden_Produccion ||--o{ Detalle_Produccion_Insumo : utiliza
Detalle_Produccion_Insumo }o--|| Insumo : consume

%% Relaciones de movimientos de inventario
Detalle_Compra ||--|| Movimiento_Inventario_Insumo : genera_entrada
Detalle_Produccion_Insumo ||--|| Movimiento_Inventario_Insumo : genera_salida
Insumo ||--o{ Movimiento_Inventario_Insumo : tiene_movimientos

Detalle_Venta ||--|| Movimiento_Inventario_Producto : genera_salida
Orden_Produccion ||--|| Movimiento_Inventario_Producto : genera_entrada
Producto ||--o{ Movimiento_Inventario_Producto : tiene_movimientos
