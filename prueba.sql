-- Parte 1: Modelo logico en PDF's.


--Parte 2: Se debe crear el modelo en la base de datos, 
-- en una base de datos llamada prueba , e insertar los 
-- 5 clientes, 8 productos, 3 categorias,
-- 10 facturas: 2 para el cliente 1, con 2 y 3 productos
--              3 para el cliente 2, con 3, 2 y 3 productos
--              1 para el cliente 3, con 1 producto
--              4 para el cliente 4, con 2,3, 4 y 1 producto

CREATE DATABASE prueba;

\c prueba  -- You are now connected to database "prueba" as user "iperez".

-- creacion de tablas
CREATE TABLE clientes (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, rut VARCHAR(100) UNIQUE NOT NULL, direccion VARCHAR(100));
CREATE TABLE facturas (id SERIAL PRIMARY KEY, fecha_factura DATE NOT NULL, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL);
CREATE TABLE clientes_facturas (cliente_id INT NOT NULL, factura_id INT NOT NULL, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(id));
CREATE TABLE productos (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, descripcion VARCHAR(100) NOT NULL, valor_unitario FLOAT, categoria_id INT NOT NULL);
CREATE TABLE facturas_productos (factura_id INT, producto_id INT, FOREIGN KEY(factura_id) REFERENCES facturas(id), FOREIGN KEY(producto_id) REFERENCES productos(id), cantidad INT NOT NULL);
CREATE TABLE categoria (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL UNIQUE, descripcion VARCHAR(100) NOT NULL);

-- insertar 5 clientes


-- insertar 3 categorias


-- insertar 8 productos,

-- insertar 10 facturas






-- Parte 3: Consultas 


-- ¿Que cliente realizó la compra más cara?


-- ¿Que cliente pagó sobre 100 de monto?


-- ¿Cuantos clientes han comprado el producto 6.