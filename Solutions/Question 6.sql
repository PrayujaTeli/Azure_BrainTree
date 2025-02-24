--What is the count of countries and sum of their related gdp_per_capita values for the year 2007 
--where the string 'an' (case insensitive) appears anywhere in the country name?
--Repeat question a, but this time make the query case sensitive.

SELECT count(cs.country_name) as Countries, SUM(gdp_per_year) as 'GDP Across Countries'
FROM per_capita pc
JOIN countries cs on pc.country_code = cs.country_code
where year = 2007 and cs.country_name like  '%an%'

SELECT count(cs.country_name) as Countries, SUM(gdp_per_year) as 'GDP Across Countries'
FROM per_capita pc
JOIN countries cs on pc.country_code = cs.country_code
where year = 2007 and cs.country_name COLLATE Latin1_General_CS_AS_KS_WS like  '%an%'
