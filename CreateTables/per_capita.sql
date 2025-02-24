CREATE TABLE per_capita (
    country_code VARCHAR(50),
    year INT,
    gdp_per_year DECIMAL(18,2),
    PRIMARY KEY (country_code, year),  -- Composite PK (Country & Year)
    FOREIGN KEY (country_code) REFERENCES countries(country_code) ON DELETE CASCADE
);
