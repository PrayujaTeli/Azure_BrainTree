-- Display any values where country_code is null as country_code = "FOO" and make this row appear first in the list, even though it should alphabetically sort to the middle. Provide the results of this query as your answer.
SELECT * 
FROM continent_map
ORDER BY 
CASE 
    WHEN country_code IS NULL THEN 'FOO' 
    ELSE country_code 
  END;