-- PARTE 1: Modelo logico en PDF's.


--PARTE 2: Se debe crear el modelo en la base de datos, 
-- en una base de datos llamada prueba , e insertar los 
-- 5 clientes, 8 productos, 3 categorias,
-- 10 facturas: 2 para el cliente 1, con 2 y 3 productos
--              3 para el cliente 2, con 3, 2 y 3 productos
--              1 para el cliente 3, con 1 producto
--              4 para el cliente 4, con 2,3, 4 y 1 producto

CREATE DATABASE prueba;

--\c prueba  You are now connected to database "prueba" as user "iperez".

-- creacion de tablas
CREATE TABLE clientes (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, rut VARCHAR(100) UNIQUE NOT NULL, direccion VARCHAR(100));
CREATE TABLE facturas (id SERIAL PRIMARY KEY, fecha_factura DATE NOT NULL, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL);
CREATE TABLE clientes_facturas (cliente_id INT NOT NULL, factura_id INT NOT NULL, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(id));
CREATE TABLE productos (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, descripcion VARCHAR(100) NOT NULL, valor_unitario FLOAT, categoria_id INT NOT NULL);
CREATE TABLE facturas_productos (factura_id INT, producto_id INT, FOREIGN KEY(factura_id) REFERENCES facturas(id), FOREIGN KEY(producto_id) REFERENCES productos(id), cantidad INT NOT NULL);
CREATE TABLE categoria (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL UNIQUE, descripcion VARCHAR(100) NOT NULL);

-- insertar 5 clientes

INSERT INTO clientes (nombre,rut,direccion) VALUES
    ('Ignacio Perez', 1, 'laflorida 5000'),
    ('Nuno Silva', 234, 'portugal 5000'),
    ('tatan najera', 2131, 'nuevazelanda 5000'),
    ('juan cabanzon', 2332, 'españa 5000'),
    ('tanya gilea', 3334, 'moldova 5000');
  
-- insertar 3 categorias

INSERT INTO categoria(nombre, descripcion) VALUES
    ('pelota','ideal para jugar'),
    ('masajeador','ideal para masajear'),
    ('gorra','necesaria para el sol');


-- insertar 8 productos,

INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES
    ('pintura', 'pinturas', 200, 1),
    ('lapiz', 'paracolorear', 300, 2),
    ('computador', 'paratrabajar', 100000, 3),
    ('escoba', 'paralimpiar', 300, 3),
    ('tv', 'parainformarse', 5000, 2),
    ('escudo', 'paraprotegrese', 2000, 1),
    ('sal', 'paramejorarlascomidas', 400, 1),
    ('pistola', 'parajugar', 500, 3);


-- insertar 10 facturas


-- DOS FACTURAS para el cliente 1, con 2 y 3 productos

-- la factura Nº1 para cliente 1 debe ser con 2 productos (compro 1 lapiz(300) + pintura(200) =500
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 500, 95, 595);
-- la factura Nº2 para cliente 1 debe ser con 3 productos (compro escoba(300)+tv (5000) + sal (400) = 5700
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 5700, 1083, 6783);


-- TRES FACTURAS para el cliente 2, con 3, 2 y 3 productos
-- la factura Nº3 para cliente 2 debe ser con 3 productos (compro pistola(500)+ sal(400) + escoba(300)= 1200
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 1200, 228, 1428);
-- la factura Nº4 para cliente 2 debe ser con 2 productos (compro escudo(2000)+ sal(400)= 2400
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 2400, 456, 2856);
-- la factura Nº5 para cliente 2 debe ser con 3 productos (compro pintura(200) + lapiz (300)+ escoba(300)=800
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 800, 152, 952);


-- UNA FACTURA para el cliente 3, con 1 producto 
-- la factura Nª 6 para cliente 3 debe ser con 1 producto (compro computador(100000) = 100000
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 100000, 19000, 119000);


-- CUATRO FACTURAS para el cliente 4, con 2, 3, 4 y 1 producto

-- la factura nº7 para cliente 4 debe ser con 2 productos (compro escoba (300)+ lapiz (300)= 600
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 600, 114, 714);
-- la factura nº8 para cliente 4 debe ser con 3 productos (compro pintura (200) + tv (5000) + escudo (2000) + pistola (500)= 7700
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 7700, 1463, 9163);
-- la factura nº9 para cliente 4 debe ser con 4 productos (compro sal(400)+pistola (500)+ lapiz (300) + escudo (2000)= 3200
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 3200, 608, 3808);
-- la factura nº10 para cliente 4 debe ser con 1 producto  (compro tv (5000)= 5000
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2020-04-09', 5000, 950, 5950);



INSERT INTO clientes_facturas(cliente_id, factura_id) VALUES

(1,1), (1,2), (2,3), (2,4), (2,5), (3,6), (4,7), (4,8), (4,9), (4,10);

INSERT INTO facturas_productos(factura_id, producto_id, cantidad) VALUES

(1, 6 ,2),
(2, 6, 3),
(3, 6, 3),
(4, 6, 2),
(5, 6, 3),
(6, 6, 1),
(7, 6, 2),
(8, 6, 3),
(9, 6, 4),
(10, 6, 1);


ALTER TABLE productos DROP COLUMN categoria_id;

-- Parte 3: Consultas. Realizar las siguientes consultas:

-- ¿Que cliente realizó la compra más cara?

SELECT nombre FROM clientes JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id JOIN facturas ON facturas.id=clientes_facturas.factura_id ORDER BY(precio_total) DESC LIMIT(1);

-- ¿Que cliente pagó sobre 100 de monto?

SELECT nombre FROM clientes JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id JOIN facturas ON facturas.id=clientes_facturas.factura_id WHERE precio_total > 100 GROUP BY(nombre);

-- ¿Cuantos clientes han comprado el producto 6?

SELECT count(nombre) FROM clientes JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id JOIN facturas ON facturas.id=clientes_facturas.factura_id JOIN Facturas_productos ON facturas.id=Facturas_productos.factura_id WHERE producto_id=6;

-- FIN