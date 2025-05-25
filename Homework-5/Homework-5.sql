
USE `seschool_07`;

CREATE TABLE `//categories` (
		`category_id`  BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		`category_name` VARCHAR(60) NOT NULL
);

CREATE TABLE `//products` (
		`product_id` BIGINT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		`product_name` VARCHAR(60) NOT NULL,
		`category_id`  BIGINT(8) UNSIGNED NOT NULL,
		`price` DECIMAL UNSIGNED NOT NULL,
		FOREIGN KEY (`category_id`) REFERENCES `//categories`(`category_id`)
);

INSERT INTO `//categories` (category_name) VALUES
('Категория 1'),
('Категория 2'),
('Категория 3');

INSERT INTO `//products` (product_name, category_id, price) VALUES
('Продукт A', 1, 50),
('Продукт B', 1, 30),
('Продукт C', 2, 20),
('Продукт D', 2, 70),
('Продукт E', 3, 100);


 -- 1. Найти все продукты, цена которых выше средней цены всех продуктов.
 SELECT `product_id`, `product_name` FROM `//products`
 WHERE `//products`.price > (SELECT AVG(`//products`.price) FROM `//products`);
 
 
 -- 2. Найти все категории, в которых хотя бы один продукт имеет цену выше 100.
 SELECT `//categories`.`category_id`, `category_name` FROM `//categories`
 INNER JOIN `//products` ON `//products`.`category_id` = `//categories`.`category_id`
 WHERE `//products`.`price` >=100;
 
 
 -- 3. Вывести название продукта и количество продуктов в его категории.
SELECT `product_name`, `count in category` FROM `//products`
INNER JOIN
(SELECT `category_id`, COUNT(*) AS `count in category` FROM `//products`
GROUP BY `category_id`) AS `temp_table`
ON `//products`.`category_id` = `temp_table`.`category_id`;

 
 -- 4. Найти продукты, чья цена выше средней цены продуктов в их категории.
SELECT `product_name`, `price`, `avg_price in category` FROM `//products`
INNER JOIN
(SELECT `category_id`, AVG(`price`) AS `avg_price in category` FROM `//products`
GROUP BY `category_id`) AS `temp_table`
ON `//products`.`category_id` = `temp_table`.`category_id`
WHERE `price`> `temp_table`.`avg_price in category`;
 
 
 -- 5. Найти категории, в которых средняя цена продуктов выше средней цены по всем продуктам.
SELECT `category_name` FROM `//categories`
INNER JOIN
(SELECT `category_id`, AVG(`price`) AS `avg_price in category` FROM `//products`
GROUP BY `category_id`) AS `avg_price_category`
ON `avg_price_category`.`category_id` = `//categories`.`category_id`
WHERE `avg_price_category`.`avg_price in category` > (SELECT AVG(`price`) FROM `//products`);
 
   
 -- 6. Найти название категории и самую дорогую цену продукта в этой категории.
SELECT `category_name`, `max_price_in category` FROM `//categories`
INNER JOIN
(SELECT `category_id`, MAX(`price`) AS `max_price_in category` FROM `//products`
GROUP BY `category_id`) AS `temp_table`
ON `//categories`.`category_id` = `temp_table`.`category_id`;


 -- 7. Найти продукты, чья цена является самой высокой в своей категории.
 
SELECT `product_name` FROM `//products`
INNER JOIN
(SELECT `category_id`, MAX(`price`) AS `max_price_in category` FROM `//products`
GROUP BY `category_id`) AS `temp_table`
ON `//products`.`price` = `temp_table`.`max_price_in category`;
 
 
 -- 8. Найти категории, в которых количество продуктов больше среднего количества продуктов по всем категориям.
 
SELECT `category_name` FROM `//categories`
INNER JOIN
(SELECT `category_id`, COUNT(*) AS `count in category` FROM `//products`
GROUP BY `category_id`) AS `temp_table`
ON `//categories`.`category_id` = `temp_table`.`category_id`
WHERE `count in category` > (SELECT AVG(`count in category`) FROM (SELECT `category_id`, COUNT(*) AS `count in category` FROM `//products` GROUP BY `category_id`) AS `temp_table`);
 
 
 -- 9. Вывести продукты, цена которых выше средней цены всех продуктов в своей категории.
 SELECT `product_name` FROM `//products`
INNER JOIN
(SELECT `category_id`, AVG(`price`) AS `avg_price in category` FROM `//products`
GROUP BY `category_id`) AS `avg_price_category`
ON `//products`.`category_id` = `avg_price_category`.`category_id`
WHERE `price` > `avg_price in category`;

 
 -- 10. Найти категории, где самая низкая цена продукта выше средней цены по всем продуктам.
 
 SELECT `category_name` FROM `//categories`
INNER JOIN
(SELECT `category_id`, MIN(`price`) AS `min_price in category` FROM `//products`
GROUP BY `category_id`) AS `min_price_category`
ON `min_price_category`.`category_id` = `//categories`.`category_id`
WHERE `min_price_category`.`min_price in category` > (SELECT AVG(`price`) FROM `//products`);
 
 
 -- 11. Найти продукты, цена которых ниже минимальной цены в любой категории.
 
