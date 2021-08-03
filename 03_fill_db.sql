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

-- cities
INSERT INTO cities (name) VALUES ('Moscow'),
('Saint Petersburg'),
('Novosibirsk'),
('Yekaterinburg'),
('Nizhniy Novgorod'),
('Kazan'),
('Chelyabinsk'),
('Omsk'),
('Samara'),
('Rostov'),
('Ufa'),
('Krasnoyarsk'),
('Perm'),
('Voronezh'),
('Volgograd');

-- profiles
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('1', 'Douglas', 'Bartell', 'Male', '1981-02-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('2', 'Roman', 'Vandervort', 'Male', '1988-12-09');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('3', 'Mckayla', 'Cremin', 'Male', '1983-07-18');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('4', 'Ethan', 'Lebsack', 'Male', '1987-07-09');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('5', 'Giovanny', 'West', 'Male', '2011-06-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('6', 'Billy', 'Mann', 'Male', '1970-09-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('7', 'Lavern', 'Considine', 'Male', '2011-01-17');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('8', 'Branson', 'Thompson', 'Male', '2009-08-11');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('9', 'Casey', 'Osinski', 'Male', '1976-01-16');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('10', 'Jerry', 'Labadie', 'Male', '2006-01-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('11', 'Jaleel', 'Murphy', 'Female', '1976-07-04');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('12', 'Maeve', 'Runolfsdottir', 'Male', '1975-10-13');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('13', 'Brenda', 'Dicki', 'Female', '1985-03-14');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('14', 'Jewell', 'Hoppe', 'Male', '1976-08-04');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('15', 'Wilton', 'Medhurst', 'Female', '1970-12-21');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('16', 'Kenyatta', 'Gleichner', 'Female', '1977-08-02');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('17', 'Douglas', 'Kessler', 'Female', '2018-12-31');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('18', 'Donavon', 'Rutherford', 'Male', '2000-10-14');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('19', 'Coy', 'Turcotte', 'Male', '2012-01-20');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('20', 'Eleazar', 'Rempel', 'Female', '2020-05-13');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('21', 'Frederick', 'Wisoky', 'Male', '1986-11-08');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('22', 'Kennith', 'Jenkins', 'Male', '1989-03-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('23', 'Benjamin', 'McCullough', 'Male', '2001-10-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('24', 'Vincenza', 'Bosco', 'Male', '1975-02-24');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('25', 'Nya', 'Kuvalis', 'Female', '1974-11-26');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('26', 'Idella', 'Von', 'Female', '2014-10-17');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('27', 'Rodger', 'Leannon', 'Female', '1997-10-22');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('28', 'Vivienne', 'Stanton', 'Female', '1991-07-20');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('29', 'Marilou', 'Balistreri', 'Male', '2008-04-29');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('30', 'Verna', 'McGlynn', 'Female', '1991-09-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('31', 'Deion', 'Torphy', 'Male', '1982-07-04');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('32', 'Louisa', 'Stiedemann', 'Male', '2018-11-18');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('33', 'Dan', 'Krajcik', 'Male', '1972-12-01');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('34', 'Margarette', 'Brakus', 'Male', '2009-11-20');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('35', 'Beverly', 'Cartwright', 'Female', '1996-09-09');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('36', 'Ardella', 'Lowe', 'Female', '1994-05-05');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('37', 'Royce', 'Fisher', 'Male', '1974-11-02');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('38', 'Pearlie', 'Homenick', 'Female', '1974-03-17');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('39', 'Tremayne', 'Grant', 'Male', '2006-01-13');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('40', 'Diamond', 'Breitenberg', 'Female', '2014-05-25');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('41', 'Milo', 'Okuneva', 'Male', '2018-01-11');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('42', 'Johanna', 'Metz', 'Male', '1977-04-07');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('43', 'Clovis', 'Schimmel', 'Female', '2010-11-27');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('44', 'Alycia', 'Stroman', 'Female', '2020-04-02');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('45', 'Mattie', 'Connelly', 'Female', '1993-03-25');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('46', 'Telly', 'Altenwerth', 'Male', '1995-09-29');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('47', 'Chasity', 'Kilback', 'Female', '1999-01-12');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('48', 'Josiane', 'Kutch', 'Female', '2005-12-13');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('49', 'Maryam', 'Murazik', 'Male', '1999-12-18');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('50', 'Lexus', 'Ryan', 'Male', '2012-03-07');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('51', 'Mabelle', 'Daugherty', 'Male', '1981-06-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('52', 'Robbie', 'McClure', 'Female', '1987-04-03');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('53', 'Jefferey', 'Schimmel', 'Female', '2019-01-14');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('54', 'Robb', 'Stokes', 'Male', '2013-02-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('55', 'Adolphus', 'Hermann', 'Female', '2019-10-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('56', 'Jamel', 'Legros', 'Female', '1998-03-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('57', 'Rosendo', 'Emmerich', 'Female', '2002-12-13');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('58', 'Cierra', 'Dare', 'Female', '2011-03-15');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('59', 'Van', 'Swaniawski', 'Male', '1976-08-14');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('60', 'Flavio', 'Stracke', 'Female', '2016-06-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('61', 'Muhammad', 'Wolf', 'Female', '1995-07-01');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('62', 'Timmothy', 'Nikolaus', 'Male', '1971-03-10');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('63', 'Liliana', 'Heathcote', 'Male', '2001-09-26');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('64', 'Jevon', 'McCullough', 'Male', '2011-12-23');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('65', 'German', 'Fadel', 'Female', '1994-09-10');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('66', 'Malvina', 'Schimmel', 'Female', '1992-10-11');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('67', 'Santina', 'Reynolds', 'Male', '2009-10-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('68', 'Loren', 'Kuvalis', 'Female', '1997-12-25');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('69', 'Isai', 'Little', 'Male', '1979-02-24');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('70', 'Euna', 'Ferry', 'Female', '1971-10-27');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('71', 'Yasmine', 'Ryan', 'Female', '2008-11-29');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('72', 'Fatima', 'Sauer', 'Male', '2021-01-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('73', 'Melvin', 'Torp', 'Male', '2005-01-16');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('74', 'Pedro', 'Connelly', 'Male', '2000-01-31');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('75', 'Meghan', 'Towne', 'Female', '2017-09-26');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('76', 'Ransom', 'Sawayn', 'Female', '1997-01-03');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('77', 'Tina', 'Crist', 'Female', '2015-03-07');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('78', 'Daniela', 'Heaney', 'Male', '1992-01-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('79', 'Telly', 'Blanda', 'Male', '1994-12-11');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('80', 'Leanne', 'Reilly', 'Female', '1977-06-10');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('81', 'Adrain', 'Wisoky', 'Male', '2004-09-10');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('82', 'Ilene', 'Collins', 'Female', '2010-01-14');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('83', 'Emily', 'Herman', 'Female', '2003-08-24');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('84', 'Paolo', 'Johnson', 'Male', '2011-08-02');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('85', 'Reva', 'Dibbert', 'Female', '2021-02-11');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('86', 'Sarai', 'Dach', 'Female', '1971-04-21');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('87', 'Celia', 'Considine', 'Female', '1995-10-29');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('88', 'Adrian', 'Cartwright', 'Male', '1973-06-19');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('89', 'Macie', 'Dooley', 'Male', '1987-10-12');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('90', 'Meta', 'Kiehn', 'Female', '1976-03-13');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('91', 'Elian', 'Bergstrom', 'Male', '2000-05-16');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('92', 'Viola', 'Kilback', 'Male', '2021-03-14');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('93', 'Adrain', 'Terry', 'Female', '1979-06-08');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('94', 'Jamel', 'Legros', 'Male', '2018-06-03');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('95', 'Emilie', 'Moen', 'Male', '1981-11-06');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('96', 'Helmer', 'Heathcote', 'Male', '1979-09-11');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('97', 'Alysha', 'D\'Amore', 'Male', '1975-03-14');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('98', 'Shawn', 'Kozey', 'Male', '1994-11-18');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('99', 'Armando', 'Feeney', 'Male', '1971-06-05');
INSERT INTO `profiles` (`fk_pf_user_id`, `first_name`, `last_name`, `gender`, `birthday`) VALUES ('100', 'Stefan', 'Baumbach', 'Female', '2014-11-23');

UPDATE profiles SET fk_pf_city_id = (1 + FLOOR(RAND()*14));

-- ozon_cards

DROP PROCEDURE IF EXISTS insert_ozon_cards; 
DELIMITER $$
CREATE PROCEDURE insert_ozon_cards()
BEGIN
    DECLARE ii INT DEFAULT 5;
    DECLARE in_user_id  INT;
	DECLARE in_card_number VARCHAR(16);
	DECLARE in_balance DECIMAL(12, 2);
	DECLARE in_points DECIMAL(12, 2);
	DECLARE in_CVV VARCHAR(3);
    WHILE ii <= 75 DO
    	SET in_user_id = ii;
    	SET in_card_number = CONCAT(CONVERT((1000 + FLOOR(RAND()*8999)), char), 
    								CONVERT((1000 + FLOOR(RAND()*8999)), char),
    								CONVERT((1000 + FLOOR(RAND()*8999)), char),
    								CONVERT((1000 + FLOOR(RAND()*8999)), char));
    	SET in_CVV = CONCAT(100 + FLOOR(RAND()*899));
    	SET in_balance = RAND() * 2000;
    	SET in_points = RAND() * 500; 
		INSERT INTO ozon_cards(fk_oc_user_id, card_number, CVV, balance, points) 
			VALUES (in_user_id, in_card_number, in_CVV, in_balance, in_points);
        SET ii = ii + 1;
    END WHILE;
END $$
DELIMITER ;

CALL insert_ozon_cards();

-- payment_cards

DROP PROCEDURE IF EXISTS insert_payment_cards; 
DELIMITER $$
CREATE PROCEDURE insert_payment_cards()
BEGIN
    DECLARE ii INT DEFAULT 1;
	DECLARE in_card_number VARCHAR(16);
	DECLARE in_balance DECIMAL(12, 2);
	DECLARE in_CVV VARCHAR(3);
    WHILE ii <= 100 DO
    	SET in_card_number = CONCAT(CONVERT((7000 + FLOOR(RAND()*999)), char), 
    								CONVERT((7000 + FLOOR(RAND()*999)), char),
    								CONVERT((7000 + FLOOR(RAND()*999)), char),
    								CONVERT((7000 + FLOOR(RAND()*999)), char));
    	SET in_CVV = CONCAT(100 + FLOOR(RAND()*899));
    	SET in_balance = RAND() * 2000;
		INSERT INTO payment_cards(card_number, CVV, balance) 
			VALUES (in_card_number, in_CVV, in_balance);
        SET ii = ii + 1;
    END WHILE;
END $$
DELIMITER ;

CALL insert_payment_cards();

-- catalogs
INSERT INTO `catalogs` (`id`, `name`) VALUES (1, 'blanditiis');
INSERT INTO `catalogs` (`id`, `name`) VALUES (2, 'voluptas');
INSERT INTO `catalogs` (`id`, `name`) VALUES (3, 'officiis');
INSERT INTO `catalogs` (`id`, `name`) VALUES (4, 'maxime');
INSERT INTO `catalogs` (`id`, `name`) VALUES (5, 'autem');
INSERT INTO `catalogs` (`id`, `name`) VALUES (6, 'minus');
INSERT INTO `catalogs` (`id`, `name`) VALUES (7, 'beatae');
INSERT INTO `catalogs` (`id`, `name`) VALUES (8, 'inventore');
INSERT INTO `catalogs` (`id`, `name`) VALUES (9, 'tenetur');
INSERT INTO `catalogs` (`id`, `name`) VALUES (10, 'magnam');
INSERT INTO `catalogs` (`id`, `name`) VALUES (11, 'sint');
INSERT INTO `catalogs` (`id`, `name`) VALUES (12, 'explicabo');
INSERT INTO `catalogs` (`id`, `name`) VALUES (13, 'occaecati');
INSERT INTO `catalogs` (`id`, `name`) VALUES (14, 'ratione');
INSERT INTO `catalogs` (`id`, `name`) VALUES (15, 'voluptatem');

-- shops
INSERT INTO `shops` (`id`, `name`) VALUES (1, 'officiis');
INSERT INTO `shops` (`id`, `name`) VALUES (2, 'corrupti');
INSERT INTO `shops` (`id`, `name`) VALUES (3, 'minima');
INSERT INTO `shops` (`id`, `name`) VALUES (4, 'molestiae');
INSERT INTO `shops` (`id`, `name`) VALUES (5, 'molestiae');
INSERT INTO `shops` (`id`, `name`) VALUES (6, 'voluptate');
INSERT INTO `shops` (`id`, `name`) VALUES (7, 'quo');
INSERT INTO `shops` (`id`, `name`) VALUES (8, 'placeat');
INSERT INTO `shops` (`id`, `name`) VALUES (9, 'velit');
INSERT INTO `shops` (`id`, `name`) VALUES (10, 'saepe');
INSERT INTO `shops` (`id`, `name`) VALUES (11, 'iste');
INSERT INTO `shops` (`id`, `name`) VALUES (12, 'molestiae');
INSERT INTO `shops` (`id`, `name`) VALUES (13, 'et');
INSERT INTO `shops` (`id`, `name`) VALUES (14, 'quia');
INSERT INTO `shops` (`id`, `name`) VALUES (15, 'unde');
INSERT INTO `shops` (`id`, `name`) VALUES (16, 'debitis');
INSERT INTO `shops` (`id`, `name`) VALUES (17, 'quidem');
INSERT INTO `shops` (`id`, `name`) VALUES (18, 'itaque');
INSERT INTO `shops` (`id`, `name`) VALUES (19, 'nostrum');
INSERT INTO `shops` (`id`, `name`) VALUES (20, 'voluptatibus');

-- products

INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (1, 'voluptas', 1, 'Commodi voluptatum placeat repellendus.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (2, 'ut', 2, 'Sed consectetur exercitationem aut debitis sunt ut ut et.', '342405');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (3, 'explicabo', 3, 'Asperiores corporis quis ut qui odio est quia voluptas.', '7');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (4, 'odio', 4, 'Id tempore occaecati provident sint ut voluptatem.', '33465');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (5, 'vero', 5, 'Quibusdam at eveniet neque.', '373');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (6, 'est', 6, 'Minus dolores voluptatem nam ipsam quasi.', '658');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (7, 'in', 7, 'Delectus consequuntur a dicta qui molestias velit modi.', '87951000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (8, 'est', 8, 'Adipisci debitis eaque dolore fugit ipsam sint et.', '28226');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (9, 'nulla', 9, 'Illo laboriosam ut assumenda molestiae possimus dignissimos.', '5956');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (10, 'enim', 10, 'Itaque sed vero quo eveniet eos laudantium consequatur molestiae.', '12136');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (11, 'consequatur', 11, 'Occaecati natus et labore explicabo quam fugiat rerum aperiam.', '18351');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (12, 'a', 12, 'Harum consequatur delectus dolores qui sunt deleniti.', '353184000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (13, 'rerum', 13, 'Nesciunt aliquam ut ab.', '1599');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (14, 'minus', 14, 'Ad ab veniam quia consequatur sint voluptatem aut rem.', '71458');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (15, 'et', 15, 'Quas facilis fuga doloremque maxime rerum voluptatum voluptatibus.', '959810000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (16, 'enim', 1, 'Cum aut eum hic odit.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (17, 'officia', 2, 'Illum molestiae sunt non quos sed.', '3');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (18, 'qui', 3, 'Vitae dolores omnis aut vero repellendus sint tempore quia.', '4496');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (19, 'voluptatum', 4, 'Assumenda non illum soluta est.', '47725000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (20, 'sit', 5, 'Ducimus beatae quis aut rerum voluptatem non asperiores doloremque.', '664172000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (21, 'corporis', 6, 'Minima nulla nemo necessitatibus ut est eaque.', '8');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (22, 'enim', 7, 'Voluptatem id omnis aliquam ullam dolor sint.', '61623200');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (23, 'dolor', 8, 'Alias ducimus iste earum excepturi.', '3340880');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (24, 'dolor', 9, 'Eligendi rerum ut neque eum in atque pariatur.', '3016690');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (25, 'neque', 10, 'Vitae aut qui aliquam sint quae veritatis recusandae.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (26, 'delectus', 11, 'Optio fuga est fugiat optio repellendus et nemo.', '82');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (27, 'rem', 12, 'Tempore tenetur ut libero explicabo sed suscipit.', '557717');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (28, 'et', 13, 'Ut porro reiciendis dolorem voluptas ut iure.', '369506');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (29, 'eligendi', 14, 'Inventore a rerum dolore facilis aut impedit placeat.', '54');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (30, 'consequuntur', 15, 'Nihil itaque aspernatur in facilis.', '51360600');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (31, 'id', 1, 'Eligendi magnam architecto maxime.', '780');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (32, 'aperiam', 2, 'Veritatis sed voluptas a.', '30');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (33, 'odio', 3, 'In repellat nobis doloribus rem deserunt et.', '92');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (34, 'facere', 4, 'Officia unde quae explicabo.', '9911');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (35, 'aut', 5, 'Dolorum vitae ut voluptatem nihil nobis rerum dolor.', '587');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (36, 'omnis', 6, 'Ex saepe consequatur distinctio libero.', '3320');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (37, 'quia', 7, 'Labore qui quis quisquam voluptatem modi expedita omnis.', '308');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (38, 'aut', 8, 'Voluptates a odit cum inventore eos explicabo.', '54757');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (39, 'ab', 9, 'Eos facilis ut dignissimos laboriosam consequatur.', '769');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (40, 'ut', 10, 'Qui id omnis ex.', '9');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (41, 'voluptatem', 11, 'Nulla maxime error laudantium explicabo dignissimos delectus.', '7966750');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (42, 'delectus', 12, 'Eos et ipsam nulla id.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (43, 'architecto', 13, 'Nostrum animi non enim incidunt.', '6336');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (44, 'voluptas', 14, 'Ratione occaecati placeat error et consequatur.', '8848');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (45, 'corrupti', 15, 'Consequatur commodi distinctio repudiandae nulla vero non.', '6');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (46, 'mollitia', 1, 'Voluptatem deserunt in distinctio et unde voluptatem.', '85');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (47, 'esse', 2, 'Repellendus omnis excepturi qui ut cupiditate sint.', '4418400');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (48, 'necessitatibus', 3, 'Et enim voluptatem explicabo dolorem fuga.', '4946');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (49, 'dolor', 4, 'Dolore harum sit inventore ab ipsa dicta.', '790');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (50, 'voluptatem', 5, 'Aut magni architecto voluptatem quia.', '44740');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (51, 'cupiditate', 6, 'Qui quis voluptatem suscipit natus qui cumque.', '30');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (52, 'sed', 7, 'Dolores sint voluptatem aut voluptatem at eos.', '8');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (53, 'atque', 8, 'Placeat id ullam et.', '54');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (54, 'corporis', 9, 'Velit id cupiditate aspernatur eius.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (55, 'occaecati', 10, 'Illo sed aspernatur occaecati optio laudantium.', '67');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (56, 'quibusdam', 11, 'Est et tempore eligendi occaecati voluptate est.', '33');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (57, 'ipsum', 12, 'Necessitatibus ducimus quia a accusamus.', '6889490');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (58, 'minus', 13, 'Eos id necessitatibus sit amet maiores.', '6856900');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (59, 'natus', 14, 'Quia amet voluptatem illo quod.', '2347');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (60, 'quaerat', 15, 'Maiores eligendi assumenda id sed architecto voluptatibus.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (61, 'nihil', 1, 'Minus ut est quas molestiae qui commodi ut.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (62, 'dolor', 2, 'Sed ea aut in quos et excepturi.', '7276');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (63, 'accusamus', 3, 'Aperiam temporibus nisi et sit laboriosam.', '31030900');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (64, 'magni', 4, 'Non commodi necessitatibus magnam qui temporibus aut voluptas.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (65, 'dolor', 5, 'Repellat tempora omnis voluptates aut quis magnam.', '16169200');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (66, 'voluptatem', 6, 'Pariatur eligendi adipisci vitae delectus.', '6024');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (67, 'ad', 7, 'Necessitatibus ut quas est hic qui et vitae.', '84');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (68, 'aperiam', 8, 'Nobis vero sapiente et cumque.', '5723000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (69, 'nesciunt', 9, 'Laudantium fugit iure perferendis inventore sed quaerat id nulla.', '99043');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (70, 'nulla', 10, 'Ut consequuntur recusandae dolorem temporibus.', '23994900');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (71, 'qui', 11, 'Autem consequatur magnam quia soluta placeat quis.', '24');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (72, 'dignissimos', 12, 'Aspernatur distinctio pariatur non accusantium.', '361162000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (73, 'id', 13, 'Nemo fugit quia incidunt.', '355');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (74, 'ea', 14, 'Qui quis aut labore deserunt.', '108');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (75, 'at', 15, 'Praesentium autem dolor ex aliquam dignissimos et.', '133');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (76, 'nulla', 1, 'Voluptas molestiae illo cumque commodi omnis.', '7204');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (77, 'quaerat', 2, 'Accusamus aut esse voluptatibus quaerat illo blanditiis error.', '6');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (78, 'amet', 3, 'Odio ipsum ut qui eveniet debitis delectus.', '27314600');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (79, 'nulla', 4, 'Consequatur ex cumque maiores dolore.', '7181');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (80, 'dignissimos', 5, 'Ea eveniet eligendi quas a reprehenderit consequatur voluptatem.', '23');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (81, 'libero', 6, 'Commodi suscipit reprehenderit optio aut praesentium rerum.', '12432');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (82, 'voluptatem', 7, 'Minima enim sed animi et et maxime sequi.', '58041400');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (83, 'id', 8, 'Corrupti voluptas quasi sit laudantium corrupti.', '732325000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (84, 'veniam', 9, 'Dolor aut quasi temporibus est in delectus.', '3');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (85, 'voluptatem', 10, 'Alias esse distinctio animi.', '17491');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (86, 'est', 11, 'Ratione dolore esse quis porro sunt sunt praesentium fugit.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (87, 'qui', 12, 'Illo provident aut reiciendis labore sed.', '6');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (88, 'et', 13, 'Nihil molestias mollitia rerum ut laudantium ex.', '81');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (89, 'pariatur', 14, 'Corrupti quis aut voluptas nulla qui impedit.', '257192');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (90, 'sint', 15, 'Quos eum rerum ea ut temporibus quo.', '7');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (91, 'velit', 1, 'Maiores officiis sed nostrum occaecati qui.', '3230');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (92, 'et', 2, 'Corrupti fuga eius quam rerum adipisci et eos.', '489810000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (93, 'eos', 3, 'Saepe perferendis placeat ratione impedit eos.', '501966000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (94, 'in', 4, 'Eaque accusamus dolor nam accusantium.', '0');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (95, 'ipsa', 5, 'Sit ipsum incidunt expedita consequuntur officiis et quo.', '6');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (96, 'quo', 6, 'Sit voluptates maiores id accusamus officia doloremque nemo aut.', '716444000');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (97, 'eius', 7, 'Et non eum occaecati voluptatum.', '76');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (98, 'blanditiis', 8, 'Vel provident similique at aliquam.', '5');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (99, 'quia', 9, 'Nostrum placeat rerum et fuga.', '7195220');
INSERT INTO `products` (`id`, `name`, `fk_pd_catalog_id`, `desription`, `rating`) VALUES (100, 'aut', 10, 'Optio aut voluptatem dolorem omnis et.', '89816');

UPDATE products SET rating = NULL ;

-- produtcs_shops

INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('1', 1, 1, '561526.00', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('2', 2, 2, '79123312.96', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('3', 3, 3, '537048.00', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('4', 4, 4, '15.91', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('5', 5, 5, '18407058.25', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('6', 6, 6, '321324.57', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('7', 7, 7, '167360017.45', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('8', 8, 8, '135.14', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('9', 9, 9, '1248760.92', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('10', 10, 10, '5.32', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('11', 11, 11, '145158.39', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('12', 12, 12, '15705121.75', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('13', 13, 13, '266983833.81', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('14', 14, 14, '117426.79', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('15', 15, 15, '9203.28', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('16', 16, 16, '926.14', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('17', 17, 17, '785552.03', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('18', 18, 18, '273.13', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('19', 19, 19, '129298697.52', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('20', 20, 20, '337.00', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('21', 21, 1, '0.00', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('22', 22, 2, '782.73', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('23', 23, 3, '0.00', 8);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('24', 24, 4, '6117.92', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('25', 25, 5, '288721682.71', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('26', 26, 6, '15422014.38', 8);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('27', 27, 7, '0.00', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('28', 28, 8, '2036.88', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('29', 29, 9, '226322.86', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('30', 30, 10, '137994.34', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('31', 31, 11, '13121.89', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('32', 32, 12, '1.50', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('33', 33, 13, '4517.63', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('34', 34, 14, '6.78', 8);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('35', 35, 15, '3.06', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('36', 36, 16, '23.52', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('37', 37, 17, '36256506.94', 8);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('38', 38, 18, '0.00', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('39', 39, 19, '19293432.18', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('40', 40, 20, '497.49', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('41', 41, 1, '19176.70', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('42', 42, 2, '2177776.00', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('43', 43, 3, '2.97', 8);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('44', 44, 4, '6.97', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('45', 45, 5, '1072082.41', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('46', 46, 6, '0.83', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('47', 47, 7, '22.59', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('48', 48, 8, '0.00', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('49', 49, 9, '9.00', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('50', 50, 10, '11310072.20', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('51', 51, 11, '11768057.39', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('52', 52, 12, '25.05', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('53', 53, 13, '0.00', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('54', 54, 14, '206553737.62', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('55', 55, 15, '652217.17', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('56', 56, 16, '36549403.28', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('57', 57, 17, '489751121.04', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('58', 58, 18, '60.34', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('59', 59, 19, '260042978.56', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('60', 60, 20, '0.90', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('61', 61, 1, '161.61', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('62', 62, 2, '2239.29', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('63', 63, 3, '48481.13', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('64', 64, 4, '805.51', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('65', 65, 5, '361816.91', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('66', 66, 6, '2185.97', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('67', 67, 7, '47246.35', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('68', 68, 8, '240326812.00', 8);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('69', 69, 9, '62.83', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('70', 70, 10, '0.00', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('71', 71, 11, '14912.88', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('72', 72, 12, '1224.00', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('73', 73, 13, '0.00', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('74', 74, 14, '0.45', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('75', 75, 15, '649.09', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('76', 76, 16, '509.34', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('77', 77, 17, '572.14', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('78', 78, 18, '54.28', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('79', 79, 19, '374086.81', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('80', 80, 20, '218.91', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('81', 81, 1, '2.72', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('82', 82, 2, '46.32', 1);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('83', 83, 3, '65049.03', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('84', 84, 4, '1720350.56', 0);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('85', 85, 5, '6506307.97', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('86', 86, 6, '17685.95', 5);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('87', 87, 7, '0.00', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('88', 88, 8, '2781829.67', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('89', 89, 9, '59.74', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('90', 90, 10, '4766.81', 6);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('91', 91, 11, '7645.00', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('92', 92, 12, '422.17', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('93', 93, 13, '1.88', 7);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('94', 94, 14, '0.00', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('95', 95, 15, '3550.00', 2);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('96', 96, 16, '1319.45', 9);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('97', 97, 17, '2828251.70', 4);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('98', 98, 18, '4.10', 3);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('99', 99, 19, '20644543.78', 8);
INSERT INTO `produtcs_shops` (`id`, `fk_product_id`, `fk_shop_id`, `price`, `total`) VALUES ('100', 100, 20, '0.77', 7);

-- orders

INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('1', '52', 'ozon_card', 'quidem');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('2', '49', 'other_card', 'sunt');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('3', '49', 'other_card', 'quod');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('4', '62', 'ozon_card', 'hic');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('5', '81', 'other_card', 'sapiente');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('6', '4', 'ozon_card', 'soluta');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('7', '93', 'ozon_card', 'neque');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('8', '63', 'other_card', 'id');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('9', '80', 'ozon_card', 'quas');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('10', '55', 'ozon_card', 'quas');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('11', '68', 'other_card', 'aut');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('12', '34', 'other_card', 'amet');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('13', '43', 'other_card', 'similique');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('14', '41', 'other_card', 'qui');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('15', '39', 'ozon_card', 'necessitatibus');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('16', '13', 'other_card', 'magni');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('17', '88', 'ozon_card', 'et');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('18', '61', 'ozon_card', 'aut');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('19', '62', 'other_card', 'voluptas');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('20', '19', 'ozon_card', 'consequuntur');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('21', '37', 'ozon_card', 'et');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('22', '85', 'other_card', 'sapiente');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('23', '32', 'other_card', 'qui');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('24', '92', 'ozon_card', 'quia');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('25', '68', 'ozon_card', 'saepe');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('26', '40', 'ozon_card', 'ab');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('27', '45', 'ozon_card', 'odio');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('28', '59', 'other_card', 'voluptas');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('29', '29', 'other_card', 'pariatur');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('30', '54', 'other_card', 'enim');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('31', '46', 'ozon_card', 'est');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('32', '42', 'ozon_card', 'non');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('33', '61', 'other_card', 'unde');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('34', '33', 'ozon_card', 'dolorum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('35', '3', 'other_card', 'quia');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('36', '48', 'ozon_card', 'culpa');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('37', '77', 'other_card', 'dolore');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('38', '15', 'ozon_card', 'possimus');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('39', '98', 'ozon_card', 'dolorem');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('40', '38', 'other_card', 'assumenda');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('41', '43', 'ozon_card', 'perspiciatis');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('42', '37', 'ozon_card', 'blanditiis');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('43', '24', 'other_card', 'alias');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('44', '75', 'ozon_card', 'voluptas');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('45', '74', 'ozon_card', 'hic');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('46', '9', 'other_card', 'non');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('47', '24', 'ozon_card', 'sunt');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('48', '86', 'ozon_card', 'magni');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('49', '27', 'other_card', 'impedit');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('50', '81', 'other_card', 'cum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('51', '80', 'ozon_card', 'deserunt');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('52', '85', 'other_card', 'accusantium');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('53', '11', 'other_card', 'facilis');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('54', '77', 'other_card', 'aut');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('55', '70', 'ozon_card', 'temporibus');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('56', '36', 'other_card', 'consequuntur');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('57', '4', 'other_card', 'quisquam');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('58', '14', 'other_card', 'voluptas');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('59', '87', 'ozon_card', 'tenetur');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('60', '94', 'ozon_card', 'eum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('61', '52', 'other_card', 'autem');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('62', '85', 'other_card', 'quisquam');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('63', '61', 'ozon_card', 'atque');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('64', '18', 'ozon_card', 'vel');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('65', '46', 'ozon_card', 'accusantium');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('66', '84', 'ozon_card', 'eum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('67', '71', 'ozon_card', 'culpa');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('68', '60', 'other_card', 'necessitatibus');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('69', '48', 'ozon_card', 'magni');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('70', '80', 'other_card', 'tempora');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('71', '18', 'other_card', 'facilis');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('72', '27', 'other_card', 'eaque');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('73', '2', 'other_card', 'aperiam');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('74', '9', 'ozon_card', 'qui');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('75', '11', 'other_card', 'inventore');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('76', '34', 'ozon_card', 'repellendus');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('77', '15', 'ozon_card', 'id');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('78', '30', 'ozon_card', 'qui');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('79', '88', 'ozon_card', 'sequi');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('80', '20', 'other_card', 'officiis');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('81', '86', 'other_card', 'voluptas');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('82', '87', 'other_card', 'aut');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('83', '81', 'ozon_card', 'rerum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('84', '78', 'ozon_card', 'est');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('85', '17', 'other_card', 'laudantium');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('86', '83', 'other_card', 'laboriosam');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('87', '40', 'ozon_card', 'sit');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('88', '85', 'ozon_card', 'ipsum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('89', '90', 'other_card', 'voluptatem');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('90', '37', 'ozon_card', 'et');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('91', '41', 'ozon_card', 'omnis');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('92', '80', 'ozon_card', 'nisi');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('93', '30', 'ozon_card', 'quod');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('94', '38', 'ozon_card', 'possimus');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('95', '33', 'ozon_card', 'libero');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('96', '94', 'ozon_card', 'earum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('97', '68', 'ozon_card', 'minus');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('98', '85', 'other_card', 'rerum');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('99', '85', 'ozon_card', 'fuga');
INSERT INTO `orders` (`id`, `fk_o_user_id`, `payment_type`, `delivery_address`) VALUES ('100', '28', 'other_card', 'consequatur');

-- orders_products

INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('1', '7', 29, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('2', '4', 60, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('3', '14', 17, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('4', '47', 2, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('5', '4', 2, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('6', '52', 27, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('7', '92', 26, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('8', '52', 57, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('9', '85', 36, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('10', '85', 51, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('11', '87', 22, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('12', '84', 46, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('13', '47', 59, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('14', '51', 95, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('15', '14', 90, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('16', '9', 68, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('17', '35', 79, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('18', '84', 76, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('19', '89', 42, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('20', '83', 4, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('21', '76', 11, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('22', '98', 91, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('23', '35', 85, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('24', '10', 9, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('25', '37', 66, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('26', '60', 78, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('27', '9', 72, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('28', '75', 94, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('29', '16', 76, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('30', '41', 17, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('31', '47', 95, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('32', '28', 45, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('33', '79', 87, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('34', '24', 76, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('35', '87', 33, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('36', '34', 32, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('37', '71', 42, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('38', '78', 55, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('39', '1', 67, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('40', '43', 2, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('41', '22', 9, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('42', '85', 60, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('43', '97', 40, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('44', '85', 64, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('45', '24', 55, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('46', '85', 82, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('47', '22', 88, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('48', '48', 72, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('49', '55', 37, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('50', '27', 24, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('51', '4', 95, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('52', '1', 42, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('53', '66', 46, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('54', '76', 14, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('55', '75', 69, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('56', '1', 19, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('57', '93', 70, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('58', '97', 71, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('59', '31', 18, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('60', '60', 17, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('61', '44', 93, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('62', '74', 65, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('63', '89', 83, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('64', '77', 86, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('65', '26', 66, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('66', '76', 67, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('67', '95', 46, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('68', '71', 60, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('69', '71', 13, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('70', '80', 93, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('71', '72', 84, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('72', '87', 23, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('73', '91', 77, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('74', '66', 81, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('75', '18', 99, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('76', '18', 47, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('77', '78', 66, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('78', '2', 12, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('79', '89', 91, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('80', '88', 79, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('81', '57', 33, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('82', '97', 63, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('83', '81', 14, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('84', '4', 75, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('85', '98', 20, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('86', '16', 74, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('87', '9', 14, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('88', '73', 98, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('89', '64', 60, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('90', '41', 62, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('91', '47', 7, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('92', '65', 65, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('93', '19', 77, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('94', '94', 94, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('95', '59', 39, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('96', '4', 45, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('97', '9', 99, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('98', '96', 42, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('99', '10', 79, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('100', '57', 91, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('101', '15', 8, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('102', '65', 69, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('103', '100', 90, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('104', '15', 92, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('105', '22', 18, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('106', '33', 45, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('107', '79', 96, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('108', '52', 92, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('109', '32', 81, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('110', '19', 97, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('111', '22', 82, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('112', '79', 78, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('113', '86', 40, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('114', '22', 20, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('115', '77', 35, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('116', '67', 50, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('117', '40', 52, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('118', '75', 80, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('119', '53', 36, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('120', '91', 23, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('121', '1', 60, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('122', '72', 93, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('123', '2', 99, 4);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('124', '90', 18, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('125', '55', 45, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('126', '41', 40, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('127', '14', 98, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('128', '88', 56, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('129', '38', 39, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('130', '56', 57, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('131', '100', 70, 9);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('132', '97', 10, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('133', '84', 45, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('134', '38', 91, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('135', '23', 97, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('136', '73', 97, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('137', '61', 41, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('138', '6', 24, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('139', '3', 6, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('140', '48', 54, 2);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('141', '40', 58, 7);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('142', '62', 24, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('143', '100', 57, 8);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('144', '57', 88, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('145', '15', 62, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('146', '45', 67, 1);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('147', '30', 54, 6);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('148', '72', 50, 3);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('149', '25', 23, 5);
INSERT INTO `orders_products` (`id`, `fk_opd_order_id`, `fk_opd_product_id`, `total`) VALUES ('150', '56', 76, 7);

-- discounts

INSERT INTO `discounts` (`id`, `fk_d_user_id`, `fk_d_product_id`, `discount`, `only_ozon_card`) VALUES (1, 1, 3, 0.5, '1');
INSERT INTO `discounts` (`id`, `fk_d_user_id`, `fk_d_product_id`, `discount`, `only_ozon_card`) VALUES (2, 3, 8, 0.4, '0');
INSERT INTO `discounts` (`id`, `fk_d_user_id`, `fk_d_product_id`, `discount`, `only_ozon_card`) VALUES (3, 5, 9, 0.3, '0');
INSERT INTO `discounts` (`id`, `fk_d_user_id`, `fk_d_product_id`, `discount`, `only_ozon_card`) VALUES (4, 7, NULL, 0.2, '1');
INSERT INTO `discounts` (`id`, `fk_d_user_id`, `fk_d_product_id`, `discount`, `only_ozon_card`) VALUES (5, NULL, 3, 0.1, '1');

-- cashback_ozon_card
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (1, 11, '0.25554');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (2, 4, '0.206');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (3, 8, '0.113024');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (4, 9, '0');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (5, 2, '0.104919');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (6, 9, '0.161');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (7, 10, '0.22598');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (8, 10, '0.07');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (9, 15, '0');
INSERT INTO `cashback_ozon_card` (`id`, `fk_cb_catalog_id`, `cashback`) VALUES (10, 14, '0.225');

-- reviews

INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('1', 50, '66', 5, 'Velit corporis ut repudiandae ab qui magnam. Deleniti temporibus minus explicabo labore. Ut eum ut enim molestias velit eos. Deleniti quo voluptatem et harum debitis eum.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('2', 17, '97', 5, 'Id et et sed iusto quia quis commodi. Ut odio ut soluta vero aut sint. Et sit sit voluptatem architecto in quaerat a. Perspiciatis magnam quo amet qui distinctio.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('3', 36, '68', 5, 'Dolorem incidunt ab iste modi. Error natus commodi sit dolorum. Voluptatum molestiae consequuntur non nulla quis. Aspernatur ratione sed sed doloribus maxime.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('4', 25, '98', 4, 'Iusto neque distinctio sed est sit. Nihil temporibus et aliquid vitae. Ut necessitatibus perferendis consectetur.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('5', 39, '74', 2, 'Eos maxime officiis voluptatem laudantium inventore rerum. Et quaerat rerum fugiat sint. Quasi rerum voluptates qui assumenda cumque dolorem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('6', 42, '97', 4, 'Sequi facere consequatur eaque et vitae. Magni dolor beatae pariatur fugiat. Reiciendis non id voluptas non nihil ut quos. Unde ab distinctio quod cumque. Officia qui et illo facilis et.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('7', 34, '89', 4, 'Maxime excepturi soluta non fugit. Temporibus occaecati consequatur velit culpa qui. Vel est ea et assumenda sit voluptatem nihil et. Veritatis dignissimos alias inventore rem nisi fuga nisi ut.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('8', 21, '96', 3, 'Voluptate ipsa velit in veritatis aut. Cum est quos consequatur consectetur est cupiditate. Facere enim pariatur et doloribus adipisci. Ut aut sit fugit accusamus veniam ut.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('9', 14, '57', 2, 'Est qui sint aspernatur recusandae. Voluptas et occaecati eum.\nIn quidem tempore eaque impedit. Necessitatibus similique cum asperiores sit ab nam. Ea aspernatur mollitia non veritatis rerum.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('10', 49, '68', 3, 'Ut sit id omnis. Quia id est quibusdam ipsum hic nam. Voluptatem consequuntur neque quisquam quia iure aut nihil.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('11', 31, '97', 1, 'Quo ut adipisci et. Voluptates hic maxime voluptatem unde sint.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('12', 52, '63', 2, 'Quae ipsum dolor molestiae delectus iusto illo et. Molestiae sed ea similique ipsa molestias. Fugiat aut dolorum enim architecto.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('13', 29, '95', 3, 'Fugiat harum omnis eius perspiciatis aut et. Ratione iure dolores totam molestiae dolores laudantium quia. Ex architecto iusto vero illum id reprehenderit voluptates consequatur.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('14', 16, '76', 1, 'Sit voluptatem dignissimos modi sed qui earum. Aut aut enim dicta sed dolore excepturi. Aliquid laudantium in laudantium rerum temporibus molestiae fugiat.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('15', 35, '70', 3, 'Reprehenderit non numquam temporibus sed distinctio qui. Placeat consequatur consequatur dolores et. Cumque occaecati sapiente quam possimus quo laboriosam. Ut eaque autem quo qui est.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('16', 13, '72', 4, 'Laudantium saepe a omnis ipsum quis. Est aut ratione voluptas voluptatem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('17', 27, '59', 2, 'Doloremque at aliquid hic ut itaque et. Unde nihil in fugiat eos. Beatae numquam dolore dignissimos corporis sit iure. Quia aliquam sapiente voluptates quia quisquam exercitationem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('18', 22, '96', 3, 'Sit nihil autem dolor ullam molestias non. Veritatis impedit aspernatur assumenda quasi repellat. Illum quod iure sint alias est nam.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('19', 16, '72', 2, 'Ut et animi exercitationem dignissimos repudiandae odit architecto nostrum. Ut quis illum et. Nam ut inventore eius nihil. Ipsum neque perferendis vel.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('20', 22, '82', 5, 'Id ipsum fuga assumenda corrupti ut voluptatum. Reiciendis excepturi assumenda voluptatem in praesentium quia omnis.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('21', 43, '88', 5, 'Pariatur consequatur voluptatem aliquam similique. Accusamus ullam rem et ullam. Modi eius totam quam accusamus facere.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('22', 40, '81', 4, 'Sed ad rerum beatae impedit. Fugiat ab autem inventore optio. Aliquam similique sed reiciendis quae.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('23', 16, '68', 1, 'Non rerum qui enim iure pariatur molestiae. Odio omnis est cum minima ex. Ut doloremque aut qui cum. Voluptates perspiciatis nobis alias tempore illum repudiandae.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('24', 27, '76', 4, 'Animi optio porro qui eum consectetur consequatur explicabo. Sint et occaecati sequi itaque eligendi. Eveniet possimus eveniet distinctio minima.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('25', 49, '88', 2, 'Laboriosam maxime illum eaque eos aut earum. Incidunt commodi velit amet voluptatibus voluptas. Et porro necessitatibus omnis ea culpa unde. Fuga exercitationem autem possimus rerum minima ut est.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('26', 39, '90', 1, 'Qui neque aut ducimus consequuntur voluptatem delectus. Ullam ab id earum harum id magnam ut. Voluptatem quae qui eum eos dignissimos iure. Ut facilis eveniet porro alias rerum facilis.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('27', 13, '84', 4, 'Fugiat tempore a et voluptates. Quis accusantium hic rerum blanditiis. Tempore eius inventore ut error non voluptas sint. Doloribus voluptate nisi ullam harum rerum.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('28', 49, '73', 5, 'Vero eum amet cupiditate. Qui iusto dolor quos deserunt asperiores consequatur. Debitis molestias id rerum aut delectus ad velit. Est est laborum omnis consequuntur.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('29', 38, '83', 5, 'Dolore quis numquam autem iste dolorem suscipit qui. Similique labore ea ut. Non officiis aut inventore quod nulla quia est.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('30', 45, '82', 4, 'Qui magnam dolor quas sed. Sit aliquid nesciunt at nostrum quis quia. Est dolor illo sint dolor voluptatem sint ut.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('31', 32, '84', 3, 'Error expedita hic et quas consequatur omnis. Corrupti ut enim et quidem pariatur.\nNam perspiciatis porro magnam. Quibusdam ut odio fuga dicta totam.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('32', 16, '96', 5, 'Rem dolorem error ullam sit repellendus ratione. Velit pariatur omnis veritatis aut perspiciatis quo. Alias voluptas quos temporibus vitae sed iste sint. Nostrum ut culpa nam placeat dolorem enim.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('33', 18, '56', 3, 'Magni provident quisquam et est laboriosam. Non impedit reprehenderit soluta suscipit earum vero fugiat sed. Est quis qui illum dolore aperiam quia aut est.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('34', 39, '83', 1, 'Eos aliquid et iusto corrupti incidunt fugit unde. Debitis nulla fugit quia vel qui. Eveniet nisi necessitatibus qui mollitia non quaerat. Nostrum quisquam illo doloribus aperiam totam ex.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('35', 28, '76', 2, 'Earum iste officia vero. Minus veritatis omnis quia et. Saepe quia culpa adipisci alias quo minus ut laboriosam.\nOccaecati atque non esse. Sed asperiores et et similique.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('36', 28, '70', 5, 'Nihil molestiae qui quae quidem. Nam est dignissimos et est velit a vero. Adipisci beatae unde vitae cumque vitae non.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('37', 18, '81', 4, 'In fugiat voluptatem veniam debitis. Qui quam perspiciatis soluta accusantium. Et explicabo reiciendis illum aspernatur suscipit consequatur distinctio.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('38', 22, '88', 5, 'Illum rerum veniam aspernatur non expedita earum iure. Dolorum nulla quia minima quis eos quos. Amet voluptate sint et suscipit ullam quis nisi omnis.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('39', 29, '90', 3, 'Et delectus et iste nihil. Vel rerum voluptatem est accusantium saepe dolor.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('40', 29, '57', 4, 'Voluptatem est perspiciatis reprehenderit odit a rerum. Aut eligendi quo corrupti alias. Neque voluptatum voluptas facilis fugiat.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('41', 14, '62', 3, 'Aliquid dolores blanditiis cupiditate quidem minima. Repellat aperiam distinctio voluptatibus numquam et ut. Ut eaque ratione facere eos sed blanditiis exercitationem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('42', 42, '79', 3, 'Consequatur sit in blanditiis voluptatem atque. Reprehenderit ipsum numquam veniam. Ut qui iusto consequatur et. Sint sint odit aut assumenda.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('43', 38, '98', 2, 'Omnis vel fugit voluptas hic magnam. Ex veniam voluptatum qui ad ratione culpa optio. Quas dolores rerum quo magnam. Autem dolorem provident perspiciatis quos natus nisi.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('44', 50, '96', 2, 'Exercitationem ut quod eum et incidunt sed voluptatem. Voluptas explicabo modi velit et dolorem. Velit pariatur omnis voluptatibus.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('45', 48, '96', 1, 'Et dolorem fuga dolor. Nisi cupiditate ut nulla porro modi optio iste. Atque non accusamus rerum dolorem id commodi iure modi.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('46', 29, '56', 1, 'Est magnam atque esse similique est est voluptas. Accusamus et ullam saepe nam et incidunt. Sed vel omnis dolorem sint perferendis incidunt. Sunt aut molestiae amet sint.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('47', 31, '66', 3, 'Et dolorem accusantium quibusdam eveniet molestiae. Aut omnis sed ab est dolor accusantium est.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('48', 26, '56', 4, 'Odio rerum doloremque et temporibus nihil. Quas vel explicabo corrupti aspernatur. Qui consequatur consequatur et. Similique dolorem quis atque atque sunt.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('49', 43, '89', 3, 'Eos facere doloremque est cum voluptas facere. Rerum fugiat debitis et consequatur. Ut sit aperiam rerum quas voluptate.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('50', 40, '95', 5, 'Similique nulla alias temporibus numquam. Saepe qui recusandae et cumque asperiores corrupti. Quasi doloremque sit in aut.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('51', 17, '96', 3, 'Et id nostrum labore officia rerum. Placeat rerum excepturi sint odit neque. Quae dicta ut aut labore odio ducimus. Illo eveniet corrupti et dolore a aut enim.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('52', 47, '75', 5, 'Molestias perspiciatis veritatis porro et nulla sapiente distinctio. Natus totam voluptatibus numquam. Ea nostrum explicabo natus doloribus. Autem sit vero sed repellendus porro.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('53', 38, '98', 1, 'Eaque voluptas dolor eos recusandae optio. Aut qui quis corrupti aut ipsum. Iste omnis incidunt optio est ipsa.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('54', 32, '96', 1, 'Sit illo quia accusamus iusto minima qui in. Minus et ut perferendis.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('55', 45, '71', 5, 'Voluptatem aspernatur nemo nam consequatur omnis optio illum sit. Aut mollitia illo eius voluptas quasi. Natus consequuntur saepe saepe.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('56', 21, '58', 2, 'Temporibus repellendus est iste libero reprehenderit. Aut est dolorem et cumque. Ratione incidunt non ea nemo.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('57', 24, '98', 3, 'Qui natus nihil omnis optio. Officiis exercitationem quo expedita animi recusandae enim nulla. Et est fugiat consequatur voluptatem cum aut ut deserunt.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('58', 46, '83', 5, 'Sit consequuntur explicabo tempora eum eum rerum. Quia qui qui dolorem et reiciendis modi. Voluptates reiciendis soluta magnam eligendi animi. Quo ipsa voluptas aut possimus.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('59', 39, '63', 5, 'Est consequatur dolore sapiente est et temporibus. Corporis sunt quibusdam id ratione est error recusandae. Amet eum voluptatem voluptatem est labore.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('60', 45, '90', 2, 'Quod maxime omnis suscipit sint consequatur. Esse hic consequatur natus nisi quo perspiciatis. Perspiciatis fugiat dolorem similique consequatur. Quia facere delectus asperiores similique unde rerum.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('61', 52, '66', 3, 'Id et molestiae numquam ea numquam. Aut ab aut exercitationem quo unde explicabo. Quidem error aut assumenda doloremque est. Dolorem sit sed amet.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('62', 30, '62', 4, 'Consequatur quo totam neque harum modi suscipit amet. Ex ut eum doloribus cupiditate. Veniam asperiores magnam deserunt sit sint et. Est perferendis laborum ea neque neque natus soluta.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('63', 48, '60', 2, 'Odio atque et quasi fugit. Libero maiores qui quibusdam veritatis enim rem eum. Ipsum ut molestiae quia veritatis sunt repellat.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('64', 51, '77', 5, 'Consequatur tempora soluta fuga eum. Qui doloremque velit laborum impedit quia iste eos. Aliquam modi quia perspiciatis corporis.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('65', 35, '64', 5, 'Illo molestiae consequatur in maxime incidunt explicabo. Et porro atque tempore necessitatibus reiciendis dolorum eos. Ratione voluptatibus delectus qui quia quisquam non architecto.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('66', 39, '64', 2, 'Cupiditate ipsa dolor recusandae distinctio voluptas. Dolores quia velit ea excepturi et.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('67', 39, '67', 5, 'A quia non tempora debitis sit et. Nobis cumque dicta voluptas fuga. Dolores velit et dolore nam alias harum id veniam.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('68', 26, '72', 3, 'Nihil eius eos ut placeat natus. Recusandae commodi laudantium voluptatibus illo. Delectus reprehenderit quia deserunt veniam laboriosam.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('69', 25, '77', 3, 'Dicta et ut vel. Laboriosam necessitatibus rerum quia totam maiores. Officiis adipisci veritatis consequatur perferendis necessitatibus. Inventore reiciendis accusamus repellendus maiores ea.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('70', 21, '94', 4, 'Temporibus et eos eaque voluptas qui. Temporibus et laborum qui reiciendis maxime. Sit dignissimos veritatis est ipsum voluptatem dolor sed. Illum voluptatum et pariatur repudiandae iste.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('71', 20, '93', 2, 'In autem et consequuntur ut soluta ut et. Minima dolores blanditiis natus aut. Rerum voluptas illum in veniam doloremque aut. Dolorem eum repellendus perspiciatis vero.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('72', 51, '73', 3, 'Autem aut eaque non pariatur voluptate. Voluptatem voluptatum et delectus dolores nisi delectus. Autem nihil sit minus earum non sint ad. Neque vel exercitationem sint quibusdam.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('73', 49, '88', 2, 'Cupiditate nesciunt maxime est saepe. Culpa sit vero aut ea sit. Iste quia pariatur ex corporis. Consectetur modi qui inventore.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('74', 47, '93', 5, 'Est vero qui dicta. Aut et ut et ea. Adipisci perspiciatis commodi rerum tenetur et. Error quibusdam assumenda laudantium vero.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('75', 32, '87', 2, 'Id non asperiores qui et quia. Sunt placeat officia placeat dolorum deleniti fugit. Officia nihil iusto voluptatem omnis ad sapiente. Dignissimos error earum ut recusandae in omnis minima.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('76', 35, '73', 5, 'Exercitationem laboriosam asperiores et repellendus consequuntur accusamus adipisci nemo. Reiciendis commodi ducimus in.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('77', 31, '85', 5, 'Voluptatem distinctio sint enim aut alias ut. Delectus est ut non cupiditate. Commodi in aperiam modi repudiandae. Cupiditate a enim qui laboriosam soluta.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('78', 15, '92', 5, 'Non dolor alias eum vel voluptatem. Laudantium excepturi voluptatem quia in pariatur aliquam. Dolorum vel hic consequatur inventore nostrum quos voluptatibus.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('79', 19, '92', 5, 'Culpa alias fugit dolor temporibus repellat. Placeat ea quia quis non laboriosam quaerat. Vitae porro veritatis velit sunt eum dolorum voluptatem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('80', 41, '85', 5, 'Esse odio veritatis cumque doloremque nam pariatur. Quisquam libero doloribus qui porro expedita voluptatem. Blanditiis blanditiis adipisci dolores qui dolore. Culpa saepe placeat et aliquid qui.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('81', 35, '63', 4, 'Facere omnis voluptatum distinctio quam aut id et mollitia. Ratione laborum eos error voluptatem optio ut est. Nisi facilis tempore veritatis blanditiis. Odit perferendis ex officiis error natus.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('82', 51, '75', 1, 'Dolore aspernatur quia commodi et. Nisi id voluptatem aut. Inventore laudantium libero hic et qui et. Est sunt voluptas quae voluptates maiores. Natus et est eum assumenda.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('83', 34, '81', 4, 'Autem rerum id odio incidunt aliquid sed. Nesciunt corporis eligendi delectus voluptas culpa. Error qui consequatur consectetur aut aut dignissimos.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('84', 25, '61', 3, 'Praesentium ex cum ut inventore quia. Vel sit et ut non quaerat illum magnam aspernatur. Eveniet voluptate quia id sunt hic.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('85', 15, '92', 1, 'Nisi in aliquam minus reiciendis et et voluptas. Mollitia beatae est delectus aut delectus et. Non nostrum earum enim reprehenderit eum placeat.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('86', 39, '73', 2, 'Minima sunt itaque architecto nobis sed odit in. Sunt laudantium maiores assumenda veritatis. Odit qui aut et minus doloribus architecto. Aut iste qui in.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('87', 16, '79', 4, 'Id eum qui at voluptas ut qui ullam. Sed et blanditiis quos deleniti ad nisi animi fugit. Consequatur sint sit quaerat blanditiis nam pariatur aut.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('88', 27, '80', 2, 'Ut molestiae cum et. Molestiae labore ea fugiat incidunt quas quisquam.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('89', 40, '62', 4, 'Et non aspernatur praesentium vitae. Distinctio voluptatem earum enim. Aut porro deleniti dolorem similique.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('90', 48, '59', 5, 'Cum aspernatur harum dicta in sit sed. Commodi maxime qui quod repudiandae ab. Eos voluptas hic similique suscipit voluptates. Inventore aut voluptates molestiae aut.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('91', 44, '93', 1, 'Nesciunt velit qui voluptas rerum. Architecto quasi sequi veritatis tempore quidem. Hic nihil maxime iure autem nesciunt iusto. Error quidem consectetur tenetur adipisci ut voluptatem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('92', 48, '78', 1, 'Illo velit occaecati quae aspernatur dolor. Aut aut voluptatem quae laborum sunt beatae. In voluptate officia dolor sint dolor.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('93', 13, '59', 4, 'Dolor assumenda iste deserunt et eos ut non. Sapiente recusandae est aut rem aliquid. Sint qui voluptas accusamus est est. Alias provident voluptatum voluptas molestiae quo eveniet repudiandae.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('94', 49, '82', 5, 'Fugiat et in aliquam aliquam consectetur asperiores neque. Voluptatem est eum veritatis consequatur dolores. Accusantium aliquam et ab sed ratione dolores exercitationem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('95', 35, '67', 2, 'Consequatur illo ab voluptas at. Sunt voluptas explicabo dolor.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('96', 23, '61', 5, 'Aut est atque ea iure placeat voluptatem. Modi odit est illo. Odit voluptas et unde quia exercitationem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('97', 37, '71', 2, 'Ab sed et magni facilis ut omnis accusantium. Nulla laboriosam vel aspernatur molestiae et voluptas. Quidem qui quia aut. Omnis laboriosam voluptatem ut accusantium assumenda numquam et.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('98', 18, '92', 2, 'Officiis expedita numquam fugit consequatur. Commodi quo reiciendis mollitia eius quia labore. Sint inventore sit similique laboriosam. Quos reprehenderit autem vero eligendi.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('99', 13, '90', 1, 'Sed a eos enim corrupti et saepe. Alias aliquam laborum et velit quam illum occaecati. Vel quia et dolor et voluptatem.');
INSERT INTO `reviews` (`id`, `fk_rw_poducts_id`, `fk_rw_user_id`, `stars`, `content`) VALUES ('100', 19, '76', 5, 'Sunt sapiente odio dolorum amet corporis harum dolores. Doloremque ex ex modi voluptas optio et. Provident vero ratione dolor ex doloremque.');

-- favourites

INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('1', '40', 55);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('2', '34', 25);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('3', '32', 74);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('4', '22', 54);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('5', '22', 2);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('6', '42', 98);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('7', '56', 4);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('8', '56', 41);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('9', '52', 16);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('10', '57', 88);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('11', '45', 84);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('12', '38', 2);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('13', '54', 15);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('14', '24', 52);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('15', '59', 72);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('16', '56', 27);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('17', '43', 9);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('18', '26', 90);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('19', '59', 83);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('20', '30', 39);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('21', '20', 43);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('22', '59', 32);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('23', '60', 7);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('24', '37', 18);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('25', '30', 78);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('26', '24', 47);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('27', '35', 70);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('28', '35', 24);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('29', '60', 39);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('30', '46', 37);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('31', '58', 90);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('32', '28', 49);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('33', '40', 2);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('34', '20', 77);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('35', '60', 62);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('36', '24', 18);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('37', '50', 81);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('38', '22', 78);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('39', '44', 6);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('40', '36', 82);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('41', '25', 96);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('42', '45', 72);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('43', '41', 38);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('44', '54', 95);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('45', '32', 92);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('46', '31', 69);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('47', '27', 31);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('48', '51', 92);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('49', '41', 67);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('50', '40', 89);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('51', '58', 47);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('52', '47', 58);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('53', '55', 84);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('54', '55', 41);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('55', '41', 55);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('56', '43', 99);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('57', '28', 25);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('58', '23', 17);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('59', '35', 14);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('60', '28', 30);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('61', '39', 78);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('62', '26', 54);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('63', '39', 96);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('64', '22', 24);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('65', '51', 22);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('66', '36', 85);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('67', '58', 52);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('68', '42', 52);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('69', '22', 85);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('70', '50', 33);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('71', '42', 95);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('72', '26', 36);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('73', '60', 76);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('74', '46', 56);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('75', '60', 69);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('76', '37', 22);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('77', '50', 57);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('78', '45', 29);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('79', '30', 94);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('80', '60', 43);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('81', '40', 64);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('82', '24', 81);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('83', '60', 68);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('84', '46', 15);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('85', '46', 54);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('86', '24', 8);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('87', '38', 69);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('88', '41', 99);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('89', '49', 5);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('90', '43', 37);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('91', '28', 81);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('92', '58', 75);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('93', '41', 38);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('94', '54', 26);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('95', '23', 28);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('96', '39', 84);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('97', '21', 82);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('98', '22', 19);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('99', '45', 65);
INSERT INTO `favourites` (`id`, `fk_fv_user_id`, `fk_fv_product_id`) VALUES ('100', '56', 62);













