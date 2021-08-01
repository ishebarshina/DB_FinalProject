USE ozon;

DROP TRIGGER IF EXISTS trig_insert_discounts ;

DELIMITER $$
CREATE TRIGGER trig_insert_discounts BEFORE INSERT ON discounts
FOR EACH ROW 
BEGIN 
	IF (NEW.fk_user_id IS NULL AND NEW.fk_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000' -- unhandled user-defined exception
		SET MESSAGE_TEXT = 'both fields IS NULL -- insert discounts trigger';
	END IF ;
END $$

-- INSERT INTO products1 (name, description) VALUES (NULL, NULL ) ; $$
DELIMITER ;
-- 
DROP TRIGGER IF EXISTS trig_update_discounts;
DELIMITER $$
CREATE TRIGGER trig_update_discounts BEFORE UPDATE ON discounts
FOR EACH ROW 
BEGIN 
	IF (NEW.fk_user_id IS NULL AND NEW.fk_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000' -- unhandled user-defined exception
		SET MESSAGE_TEXT = 'both fields IS NULL -- update discounts trigger';
	END IF ;
END $$
DELIMITER ;