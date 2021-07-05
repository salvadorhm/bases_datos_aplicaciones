  
SELECT proveedores.proveedor, sum(detalle_compras.total_x_producto) as total_compra
FROM proveedores,compras, detalle_compras
WHERE proveedores.id_proveedor= compras.id_proveedor AND compras.id_compra = detalle_compras.id_compra
GROUP BY  proveedores.proveedor;