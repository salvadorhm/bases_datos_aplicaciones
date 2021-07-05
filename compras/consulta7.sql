SELECT proveedores.id_proveedor, proveedores.proveedor, proveedores.nombre_contacto, proveedores.email_contacto, compras.fecha, compras.id_compra, detalle_compras.id_producto, productos.producto, detalle_compras.cantidad_producto,detalle_compras.precio_unitario,detalle_compras.total_x_producto
FROM proveedores, compras, productos, detalle_compras
WHERE
proveedores.id_proveedor = compras.id_proveedor AND
compras.id_compra = detalle_compras.id_compra AND
detalle_compras.id_producto = productos.id_producto;