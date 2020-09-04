-- Parte 1: Modelo logico en PDF's.


--Parte 2: Se debe crear el modelo en la base de datos, 
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






-- Parte 3: Consultas 


-- ¿Que cliente realizó la compra más cara?


-- ¿Que cliente pagó sobre 100 de monto?


-- ¿Cuantos clientes han comprado el producto 6.