USE ozon;

DROP TRIGGER IF EXISTS trig_insert_discounts ;
DELIMITER $$
CREATE TRIGGER trig_insert_discounts BEFORE INSERT ON discounts
FOR EACH ROW 
BEGIN 
	IF (NEW.fk_d_user_id IS NULL AND NEW.fk_d_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'both fields IS NULL -- insert discounts trigger';
	END IF ;
END $$

DROP TRIGGER IF EXISTS trig_update_discounts;
DELIMITER $$
CREATE TRIGGER trig_update_discounts BEFORE UPDATE ON discounts
FOR EACH ROW 
BEGIN 
	IF (NEW.fk_d_user_id IS NULL AND NEW.fk_d_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'both fields IS NULL -- update discounts trigger';
	END IF ;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS trig_insert_review ;
DELIMITER $$
CREATE TRIGGER trig_insert_review AFTER INSERT ON reviews
FOR EACH ROW 
BEGIN 
	DECLARE num_r_pd INT;
	DECLARE old_rating FLOAT;
	DECLARE new_rating FLOAT;
	-- amount of reviews on this product
	SELECT COUNT(1) FROM reviews WHERE fk_rw_poducts_id=NEW.fk_rw_poducts_id INTO num_r_pd;
	SELECT rating FROM products WHERE id = NEW.fk_rw_poducts_id INTO old_rating;
	IF (old_rating IS NULL)
	THEN SET old_rating = 0.0;
	END IF ;
	SET new_rating = (old_rating * (num_r_pd - 1) + NEW.stars) / num_r_pd;
	UPDATE products SET rating = new_rating WHERE id = NEW.fk_rw_poducts_id;
END $$
DELIMITER ;