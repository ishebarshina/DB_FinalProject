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
CREATE TRIGGER trig_insert_review 
	AFTER INSERT 
	ON reviews FOR EACH ROW 
BEGIN 
	DECLARE new_rating FLOAT;
	SELECT avg(r.stars) 
	FROM reviews r 
	WHERE r.fk_rw_poducts_id = NEW.fk_rw_poducts_id
	GROUP BY r.fk_rw_poducts_id INTO new_rating;
	UPDATE products SET rating = new_rating	WHERE id = NEW.fk_rw_poducts_id;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS trig_delete_review;
DELIMITER $$
CREATE TRIGGER trig_delete_review
    AFTER DELETE
    ON reviews FOR EACH ROW
BEGIN 
	DECLARE new_rating FLOAT;
	SELECT avg(r.stars) 
	FROM reviews r 
	WHERE r.fk_rw_poducts_id = OLD.fk_rw_poducts_id
	GROUP BY r.fk_rw_poducts_id INTO new_rating;
	UPDATE products SET rating = new_rating	WHERE id = OLD.fk_rw_poducts_id;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS trig_update_review;
DELIMITER $$
CREATE TRIGGER trig_update_review
    AFTER UPDATE
    ON reviews FOR EACH ROW
BEGIN 
	DECLARE new_rating FLOAT;
	SELECT avg(r.stars) 
	FROM reviews r 
	WHERE r.fk_rw_poducts_id = NEW.fk_rw_poducts_id
	GROUP BY r.fk_rw_poducts_id INTO new_rating;
	UPDATE products SET rating = new_rating	WHERE id = NEW.fk_rw_poducts_id;
END $$
DELIMITER ;