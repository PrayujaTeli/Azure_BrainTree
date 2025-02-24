--For all countries that have multiple rows in the continent_map table, delete all multiple records leaving only the 1 record per country. 
-- The record that you keep should be the first one when sorted by the continent_code alphabetically ascending. 

WITH Rankedcountry AS (
    SELECT 
    cm.country_code,
    cm.continent_code,
    cs.country_name,
    ROW_NUMBER() OVER(PARTITION BY cm.country_code ORDER BY cm.continent_code) as rn
FROM continent_map cm
JOIN countries cs on cm.country_code = cs.country_code
)
DELETE FROM continent_map
WHERE country_code IN (
    SELECT country_code
    FROM Rankedcountry
    WHERE rn > 1
);
