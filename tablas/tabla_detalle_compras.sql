CREATE TABLE detalle_compras(
    id_detalle_compra integer PRIMARY KEY AUTOINCREMENT,
    id_compra integer REFERENCES compras(id_compra),
    id_producto integer REFERENCES productos(id_producto),
    cantidad_producto integer,
    precio_unitario float,
    total_x_producto float
);


INSERT INTO detalle_compras(id_compra,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES
(1,1,100,5,500),
(1,2,150,20,3000),
(2,1,200,5,1000),
(2,2,250,20,5000),
(3,1,300,5,600);


SELECT * FROM detalle_compras;