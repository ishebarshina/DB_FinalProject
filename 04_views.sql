USE ozon;

-- id товара | сколько товаров заказали
CREATE OR REPLACE VIEW each_product_order AS
	SELECT pd.id, IFNULL(tpo.total_pd_orders, 0) AS total_pd_orders
	FROM products pd LEFT JOIN (
		SELECT op.fk_opd_product_id AS pd_id, SUM(op.total) AS total_pd_orders 
		FROM orders_products op 
		GROUP BY op.fk_opd_product_id) AS tpo
	ON 	pd.id = tpo.pd_id
	ORDER BY total_pd_orders DESC, pd.id ASC;

SELECT * FROM each_product_order;

-- товары самыми высокими оценками
CREATE OR REPLACE VIEW product_rating AS
	SELECT * 
	FROM products pd 
	ORDER BY pd.rating DESC, pd.id ASC;

SELECT * FROM product_rating pr;

-- popularity = 0.8 * rating  + 0.2 * total_pd_orders
-- рейтинг самых популярных товаров
CREATE OR REPLACE VIEW popular_products AS
	SELECT 	pr.id AS 'pd_id', 
			pr.name AS 'pd_name', 
			pr.fk_pd_catalog_id AS 'pd_catalog_id', 
			c.name AS 'catalog_name',
			pr.rating AS 'rating', 
		(IFNULL(pr.rating, 0) * 0.8 + epo.total_pd_orders  * 0.2) AS popularity
	FROM product_rating pr
		INNER JOIN each_product_order epo
			ON pr.id = epo.id
		INNER JOIN catalogs c 
			ON c.id = pr.fk_pd_catalog_id
	ORDER BY popularity DESC, fk_pd_catalog_id ASC, pr.id ASC; 

SELECT catalog_name FROM popular_products pr;

--  каком магазине этот товар продается по самой низкой цене, цена с учетом скидки
CREATE OR REPLACE VIEW prod_shop_price AS
	SELECT 	pd.id AS 'pd_id', 
			pd.name AS 'pd_name',
			sh.id AS 'sh_id',
			sh.name 'sh_name', 
			ps.total AS 'amount',
			(FIRST_VALUE (ps.price * (1 - IFNULL(CAST(d.only_ozon_card AS UNSIGNED) -1, 0) * IFNULL(d.discount, 0))) 
				OVER (PARTITION BY ps.fk_product_id 
				ORDER BY ps.price ASC)) 
				AS 'price, any paynment',
			(FIRST_VALUE (ps.price * (1 - IFNULL(d.discount, 0))) 
				OVER (PARTITION BY ps.fk_product_id 
				ORDER BY ps.price ASC)) 
				AS 'price, ozon_card'
	FROM produtcs_shops ps 
		INNER JOIN shops sh 
			ON sh.id = ps.fk_shop_id 
		INNER JOIN products pd 
			ON pd.id = ps.fk_product_id 
		LEFT JOIN discounts d
			ON d.fk_d_product_id = pd.id;

SELECT * FROM prod_shop_price;






