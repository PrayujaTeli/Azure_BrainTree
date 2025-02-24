--a. create a single list of all per_capita records for year 2009 that includes columns:
--continent_name
--country_code
--country_name
--gdp_per_year
--b. order this list by:
--continent_name ascending
--characters 2 through 4 (inclusive) of the country_name descending
--c. create a running total of gdp_per_capita by continent_name
-- d. return only the first record from the ordered list for which each continent's running total of gdp_per_capita meets or exceeds $70,000.00 with the following columns:
--continent_name, country_code, country_name, gdp_per_year, running_total
WITH main AS (
    SELECT 
        con.continent_name, 
        cs.country_code,
        cs.country_name, 
        pc.gdp_per_year, 
        SUM(pc.gdp_per_year) OVER (PARTITION BY con.continent_name ORDER BY con.continent_name, SUBSTRING(cs.country_name, 2, 3) DESC) AS running_total
    FROM per_capita pc
    JOIN countries cs ON pc.country_code = cs.country_code
    JOIN continent_map cm ON pc.country_code = cm.country_code
    JOIN continents con ON cm.continent_code = con.continent_code
    WHERE pc.year = 2009
)
SELECT continent_name, country_code, country_name, gdp_per_year, running_total
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY continent_name ORDER BY running_total) AS rn
    FROM main
    WHERE running_total >= 70000
) AS t
WHERE rn = 1
ORDER BY continent_name, SUBSTRING(country_name, 2, 3) DESC;
