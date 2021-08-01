USE ozon;

DROP TRIGGER IF EXISTS trig_insert_discounts ;

DELIMITER $$
CREATE TRIGGER trig_insert_discounts BEFORE INSERT ON discounts
FOR EACH ROW 
BEGIN 
	IF (NEW.fk_user_id IS NULL AND NEW.fk_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'both fields IS NULL -- insert discounts trigger';
	END IF ;
END $$


DELIMITER ;
-- 
DROP TRIGGER IF EXISTS trig_update_discounts;
DELIMITER $$
CREATE TRIGGER trig_update_discounts BEFORE UPDATE ON discounts
FOR EACH ROW 
BEGIN 
	IF (NEW.fk_user_id IS NULL AND NEW.fk_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'both fields IS NULL -- update discounts trigger';
	END IF ;
END $$
DELIMITER ;