WITH year12 AS (
    -- Find countries with NULL gdp_per_year in 2012
    SELECT cs.country_code
    FROM per_capita pc
    JOIN countries cs ON pc.country_code = cs.country_code
    WHERE pc.year = 2012 
      AND pc.gdp_per_year IS NULL
),
before12 AS (
    -- Get sum of gdp_per_year and count of countries before 2012, but only for countries in year12
    SELECT 
        pc.year,
        COUNT(DISTINCT pc.country_code) AS country_count,
        SUM(pc.gdp_per_year) AS total
    FROM per_capita pc
    JOIN year12 y12 ON pc.country_code = y12.country_code  -- Now using year12 to filter
    WHERE pc.gdp_per_year IS NOT NULL 
      AND pc.year < 2012
    GROUP BY pc.year
)

-- Get final result
SELECT * FROM before12
ORDER BY year;
