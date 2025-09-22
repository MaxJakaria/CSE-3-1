CREATE DATABASE IF NOT EXISTS lab_q4_world_db;

USE lab_q4_world_db;

-- Countries
CREATE TABLE Countries (
    country_id INT PRIMARY KEY,
    country_name TEXT,
    region TEXT,
    population BIGINT
);

-- Cities
CREATE TABLE Cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100),
    country_id INT,
    population BIGINT,
    FOREIGN KEY (country_id) REFERENCES Countries (country_id)
);

INSERT INTO
    Countries (
        country_id,
        country_name,
        region,
        population
    )
VALUES (
        1,
        'United States',
        'North America',
        331002651
    ),
    (
        2,
        'United Kingdom',
        'Europe',
        67886011
    ),
    (
        3,
        'Australia',
        'Oceania',
        25687041
    ),
    (
        4,
        'Germany',
        'Europe',
        83783942
    ),
    (
        5,
        'Democratic Republic of Congo',
        'Africa',
        89561403
    ),
    (
        6,
        'Brazil',
        'South America',
        212559417
    );

INSERT INTO
    Cities (
        city_id,
        city_name,
        country_id,
        population
    )
VALUES (1, 'New York', 1, 8419600),
    (2, 'London', 2, 8982000),
    (3, 'Sydney', 3, 5230330),
    (4, 'Berlin', 4, 3769000),
    (5, 'Kinshasa', 5, 14826000),
    (6, 'São Paulo', 6, 12300000);

-- 1
SELECT
    country_name AS Country,
    region AS Region,
    population AS Total_Population
FROM Countries
WHERE
    country_name LIKE '%United%'
    AND (
        region LIKE 'N%'
        OR region LIKE '%ica'
    );

-- 2
SELECT ci.city_name, ci.population AS Total_Population
FROM cities as ci
WHERE
    ci.city_name LIKE '%o%'
    AND ci.population > 5000000;

-- 3
SELECT cn.country_name, ci.city_name, ci.population
FROM countries AS cn
    JOIN cities AS ci ON cn.country_id = ci.country_id
WHERE
    LENGTH(cn.country_name) > 10
    AND ci.city_name LIKE 'S%'
    AND RIGHT(ci.city_name, 1) IN ('a', 'e', 'i', 'o', 'u');
-- 4
SELECT
    cn.country_name AS Country_Name,
    ci.city_name AS Major_City,
    ci.population AS City_Population
FROM countries AS cn
    JOIN cities AS ci ON cn.country_id = ci.country_id