--Alphabetically list all of the country codes in the continent_map table that appear more than once.

SELECT country_code
FROM continent_map
WHERE country_code IS NOT NULL
GROUP BY country_code 
HAVING count(country_code) > 1 
ORDER BY country_code

