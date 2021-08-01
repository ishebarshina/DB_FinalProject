USE ozon;

-- users
DROP PROCEDURE IF EXISTS insert_rand_users; 
DELIMITER $$
CREATE PROCEDURE insert_rand_users()
BEGIN
    DECLARE ii INT DEFAULT 1;
    DECLARE in_email VARCHAR(100);
	DECLARE in_phone VARCHAR(100);
    WHILE ii <= 100 DO
    	SET in_email = CONCAT(SUBSTRING(MD5(RAND()),1,7), '@', SUBSTRING(MD5(RAND()),1,5), '.', SUBSTRING(MD5(RAND()),1,2));
    	SET in_phone = CONCAT('+7', 9000000000 + FLOOR(RAND()*999999999));
		INSERT INTO users(email, phone) VALUES (in_email, in_phone);
        SET ii = ii + 1;
    END WHILE;
END $$
DELIMITER ;

CALL insert_rand_users();