SELECT `product_name` FROM `//products`
WHERE `price` < (SELECT MAX(`min_price_category`) FROM (SELECT MIN(`price`) AS `min_price_category` FROM `//products` GROUP BY `category_id`) AS `table_1`);

  
 -- 12. Найти категорию, в которой самое большое количество продуктов.
 
SELECT `category_name` FROM `//categories`
INNER JOIN (SELECT `category_id`, COUNT(*) AS `count in category` FROM `//products` GROUP BY `category_id`) AS `table_1` ON `table_1`.`category_id` = `//categories`.`category_id`
WHERE `count in category` = (SELECT MAX(`count in category`) FROM (SELECT `category_id`, COUNT(*) AS `count in category` FROM `//products` GROUP BY `category_id`) AS `table_1`);
 
 
 -- 13. Найти продукты, которые дешевле самого дешевого продукта в другой категории.
 
 SELECT `product_name` FROM `//products`
WHERE `price` < (SELECT MAX(`min_price_category`) FROM (SELECT MIN(`price`) AS `min_price_category` FROM `//products` GROUP BY `category_id`) AS `table_1`);
 
 
 -- 14. Найти категории, где количество продуктов меньше, чем в категории с минимальным количеством продуктов.
 
  -- некорректный запрос!!!
 
 
 -- 15. Найти продукты, чья цена больше средней цены в категориях с более чем 5 продуктами.
 
 SELECT `product_name` FROM `//products`
 WHERE `price` > (
 	SELECT AVG(`avg_category_price`) FROM (
 		SELECT `category_id`, COUNT(*) AS `count in category`, AVG(`price`) AS `avg_category_price` FROM `//products` 
		 GROUP BY `category_id` 
		 HAVING `count in category` >1) 
		 AS `table_1`);

 
 
 -- 16. Найти категории, в которых максимальная цена продукта больше 200.
 
 SELECT `category_name` FROM `//categories`
 INNER JOIN (SELECT `category_id`, MAX(`price`) AS `max_price_category` FROM `//products` GROUP BY `category_id`) AS `table_1`
 ON `table_1`.`category_id` = `//categories`.`category_id`
 WHERE `max_price_category` > 60;
 
 
 -- 17. Найти продукты, которые дороже всех продуктов в другой категории.
 
SELECT `//products`.`product_name`, `//products`.`price` FROM `//products`
INNER JOIN (
		SELECT `category_id`, MAX(`price`) AS `max_price_other_cat` FROM (
			SELECT `table_1`.`category_id`, `price` FROM `//products`
					INNER JOIN (
						SELECT `category_id`, MAX(`price`) AS `max_price_category` FROM `//products` GROUP BY `category_id`) 
						AS `table_1` 
					ON `//products`.`category_id` <> `table_1`.`category_id`
					) AS `table_2`
		GROUP BY `category_id`)
		AS `table_3`
ON `table_3`.`category_id` = `//products`.`category_id`
WHERE `//products`.`price` > `table_3`.`max_price_other_cat`;

 
 
 -- 18. Найти категории, в которых средняя цена всех продуктов больше 150.
 
 SELECT `category_name` FROM `//categories`
 INNER JOIN (SELECT `category_id`, AVG(`price`) AS `avg_price_category` FROM `//products` GROUP BY `category_id`) AS `table_1`
 ON `table_1`.`category_id` = `//categories`.`category_id`
 WHERE `avg_price_category` > 43;
 
 
 
 -- 19. Найти продукты, чья цена ниже минимальной цены в их категории, умноженной на 2.

SELECT `product_name` FROM `//products`
INNER JOIN
(SELECT `category_id`, (MIN(`price`))*2 AS `min_price in categoryx2` FROM `//products`
GROUP BY `category_id`) AS `min_price_categoryx2`
ON `//products`.`category_id` = `min_price_categoryx2`.`category_id`
WHERE `price` < `min_price_categoryx2`.`min_price in categoryx2`;

 
 
 -- 20. Найти категории, где количество продуктов выше среднего, а средняя цена ниже средней по всем категориям.


SELECT `category_name`  FROM `//categories`
INNER JOIN
	(SELECT `category_id`, COUNT(*) AS `count in category` FROM `//products` GROUP BY `category_id`) AS `count_in_cat`
ON `//categories`.`category_id` = `count_in_cat`.`category_id`
INNER JOIN 
	(SELECT `category_id`, AVG(`price`) AS `avg_price_category` FROM `//products` GROUP BY `category_id`) AS `avg_price`
ON `avg_price`.`category_id` = `//categories`.`category_id`
	WHERE `avg_price`.`avg_price_category` < (SELECT AVG(`price`) FROM `//products`) 
AND `count in category` > (SELECT AVG(`count in category`) FROM (SELECT `category_id`, COUNT(*) AS `count in category` FROM `//products` GROUP BY `category_id`) AS `count_in_cat`);
 
 
 
 
 
 