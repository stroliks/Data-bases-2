
-- 1
SELECT `Customers`.`name`, `Orders`.`order_date` FROM `Customers`
	INNER JOIN `Orders` ON `Orders`.`customer_id` = `Customers`.`id`
	ORDER BY `Customers`.`name` ASC, `Orders`.`order_date` ASC;
	
 -- 2.
 
 SELECT `Customers`.`name`, `Dishes`.`name` FROM `Customers`
 	INNER JOIN `Orders` ON `Orders`.`customer_id` = `Customers`.`id`
 	INNER JOIN `Order_Dishes` ON `Order_Dishes`.`order_id` = `Orders`.`id`
 	INNER JOIN `Dishes` ON `Dishes`.`id` = `Order_Dishes`.`dish_id`
 	ORDER BY `Customers`.`name` ASC, `Dishes`.`name` ASC;
 	
 -- 3. 
 SELECT `Customers`.`name`, SUM(`Dishes`.`price`*`Order_Dishes`.`quanity`) AS `sum_order` FROM `Customers`
 	INNER JOIN `Orders` ON `Orders`.`customer_id` = `Customers`.`id`
 	INNER JOIN `Order_Dishes` ON `Order_Dishes`.`order_id` = `Orders`.`id`
 	INNER JOIN `Dishes` ON `Dishes`.`id` = `Order_Dishes`.`dish_id`
 	GROUP BY `Customers`.`id`
 	ORDER BY `sum_order` DESC;
 	
-- 4.
 SELECT `Customers`.`name`, SUM(`Order_Dishes`.`quanity`) AS `count_dishes` FROM `Customers`
 	INNER JOIN `Orders` ON `Orders`.`customer_id` = `Customers`.`id`
 	INNER JOIN `Order_Dishes` ON `Order_Dishes`.`order_id` = `Orders`.`id`
 	GROUP BY `Customers`.`id`
 	ORDER BY `count_dishes` DESC;
 	
 -- 5. 
  SELECT `Dishes`.`name`, COUNT(*) FROM `Order_Dishes`
 	INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
 	ORDER BY COUNT(*) DESC;
 	
-- 6

 SELECT `Customers`.`name` FROM `Customers`
 	INNER JOIN `Orders` ON `Orders`.`customer_id` = `Customers`.`id`
 	INNER JOIN `Order_Dishes` ON `Order_Dishes`.`order_id` = `Orders`.`id`
 	INNER JOIN `Dishes` ON `Dishes`.`id` = `Order_Dishes`.`dish_id`
 	WHERE `Dishes`.`price` > 50;
 	
-- 7
SELECT `Customers`.`name`, `Orders`.`order_date`, SUM(`Order_Dishes`.`quanity`) FROM `Customers`
	INNER JOIN `Orders` ON `Orders`.`customer_id` = `Customers`.`id`
	INNER JOIN `Order_Dishes` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	ORDER BY `Customers`.`name` ASC, `Orders`.`order_date` ASC;
	
-- 8 
SELECT `Dishes`.`category`, COUNT(*) FROM `Order_Dishes`
	INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	GROUP BY `Dishes`.`category`
	ORDER BY COUNT(*) DESC;