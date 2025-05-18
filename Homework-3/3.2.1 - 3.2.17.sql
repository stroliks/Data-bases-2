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
	
-- 2.5.
SELECT * FROM `ZootopiaCharacters`
GROUP BY `Occupation`
HAVING (COUNT(*)) = 1
ORDER BY `Role` DESC; 
	
	-- 2.6.
SELECT * FROM `ZootopiaCharacters`
WHERE `CharacterName` LIKE '%a%'
ORDER BY `CharacterName` DESC; 

 -- 2.7.
 SELECT DISTINCT `Role` FROM `ZootopiaCharacters`
 ORDER BY `Role` DESC;

-- 2.8.
SELECT * FROM `ZootopiaCharacters`
WHERE `Catchphrase` IS NOT NULL
ORDER BY `CharacterName` ASC
LIMIT 5;

-- 2.9.
SELECT * FROM `ZootopiaCharacters`
WHERE `Role` = 'Второстепенный персонаж'
ORDER BY `CharacterName` ASC
LIMIT 1
OFFSET 2;

-- 2.10.
SELECT COUNT(*) FROM `ZootopiaCharacters`;

-- 2.11.
SELECT `Occupation`, COUNT(*) FROM `ZootopiaCharacters`
GROUP BY `Occupation`;

-- 2.12.
SELECT `Occupation`, COUNT(*) FROM `ZootopiaCharacters`
GROUP BY `Occupation`
ORDER BY COUNT(*) DESC;

-- 2.13.
SELECT `Species`, COUNT(*) FROM `ZootopiaCharacters`
WHERE `Role` = 'Главный герой'
GROUP BY `Species`;

-- 2.14.
SELECT `CharacterName`, `Occupation` FROM `ZootopiaCharacters`
GROUP BY `Occupation`
HAVING COUNT(*) = 1;

-- 2.15.
SELECT * FROM `ZootopiaCharacters`
WHERE `Occupation` IS NOT NULL
ORDER BY `CharacterName` ASC
LIMIT 5
OFFSET 5;

-- 2.16.
SELECT `Occupation`, COUNT(*) FROM `ZootopiaCharacters`
GROUP BY `Occupation`
HAVING COUNT(*)>1
ORDER BY `Occupation` ASC;

-- 2.17.
SELECT `Species`, COUNT(*) FROM `ZootopiaCharacters`
WHERE `Catchphrase` IS NULL
GROUP BY `Species`
ORDER BY COUNT(*) DESC
LIMIT 3;