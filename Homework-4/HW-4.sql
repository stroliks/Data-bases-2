USE `seschool_07`;

CREATE TABLE `*Students`(
		`id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		`first_name` VARCHAR(50),
		`last_name` VARCHAR(50),
		`enrollment_year` INT UNSIGNED
	);
		

CREATE TABLE `*Courses`(
		`id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		`course_name` VARCHAR(100),
		`instructor` VARCHAR(50),
		`credit_hours` INT UNSIGNED
	);
	
CREATE TABLE `*Enrollments`(
		`enrollment_id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		`student_id` BIGINT(8) UNSIGNED,
		`course_id` BIGINT(8) UNSIGNED,
		`grade` VARCHAR(1),
		FOREIGN KEY (`student_id`) REFERENCES `*Students`(`id`),
		FOREIGN KEY (`course_id`) REFERENCES `*Courses`(`id`)
	);
	
	
	
	
	-- Заполнение таблицы Students
INSERT INTO `*Students` (id, first_name, last_name, enrollment_year) VALUES
(1, 'Alice', 'Smith', 2022),
(2, 'Bob', 'Johnson', 2021),
(3, 'Charlie', 'Williams', 2020),
(4, 'David', 'Brown', 2022),
(5, 'Eva', 'Davis', 2023);

-- Заполнение таблицы Courses
INSERT INTO `*Courses` (id, course_name, instructor, credit_hours) VALUES
(101, 'Mathematics', 'Dr. Smith', 3),
(102, 'Physics', 'Dr. Brown', 4),
(103, 'Chemistry', 'Dr. White', 3),
(104, 'Biology', 'Dr. Green', 4),
(105, 'History', 'Dr. Black', 2);

-- Заполнение таблицы Enrollments
INSERT INTO `*Enrollments` (enrollment_id, student_id, course_id, grade) VALUES
(1, 1, 101, 'A'),
(2, 1, 102, 'B'),
(3, 2, 101, 'C'),
(4, 2, 103, 'B'),
(5, 3, 104, 'A'),
(6, 3, 105, 'B'),
(7, 4, 101, 'A'),
(8, 4, 103, 'A'),
(9, 5, 102, 'B'),
(10, 5, 104, 'C');



-- 1.1.
SELECT `first_name`, `last_name` FROM `*Students`
WHERE `enrollment_year` = 2022;

-- 1.2.

SELECT `course_name`, `credit_hours` FROM `*Courses`
WHERE `instructor` = 'Dr. Smith';

-- 1.3.
SELECT `first_name`, `last_name` FROM `*Students`
INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
INNER JOIN `*Courses` ON `*Courses`.id = `*Enrollments`.course_id
WHERE `course_name` = 'Mathematics';

 -- 1.4.
SELECT COUNT(*) FROM `*Students`
INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
INNER JOIN `*Courses` ON `*Courses`.id = `*Enrollments`.course_id
WHERE `course_name` = 'Physics';

 -- 1.5.
SELECT `course_name` FROM `*Courses`
INNER JOIN `*Enrollments` ON `*Courses`.id = `*Enrollments`.course_id
INNER JOIN `*Students` ON `*Enrollments`.student_id = `*Students`.id
WHERE `last_name` = 'Johnson';

-- 1.6.
SELECT `first_name`, `course_name`, `grade` FROM `*Students`
INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
INNER JOIN `*Courses` ON `*Courses`.id = `*Enrollments`.course_id;

-- 1.7.
SELECT  `course_name`, `instructor` FROM `*Courses`
WHERE `credit_hours` > 3;


-- 2.1.
SELECT `first_name` FROM `*Students`
INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
INNER JOIN `*Courses` ON `*Courses`.id = `*Enrollments`.course_id
WHERE `instructor` = 'Dr. Brown';


-- 2.5.
SELECT `first_name`, `course_name`, `grade` FROM `*Students`
INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
INNER JOIN `*Courses` ON `*Courses`.id = `*Enrollments`.course_id
WHERE `*Courses`.credit_hours >= 4;


-- 2.8.
SELECT `first_name`, `course_name`, `grade` FROM `*Students`
INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
INNER JOIN `*Courses` ON `*Courses`.id = `*Enrollments`.course_id
WHERE `*Enrollments`.grade = 'A';

-- 2.11.
SELECT  `course_name`, COUNT(*) FROM `*Courses`
INNER JOIN `*Enrollments` ON `*Courses`.id = `*Enrollments`.course_id
INNER JOIN `*Students` ON `*Enrollments`.student_id = `*Students`.id
GROUP BY `course_name`
HAVING COUNT(*) >2;

-- 2.12

SELECT `first_name`, COUNT(*) FROM `*Students`
INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
INNER JOIN `*Courses` ON `*Courses`.id = `*Enrollments`.course_id
GROUP BY `first_name`
ORDER BY COUNT(*) DESC 
LIMIT 1;


-- 2.14.
SELECT `first_name` FROM `*Students`
	WHERE `first_name` 
	NOT IN (
		SELECT `first_name` FROM `*Students` INNER JOIN `*Enrollments` ON `*Enrollments`.student_id = `*Students`.id
		WHERE `*Enrollments`.grade = 'C');













