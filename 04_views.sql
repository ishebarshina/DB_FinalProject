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
	SELECT 	pr.id AS 'pd_id', pr.name AS 'pd_name', pr.fk_pd_catalog_id AS 'pd_catalog_id', 
		pr.rating AS 'rating', 
		(IFNULL(pr.rating, 0) * 0.8 + epo.total_pd_orders  * 0.2) AS popularity
	FROM product_rating pr
		INNER JOIN each_product_order epo
		ON pr.id = epo.id
	ORDER BY popularity DESC, fk_pd_catalog_id ASC, pr.id ASC; 

SELECT * FROM popular_products pr;















