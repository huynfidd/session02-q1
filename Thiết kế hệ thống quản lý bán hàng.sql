
-- 1. Tạo Database

CREATE DATABASE SalesDB;

-- 2. Tạo Schema

CREATE SCHEMA sales;


-- 3. Bảng Customers

CREATE TABLE sales.Customers
(
    customer_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    phone       VARCHAR(20)
);


-- 4. Bảng Products

CREATE TABLE sales.Products
(
    product_id     SERIAL PRIMARY KEY,
    product_name   VARCHAR(100) NOT NULL,
    price          REAL         NOT NULL CHECK (price >= 0),
    stock_quantity INT          NOT NULL CHECK (stock_quantity >= 0)
);


-- 5. Bảng Orders

CREATE TABLE sales.Orders
(
    order_id    SERIAL PRIMARY KEY,
    customer_id INT,
    order_date  DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES sales.Customers (customer_id)
);


-- 6. Bảng OrderItems

CREATE TABLE sales.OrderItems
(
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT NOT NULL CHECK (quantity >= 1),
    FOREIGN KEY (order_id) REFERENCES sales.Orders (order_id),
    FOREIGN KEY (product_id) REFERENCES sales.Products (product_id)


);


-- 7. Xem danh sách database

SELECT datname
FROM pg_database;


-- 8. Xem danh sách schema

SELECT schema_name
FROM information_schema.schemata;


-- 9. Xem cấu trúc bảng Customers

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customers';


-- 10. Xem cấu trúc bảng Products

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';


-- 11. Xem cấu trúc bảng Orders

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orders';


-- 12. Xem cấu trúc bảng OrderItems

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orderitems';
