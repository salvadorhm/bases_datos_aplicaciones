SELECT * from productos;

ALTER TABLE productos
ADD existencias integer default 100;

SELECT * from productos;
