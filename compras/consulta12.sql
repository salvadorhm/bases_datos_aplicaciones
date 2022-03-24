SELECT productos.producto, sum(detalle_compras.cantidad_producto) as cantidad_producto
FROM productos,detalle_compras
WHERE detalle_compras.id_producto= productos.id_producto
GROUP BY productos.producto;