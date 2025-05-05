
CREATE TABLE `Employees` (
		`EmployeeID` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
		`FirstName` VARCHAR(50) NOT NULL,
		`LastName` VARCHAR(50) NOT NULL,
		`DateOfBirth` DATE NOT NULL,
		`HireDate` DATE NOT NULL,
		`MiddleName` VARCHAR(50),
		`Salary` FLOAT
);


ALTER TABLE `Employees`
DROP COLUMN `MiddleName`;

ALTER TABLE `Employees`
ADD COLUMN `Position` VARCHAR(100) NOT NULL;

INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Иван', 'Иванов', '1980-01-15', '2010-06-01', 'Менеджер', 75000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Анна', 'Петрова', '1985-07-23', '2012-08-15', 'Инженер', 68000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Михаил', 'Смирнов', '1990-03-12', '2015-01-30', 'Программист', 72000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Елена', 'Сидорова', '1992-05-14', '2016-09-21', 'Аналитик', 70000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Алексей', 'Кузнецов', '1975-11-02', '2005-10-10', 'Руководитель отдела', 90000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Ольга', 'Васильева', '1988-04-22', '2014-03-05', 'Маркетолог', 65000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Дмитрий', 'Попов', '1993-08-19', '2017-11-11', 'Программист', 71000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Мария', 'Козлова', '1983-02-10', '2010-04-07', 'HR-менеджер', 66000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Сергей', 'Лебедев', '1979-12-01', '2008-07-01', 'Менеджер проектов', 80000.00);
INSERT INTO `Employees`(`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES ('Наталья', 'Морозова', '1986-09-09', '2013-12-18', 'Дизайнер', 69000.00);


