CREATE TABLE continent_map (
    country_code VARCHAR(10),
    continent_code VARCHAR(10),
    PRIMARY KEY (country_code),  -- Each country belongs to only one continent
    FOREIGN KEY (country_code) REFERENCES countries(country_code) ON DELETE CASCADE,
    FOREIGN KEY (continent_code) REFERENCES continents(continent_code) ON DELETE CASCADE
);
