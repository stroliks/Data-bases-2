
CREATE TABLE `students_table` (
		`Id-student` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		`LastName` VARCHAR(50) NOT NULL,
		`male` VARCHAR(2) NOT NULL,
		`DateOfBirth` DATE NOT NULL,
		`SNILS` VARCHAR(50) NOT NULL UNIQUE,
		`level` TINYINT NOT NULL DEFAULT '1',
		`Group` VARCHAR(50) NOT NULL,
		`av_ball` FLOAT NOT NULL,
		`Hobby` VARCHAR(50)
);



INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Горбунова Е.А', 'ж', '1993-07-21', '128-389-457 23', 3, 'АУС-36', 86.3, 'Плавание');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Ильин Л.И.', 'м', '1993-12-25', '279-237-417 25', 3, 'АУС-35', 98.1, 'Чтение');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Борисенко С.Д.', 'м', '1994-11-01', '872-954-736 94', 2, 'АВМ-41', 92.4, 'Шахматы');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Макаров С.С.', 'м', '1995-05-23', '864-278-354 11', 1, 'ЭОП-118', 82.0, 'Альпинизм');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Курилин Д.В.', 'м', '1992-04-16', '711-257-696 85', 3, 'АУС-36', 63.7, 'Плавание');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Иноземцева Д.Д.', 'ж', '1993-08-12', '112-598-478 23', 3, 'АУС-36', 91.8, 'Дайвинг');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Шипунов Р.Е.', 'м', '1995-03-04', '996-478-258 75', 1, 'ЭОП-238', 75.4,'-');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Скородумов Д.Б.', 'м', '1994-01-14', '359-489-269 66', 1, 'ЭОП-118', 72.6, 'Бильярд');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Пикулина С.А.', 'ж', '1995-03-02', '234-217-598 89', 1, 'ЭОП-238', 86.4, 'Шахматы');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Сафронова М.Д.', 'ж', '1993-08-19', '887-555-124 17', 3, 'АУС-36', 90.1, 'Плавание');
INSERT INTO `students_table`(`LastName`, `male`, `DateOfBirth`, `SNILS`, `level`, `Group`, `av_ball`, `Hobby`) VALUES ('Ковшова Э.А.', 'ж', '1995-09-26', '469-489-557 12', 1, 'ЭОП-238', 65.8, 'Бильярд');




