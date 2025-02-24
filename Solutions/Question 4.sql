--List the countries ranked 10-12 in each continent by the percent of year-over-year growth descending from 2011 to 2012.

--The percent of growth should be calculated as: ((2012 gdp - 2011 gdp) / 2011 gdp). The list should include the columns: rank , continent_name, country_code, country_name, growth_percent
WITH GDP_Growth AS (
    SELECT 
        cs.country_code, 
        cs.country_name, 
        cons.continent_name, 
        (pc12.gdp_per_year - pc11.gdp_per_year) / pc11.gdp_per_year AS growth_percent
    FROM countries cs
    JOIN per_capita pc11 ON cs.country_code = pc11.country_code AND pc11.year = 2011
    JOIN per_capita pc12 ON cs.country_code = pc12.country_code AND pc12.year = 2012
    JOIN continent_map cm ON cs.country_code = cm.country_code
    JOIN continents cons ON cm.continent_code = cons.continent_code
)
, Ranked AS (
    SELECT 
        continent_name, 
        country_code, 
        country_name, 
        growth_percent, 
        ROW_NUMBER() OVER (PARTITION BY continent_name ORDER BY growth_percent DESC) AS rank
    FROM GDP_Growth
)
SELECT rank, continent_name, country_code, country_name, growth_percent
FROM Ranked
WHERE rank BETWEEN 10 AND 12
ORDER BY continent_name, rank;
