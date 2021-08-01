DROP DATABASE IF EXISTS ozon;
CREATE DATABASE ozon;

USE ozon;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
 	id SERIAL PRIMARY KEY,    
 	email VARCHAR(100) NOT NULL UNIQUE,
 	phone VARCHAR(100) NOT NULL UNIQUE,
 	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT phone CHECK (REGEXP_LIKE(phone, '^\+7([0-9]{10})$')),
	CONSTRAINT email CHECK (REGEXP_LIKE(email, '^[a-zA-Z0-9_\-]+\@([a-zA-Z0-9_\.])+([a-z])$'))
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	id SERIAL PRIMARY KEY,
	fk_pf_user_id BIGINT UNSIGNED NOT NULL,
	fk_pf_city_id INT UNSIGNED,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	gender ENUM('Male', 'Female'),
	birthday DATE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	INDEX ix_user_name (first_name, last_name),
	FOREIGN KEY (fk_pf_user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (fk_pf_city_id) REFERENCES cities (id) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ozon_cards;
CREATE TABLE ozon_cards(
	id SERIAL PRIMARY KEY,
	fk_oc_user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	card_number VARCHAR(16) NOT NULL UNIQUE,
	CVV VARCHAR(3) NOT NULL,
	balance DECIMAL(12, 2) NOT NULL DEFAULT 0.00, 
	points DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
	CONSTRAINT ozon_card_number CHECK (REGEXP_LIKE(card_number, '^[0-9]{16}$')),
	CONSTRAINT ozon_CVV CHECK (REGEXP_LIKE(CVV, '^[0-9]{3}$')),
	FOREIGN KEY (fk_oc_user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- пока не уверена, нужно ли это
DROP TABLE IF EXISTS payment_cards;
CREATE TABLE payment_cards(
	id SERIAL PRIMARY KEY,
	card_number VARCHAR(16) NOT NULL,
	CVV VARCHAR(3) NOT NULL,
	balance DECIMAL(12, 2) NOT NULL DEFAULT 0.00, 
	CONSTRAINT card_number CHECK (REGEXP_LIKE(card_number, '^[0-9]{16}$')),
	CONSTRAINT CVV CHECK (REGEXP_LIKE(CVV, '^[0-9]{3}$'))
);

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255)
);

DROP TABLE IF EXISTS shops;
CREATE TABLE shops(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	fk_pd_catalog_id INT UNSIGNED NOT NULL,
	fk_pd_shop_id INT UNSIGNED NOT NULL,
	price DECIMAL (11,2) NOT NULL,  
	desription TEXT,
	rating FLOAT,
	FOREIGN KEY (fk_pd_catalog_id) REFERENCES catalogs (id) ON DELETE CASCADE ON UPDATE CASCADE, 
	FOREIGN KEY (fk_pd_shop_id) REFERENCES shops (id) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE ix_pd_shop (name, fk_pd_shop_id)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	fk_o_user_id BIGINT UNSIGNED NOT NULL,
	payment_type ENUM('ozon_card', 'other_card'),
	delivery_address TEXT NOT NULL,
	CONSTRAINT FOREIGN KEY (fk_o_user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
	id SERIAL PRIMARY KEY,
	fk_opd_order_id BIGINT UNSIGNED NOT NULL,
	fk_opd_product_id INT UNSIGNED NOT NULL,
	total INT UNSIGNED DEFAULT 1,
	FOREIGN KEY (fk_opd_order_id) REFERENCES orders (id),
	FOREIGN KEY (fk_opd_product_id) REFERENCES products (id)
);

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	fk_d_user_id BIGINT UNSIGNED,
	fk_d_product_id INT UNSIGNED,
	discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
	only_ozon_card ENUM('0', '1'),
	CONSTRAINT discout CHECK (discount >= 0 AND discount < 1),
	FOREIGN KEY (fk_d_user_id) REFERENCES users (id),
	FOREIGN KEY (fk_d_product_id) REFERENCES products (id)
);

DROP TABLE IF EXISTS cashback_ozon_card;
CREATE TABLE cashback_ozon_card (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	fk_cb_catalog_id INT UNSIGNED NOT NULL,
	cashback FLOAT UNSIGNED COMMENT 'Величина кешбэка от 0.0 до 1.0',
	FOREIGN KEY (fk_cb_catalog_id) REFERENCES catalogs (id)
);

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews(
	id SERIAL PRIMARY KEY,
	fk_rw_poducts_id INT UNSIGNED NOT NULL,
	fk_rw_user_id BIGINT UNSIGNED NOT NULL,
	stars TINYINT NOT NULL,
	content TEXT,
	FOREIGN KEY (fk_rw_poducts_id) REFERENCES products (id),
	FOREIGN KEY (fk_rw_user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS favourites;
CREATE TABLE favourites(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL
);


