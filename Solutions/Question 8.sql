--Find the country with the highest average gdp_per_capita for each continent for all years. rank	continent_name	country_code	country_name	avg_gdp_per_capita


with rankgenerator as(
    SELECT 
    con.continent_name, 
    cs.country_code, 
    cs.country_name, 
    AVG(pc.gdp_per_year) as avg_gdp_per_capita,
    RANK() OVER (PARTITION BY con.continent_name ORDER BY AVG(pc.gdp_per_year) DESC) AS rank
FROM per_capita pc
JOIN countries cs on pc.country_code = cs.country_code
JOIN continent_map cm on pc.country_code = cm.country_code
JOIN continents con on cm.continent_code = con.continent_code
GROUP BY cs.country_name,cs.country_code, con.continent_name
)
select * from rankgenerator
where rank = 1