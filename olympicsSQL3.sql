-- Omolere Oluwatimilehin Timothy 
-- Teesside University 
-- Database name: Olympics 

USE olympics 
SELECT *
FROM sport

USE olympics 
SELECT DISTINCT city_name
FROM city 

USE olympics 
SELECT city_name AS city_location
FROM city

USE olympics 
SELECT games_year, season
FROM games AS games_New

USE olympics 
SELECT competitor_id, medal_id,
CASE WHEN medal_id > 2 THEN 'Yes'
ELSE 'No'
END AS Required_info
FROM competitor_event

USE olympics 
SELECT A.sport_id, A.event_name, B.city_name
FROM event AS A
JOIN city AS B
ON A.id = B.id

USE olympics 
SELECT A.sport_id, A.event_name, B.city_name
FROM event AS A
INNER JOIN city AS B
ON A.id = B.id

USE olympics 
SELECT A.full_name, A.gender, B. region_name
FROM person AS A
FULL OUTER JOIN noc_region AS B
ON A.id = B.id

USE olympics 
SELECT A.games_year, B.age, A.season
FROM games AS A
CROSS JOIN games_competitor AS B

USE olympics 
SELECT *
FROM city
ORDER BY city_name ASC

USE olympics 
SELECT *
FROM competitor_event
WHERE medal_id > 3
SELECT TOP 10 sport_id, event_name
FROM event

USE olympics 
SELECT *
FROM city
ORDER BY city_name
OFFSET 2 ROWS
FETCH Next 10 ROWS ONLY


USE olympics 
SELECT
   sport_id,
   event_name, 
   COALESCE(event_name, 'Unknown') AS event_name_coalesced
FROM event
ORDER BY sport_id

USE olympics 
SELECT competitor_id, medal_id, 
CONVERT(decimal, medal_id) AS CityDetails
FROM competitor_event;

USE olympics 
SELECT id, city_name, 
CONCAT(CONVERT(CHAR, id),'-', city_name) AS CityDetails
FROM city;

USE olympics 
SELECT CAST (games_year AS datetime) AS new_games_year
FROM games
USE olympics

INSERT INTO medal (id, medal_name)
VALUES (5, 'Others')
UPDATE medal
SET id = 4, medal_name= 'Burgundy'
WHERE id = 4;
DELETE FROM medal
WHERE medal_name ='Others';
USE olympics

-- using IDENTITY to automatically generate competitor _id

CREATE TABLE competitor_details (
    competitor_id INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR (50) NOT NULL,
    Last_Name VARCHAR (50),
    Age int
);

INSERT INTO competitor_details(First_Name,Last_Name, Age)
VALUES ('Mike','Townson', 26),
       ('Susan', 'Gill', 24), 
	   ('Mark', 'Thompson', 22)


USE olympics 
SELECT * FROM competitor_details
SELECT id, games_name,
SUBSTRING(games_name, 1, 4) AS ExtractString
FROM games;
-- CONVERT AND CAST ARE CONVERSION FUNCTIONS

USE olympics 
SELECT CAST(medal_id AS decimal) AS new_medal_name
FROM competitor_event


USE olympics 
SELECT id, city_name,CONVERT(CHAR,id) AS new_city_id
FROM city;

USE olympics 
SELECT games_year, season, IIF(games_year >2000, 'Yes', 'No') AS Required_info
FROM games;

USE olympics 
SELECT noc,region_name
FROM noc_region
WHERE noc IS NULL
