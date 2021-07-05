select detalle_compras.id_compra, sum(total_x_producto) as total_compra

FROM detalle_compras

GROUP BY id_compra;