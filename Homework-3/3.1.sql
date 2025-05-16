USE `seschool_07`;

CREATE TABLE `ZootopiaCharacters`(
`CharacterID` BIGINT(5) UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,  
`CharacterName` VARCHAR(75) UNIQUE NOT NULL,
`Species` VARCHAR(10),
`Role` VARCHAR(75) NOT NULL DEFAULT 'Второстепенный персонаж',
`Occupation` VARCHAR(75),
`Catchphrase` VARCHAR(255)
);

INSERT INTO ZootopiaCharacters (`CharacterName`, `Species`, `Role`, `Occupation`, `Catchphrase`) VALUES 
	('Judy Hopps', 'Кролик', 'Главный герой', 'Полицейский', '"Сначала попробуй!"'),
	('Nick Wilde', 'Лиса', 'Главный герой', 'Полицейский', '"Скользкий как лиса!"'),
	('Chief Bogo', 'Буйвол', 'Второстепенный персонаж', 'Шеф полиции', NULL),
	('Bellwether', 'Овца', 'Антагонист', 'Мэр', NULL),
	('Flash', 'Ленивец', 'Второстепенный персонаж', 'Сотрудник DMV', NULL),
	('Mr. Big', 'Полярный медведь', 'Второстепенный персонаж', 'Босс мафии', '"Твое слово — мое слово"'),
	('Finnick', 'Лиса', 'Второстепенный персонаж', 'Мошенник', NULL),
	('Clawhauser', 'Гепард', 'Второстепенный персонаж', 'Сотрудник полиции', '"Добро пожаловать в Зверополис!"'),
	('Duke Weaselton', 'Ласка', 'Второстепенный персонаж', 'Контрабандист', NULL),
	('Yax', 'Як', 'Второстепенный персонаж', 'Управляющий спа-салоном', NULL)
;

-- 2.1

SELECT `CharacterName`, `Occupation` FROM `ZootopiaCharacters`;

-- 2.2.

SELECT `CharacterName` FROM `ZootopiaCharacters`
	WHERE `Species` = 'Лиса';
	
	
-- 2.3.

SELECT `CharacterName` FROM `ZootopiaCharacters`
	WHERE `Species` = 'Кролик' OR `Species` = 'Буйвол';
	
-- 2.4.

SELECT * FROM `ZootopiaCharacters`
	WHERE `Occupation` IS NOT NULL
	ORDER BY `CharacterName` ASC
	LIMIT 3;
	

