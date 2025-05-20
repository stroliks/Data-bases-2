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