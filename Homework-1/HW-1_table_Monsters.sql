USE `seschool_07`;

CREATE TABLE `MonstersIncEmployees` (
		`EmployeeID` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
		`MonsterName` VARCHAR(75) NOT NULL,
		`Type` VARCHAR(100) NOT NULL DEFAULT 'Монстр',
		`Department` VARCHAR(100) NOT NULL DEFAULT 'Нулевой отдел',
		`MonsterColor` VARCHAR(50)
);

ALTER TABLE `MonstersIncEmployees`
DROP COLUMN `MonsterColor`;

ALTER TABLE `MonstersIncEmployees`
ADD COLUMN `ScareLevel` INT NOT NULL CHECK (ScareLevel >= 0 AND ScareLevel <= 10);


INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Mike Wazowski', 'Пугало', 'Отдел пуганий', 7);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('James P. Sullivan', 'Пугало', 'Отдел пуганий', 10);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Boggs', 'Пугало', 'Отдел пуганий', 8);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Randall', 'Пугало', 'Отдел пуганий', 2);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Mae', 'Администратор', 'Отдел поддержки', 3);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Roz', 'Администратор', 'Отдел документации', 2);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('George', 'Администратор', 'Управление', 4);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Waternoose', 'Помощник', 'Отдел пуганий', 6);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Needleman', 'Помощник', 'Отдел документации', 4);
INSERT INTO `MonstersIncEmployees`(`MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES ('Smitty', 'Помощник', 'Отдел поддержки', 5);






 