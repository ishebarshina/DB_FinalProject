DROP DATABASE IF EXISTS ozon;
CREATE DATABASE ozon;

USE ozon;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY  COMMENT "Идентификатор строки",    
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);

CREATE TABLE profiles;

CREATE TABLE companies;

CREATE TABLE ozon_cards;

CREATE TABLE catalogs;

CREATE TABLE subcatalogs;

CREATE TABLE products;

CREATE TABLE orders;

CREATE TABLE discounts;

CREATE TABLE reviews;

CREATE TABLE orders_users;

# как эффективно релизовать избранные товары?
CREATE TABLE favourites;

