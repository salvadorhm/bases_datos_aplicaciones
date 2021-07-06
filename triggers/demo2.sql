.headers on
.mode column
PRAGMA foreign_keys = ON;

CREATE TABLE productos (
    id_producto integer PRIMARY KEY,
    nombre text NOT NULL,
    existencias int not null
);

INSERT INTO productos(nombre,existencias)
VALUES
('Producto 1',10),
('Producto 2',10);

SELECT * FROM productos;

CREATE TABLE detalle_ventas (
    id_detalle integer PRIMARY KEY,
    fecha date NOT NULL,
    id_producto integer REFERENCES productos(id_producto),
    cantidad integer
);

CREATE TRIGGER actualizar_invetario
   AFTER INSERT ON detalle_ventas
BEGIN
    UPDATE productos
    SET existencias = existencias - new.cantidad
    where id_producto = new.id_producto;
END;

INSERT INTO detalle_ventas (fecha,id_producto,cantidad)
VALUES('2021/01/01',1,2);

SELECT * FROM detalle_ventas;
SELECT * FROM productos;