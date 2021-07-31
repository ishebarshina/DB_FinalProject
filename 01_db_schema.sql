DROP DATABASE IF EXISTS ozon;
CREATE DATABASE ozon;

USE ozon;

-- serial = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
DROP TABLE IF EXISTS users;
CREATE TABLE users (
 	id SERIAL PRIMARY KEY,    
 	email VARCHAR(100) NOT NULL UNIQUE,
 	phone VARCHAR(100) NOT NULL UNIQUE,
 	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT phone CHECK (REGEXP_LIKE(phone, '^\\+7[0-9]{10}$')),
	CONSTRAINT email CHECK (REGEXP_LIKE(email, '^[a-zA-Z0-9_\-]+\@([a-zA-Z0-9_\.])+([a-z])$'))
);

DESC users;

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	gender CHAR(1) NOT NULL,
	birthday DATE NOT NULL,
	city VARCHAR(130),
	country VARCHAR(130),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS ozon_cards;
CREATE TABLE ozon_cards(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	card_number VARCHAR(16),
	CVV VARCHAR(3),
	CONSTRAINT card_number CHECK (REGEXP_LIKE('^[0-9]{16}$')),
	CONSTRAINT card_number CHECK (REGEXP_LIKE('^[0-9]{3}$'))
);

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs;

DROP TABLE IF EXISTS subcatalogs;
CREATE TABLE subcatalogs;

DROP TABLE IF EXISTS products;
CREATE TABLE products;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders;

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts;

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews;

DROP TABLE IF EXISTS orders_users;
CREATE TABLE orders_users;

-- для каждого пользователя буде хранить адреса, на которые он когда-либо заказывал доставку
-- засполняться будет триггерами
DROP TABLE IF EXISTS delivery_address;
CREATE TABLE delivery_address;

# как эффективно релизовать избранные товары?
DROP TABLE IF EXISTS favourites;
CREATE TABLE favourites;

