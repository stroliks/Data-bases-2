
 -- 1.1
SELECT * FROM `Movies`
WHERE `release_year` > 2010 AND `rating` > 8.0
ORDER BY `rating` DESC;
 
  -- 1.2
SELECT DISTINCT `genre` FROM `Movies`
ORDER BY `genre`;
  
-- 1.3
SELECT * FROM `Movies`
ORDER BY `rating` DESC
LIMIT 10
OFFSET 5;
   
-- 1.4
SELECT * FROM `Actors`
WHERE `birth_year` < 1980
ORDER BY `birth_year` ASC;
    
-- 1.5
SELECT * FROM `Movies`
WHERE `genre`= 'abre'
ORDER BY `title` ASC;

-- 1.6
SELECT DISTINCT `nationality` FROM `Actors`
ORDER BY `nationality` DESC;
   
-- 1.7
SELECT `title`, `rating` FROM `Movies`
WHERE `rating` <= 5.0
ORDER BY `rating` ASC;
    
-- 1.8
SELECT * FROM `Movies`
ORDER BY `release_year` DESC
LIMIT 5;
 
-- 1.9
SELECT * FROM `Actors`
ORDER BY `birth_year` ASC
LIMIT 3;

-- 2.1

SELECT `genre`, AVG(`rating`) FROM `Movies`
GROUP BY `genre`
ORDER BY `rating` DESC;

 -- 2.2
SELECT `release_year`, COUNT(*) FROM `Movies`
GROUP BY `release_year`
ORDER BY `release_year` ASC;
 
  -- 2.3
SELECT `genre` FROM `Movies`
GROUP BY `genre`
HAVING COUNT(*) > 3
ORDER BY COUNT(*) ASC;

 -- 2.4
SELECT `genre` FROM `Movies`
GROUP BY `genre`
HAVING SUM(`rating`) > 50
ORDER BY SUM(`rating`) ASC;

 -- 2.5
SELECT `release_year` FROM `Movies`
WHERE `rating` > 7.0
GROUP BY `release_year`
HAVING COUNT(*) > 5
ORDER BY COUNT(*) ASC;