SELECT compras.fecha, sum(detalle_compras.total_x_producto) as total_compra
FROM compras, detalle_compras
WHERE compras.id_compra = detalle_compras.id_compra
GROUP BY compras.id_compra ORDER BY total_compra DESC LIMIT 1;