--For the year 2012, create a 3 column, 1 row report showing the percent share of gdp_per_capita for the following regions:

--(i) Asia, (ii) Europe, (iii) the Rest of the World. Your result should look something like

--Asia	Europe	Rest of World
--25.0%	25.0%	50.0%

WITH gdp_totals AS (
    SELECT 
        SUM(pc.gdp_per_year) AS total_gdp
    FROM per_capita pc
    WHERE pc.year = 2012
),
gdp_by_region AS (
    SELECT 
        CASE 
            WHEN con.continent_name = 'Asia' THEN 'Asia'
            WHEN con.continent_name = 'Europe' THEN 'Europe'
            ELSE 'Rest of World'
        END AS region,
        SUM(pc.gdp_per_year) AS region_gdp
    FROM per_capita pc
    JOIN countries cs ON pc.country_code = cs.country_code
    JOIN continent_map cm ON pc.country_code = cm.country_code 
    JOIN continents con ON cm.continent_code = con.continent_code
    WHERE pc.year = 2012
    GROUP BY 
        CASE 
            WHEN con.continent_name = 'Asia' THEN 'Asia'
            WHEN con.continent_name = 'Europe' THEN 'Europe'
            ELSE 'Rest of World'
        END
)
SELECT 
    ROUND(100 * SUM(CASE WHEN region = 'Asia' THEN region_gdp ELSE 0 END) / (SELECT total_gdp FROM gdp_totals), 2) AS Asia,
    ROUND(100 * SUM(CASE WHEN region = 'Europe' THEN region_gdp ELSE 0 END) / (SELECT total_gdp FROM gdp_totals), 2) AS Europe,
    ROUND(100 * SUM(CASE WHEN region = 'Rest of World' THEN region_gdp ELSE 0 END) / (SELECT total_gdp FROM gdp_totals), 2) AS Rest_of_World
FROM gdp_by_region;
