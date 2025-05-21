USE `seschool_07`;

CREATE TABLE `-Users` (
		`id_user` BIGINT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
		`name_user` VARCHAR(75) NOT NULL,
		`age_user` INT UNSIGNED,
		`Country` VARCHAR(75)
		);
		
CREATE TABLE `-Orders` (
		`id_order` BIGINT(8) UNSIGNED PRIMARY KEY,
		`user_id` BIGINT(8) UNSIGNED, 
		`cost_order` DECIMAL NOT NULL,
		`date_order` DATETIME,
		FOREIGN KEY (`user_id`) REFERENCES `-Users`(`id_user`)
);

CREATE TABLE `-reviews` (
		`id_review` BIGINT(8) UNSIGNED PRIMARY KEY, 
		`user_id` BIGINT(8) UNSIGNED, 
		`grade` TINYINT,
		`text_review` VARCHAR(75),
		FOREIGN KEY (`user_id`) REFERENCES `-Users`(`id_user`)
);

INSERT INTO `-Users`(`name_user`,`age_user`, `Country`) VALUES 
		('Иван', 25, 'Россия'),
		('Ольга', 30, 'Украина'),
		('Джон', 22, 'США'),
		('Мария', 28, 'Беларусь'),
		('Антон', 35, 'Россия');
		
		
INSERT INTO `-Orders`(`id_order`,`user_id`,`cost_order`, `date_order`) VALUES 
		(101, 1, 1500, '2024-09-01'),
		(102, 2, 3000, '2024-09-02'),
		(103, 3, 500, '2024-09-03'),
		(104, 4, 2000, '2024-09-04'),
		(105, 5, 1000, '2024-09-05');
		
INSERT INTO `-reviews`(`id_review`,`user_id`,`grade`, `text_review`) VALUES 
		(201, 1, 5, 'Отличный сервис!'),
		(202, 2, 4, 'Все понравилось'),
		(203, 1, 3, 'Дорого, но качественно'),
		(204, 3, 2, 'Не удовлетворен сервисом'),
		(205, 4, 5, 'Супер обслуживание!');
		
		
		
		
-- 1.

SELECT `name_user`,`age_user`, `Country` FROM `-Users`
	INNER JOIN `-Orders` ON `-Orders`.user_id = `-Users`.id_user
	INNER JOIN `-reviews` ON `-reviews`.user_id = `-Users`.id_user
	WHERE `-reviews`.grade > 4;

 -- 2.

SELECT `name_user`,`age_user` FROM `-Users`
	INNER JOIN `-Orders` ON `-Orders`.user_id = `-Users`.id_user
WHERE `-Orders`.cost_order > 1000;

 -- 3.
 
SELECT `id_order`, `name_user` FROM `-Orders`
	INNER JOIN `-Users` ON `-Orders`.user_id = `-Users`.id_user;
 
-- 4.

SELECT `name_user`, `Country` FROM `-Users`
	INNER JOIN `-reviews` ON `-reviews`.user_id = `-Users`.id_user
	GROUP BY `-reviews`.`user_id`
	HAVING COUNT(*) > 1;

-- 5.
SELECT `id_order` FROM `-Orders`
	INNER JOIN `-Users` ON `-Orders`.user_id = `-Users`.id_user
	INNER JOIN `-reviews` ON `-reviews`.user_id = `-Users`.id_user
	WHERE `-reviews`.grade < 3;

-- 6.

SELECT `name_user`, `text_review`, `date_order` FROM `-Users`
	INNER JOIN `-Orders` ON `-Orders`.user_id = `-Users`.id_user
	INNER JOIN `-reviews` ON `-reviews`.user_id = `-Users`.id_user
	WHERE `-Orders`.date_order > '2024-09-01';

 -- 7.
 SELECT `name_user`, AVG(`-Orders`.cost_order) FROM `-Users`
	INNER JOIN `-Orders` ON `-Orders`.user_id = `-Users`.id_user
	GROUP BY `-Orders`.user_id
	HAVING COUNT(*) > 0;
	

 -- 8.
SELECT `name_user`,`age_user`, `Country` FROM `-Users`
	INNER JOIN `-Orders` ON `-Orders`.user_id = `-Users`.id_user
	INNER JOIN `-reviews` ON `-reviews`.user_id = `-Users`.id_user
	WHERE `Country` = 'Россия' AND `-reviews`.grade > 3; 


-- 9.

SELECT `name_user` FROM `-Users`
	LEFT JOIN `-reviews` ON `-reviews`.user_id = `-Users`.id_user
	WHERE `-reviews`.`user_id` IS NULL;

-- 10.

SELECT `name_user`,`text_review` FROM `-Users`
	INNER JOIN `-Orders` ON `-Orders`.user_id = `-Users`.id_user
	INNER JOIN `-reviews` ON `-reviews`.user_id = `-Users`.id_user
	WHERE `-Orders`.cost_order < 2000;











