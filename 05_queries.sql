USE ozon;

-- Список рекомендаций на основании избранных товаров
-- Составляется следующим образом:
-- 10 самых популярных товаров из тех каталогов, товары из которых
-- добавил пользователь в избранное.
-- Уже добавленные товары не должны предлагаться
-- Если список избранного пуст 
-- Выберем самые популярные продукты 
-- в том городе, который пользователь указал у себя в профиле.
-- Если список избранного пуст 
-- и город в профиле не указан, то просто 10 самых поплуярных продуктов

-- SET GLOBAL log_bin_trust_function_creators = 1; 
-- SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- функция, которая возвращает 1, если список избранного не пустой, 0 - пустой
DROP FUNCTION IF EXISTS exist_favourite; 
DELIMITER $$
CREATE FUNCTION exist_favourite(in_user_id INT)
RETURNS INT NOT DETERMINISTIC
BEGIN
    DECLARE num INT;
	SELECT COUNT(1) FROM favourites f WHERE f.fk_fv_user_id = in_user_id INTO num;
    IF (num) 
		THEN RETURN 1;
   		ELSE RETURN 0;
   	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS fv_recommend_1; 
DELIMITER $$
CREATE PROCEDURE fv_recommend_1(in_user_id INT)
BEGIN
	WITH fv_user AS (
	SELECT * 
	FROM favourites 
	WHERE fk_fv_user_id = in_user_id
	)
	SELECT pc.pd_id, pc.pd_name, pc.pd_catalog_id, pc.rating, pc.popularity 
	FROM (
		SELECT 	*
		FROM popular_products pp
		WHERE pp.pd_catalog_id IN (
			SELECT c.id AS catalogs_id 
			FROM products pd 
				INNER JOIN fv_user
					ON fv_user.fk_fv_product_id = pd.id
				INNER JOIN catalogs c 
					ON c.id = pd.fk_pd_catalog_id
		)
	) AS pc LEFT JOIN fv_user 
		ON pc.pd_id = fv_user.fk_fv_product_id 
	WHERE fv_user.fk_fv_product_id IS NULL 
	ORDER BY  popularity DESC , pd_catalog_id ASC
	LIMIT 10;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS fv_recommend_0; 
DELIMITER $$
CREATE PROCEDURE fv_recommend_0(in_user_id INT)
BEGIN
	SET @in_user = in_user_id;
	SELECT pf.fk_pf_city_id AS city_id, 
		opd.fk_opd_product_id AS product_id, 
		SUM(opd.total) AS total_orders, 
		IFNULL(pd.rating, 0) AS rating,
		(IFNULL(rating, 0) * 0.8 + SUM(opd.total) * 0.2) AS popularity
	FROM (orders_products opd 
		LEFT JOIN orders o 
			ON opd.fk_opd_order_id = o.id 
		LEFT JOIN profiles pf 
			ON o.fk_o_user_id = pf.fk_pf_user_id 
		LEFT JOIN products pd 
			ON pd.id = opd.fk_opd_product_id) 
	WHERE pf.fk_pf_city_id IN (
		SELECT ci.id
		FROM profiles pf 
		INNER JOIN cities ci 
			ON ci.id = pf.fk_pf_city_id 
		WHERE pf.fk_pf_user_id = @in_user
	)
	GROUP BY product_id
	ORDER BY popularity DESC
	LIMIT 10;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS fv_recommend; 
DELIMITER $$
CREATE PROCEDURE fv_recommend(in_user_id INT)
BEGIN
	DECLARE flg_fv_exist INT DEFAULT 0;
	SET flg_fv_exist = exist_favourite(in_user_id);
	IF (flg_fv_exist) 
		THEN CALL fv_recommend_1(in_user_id);
		ELSE 
			BEGIN 
				IF (SELECT fk_pf_city_id 
					FROM profiles pf 
					WHERE pf.fk_pf_user_id = in_user_id) 
					THEN CALL fv_recommend_0(in_user_id);
					ELSE 
					BEGIN 
						SELECT * FROM popular_products LIMIT 10;
					END;
				END IF;
			END;
	END IF;	
END $$
DELIMITER ;

-- UPDATE profiles pf SET pf.fk_pf_city_id = NULL WHERE pf.fk_pf_user_id = 4;

CALL fv_recommend(60);
CALL fv_recommend(3);
CALL fv_recommend(4);













