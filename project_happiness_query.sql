use project_happiness;
 select * from happiness;
 select * from population;

--  add column called incr_percentage
select *, ((Population_2024*100/nullif(Population_2014, 0))-100) as Increase
from population
order by country;

-- 1st hypothesis: Correlation of Happiness Index with Pop increase
SELECT happiness.`country name`, happiness.`ladder score`, 
       ((Population_2024 * 100.0 / NULLIF(Population_2014, 0)) - 100) AS Increase
FROM happiness
INNER JOIN population ON happiness.`country name` = population.Country
ORDER BY Increase DESC;

-- Safe as table
create view happiness_increase_population as (
SELECT happiness.`country name`, happiness.`ladder score`, 
       ((Population_2024 * 100.0 / NULLIF(Population_2014, 0)) - 100) AS Increase
FROM happiness
INNER JOIN population ON happiness.`country name` = population.Country
ORDER BY Increase DESC);

-- Commonwealth of Independent States = former RSSR
select distinct `regional indicator` from happiness group by `regional indicator`;
SELECT `country name`, 
       `regional indicator`, 
       CASE 
           WHEN `regional indicator` = 'Commonwealth of Independent States' THEN TRUE 
           ELSE FALSE 
       END AS result
FROM happiness 
GROUP BY `country name`, `regional indicator`;

-- Happiness Index of European Countries
SELECT happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator`,
    CASE 
        WHEN happiness.`regional indicator` LIKE '%Europe%' THEN TRUE ELSE FALSE 
    END AS european_happiness
FROM happiness GROUP BY happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator` HAVING european_happiness = 1;

-- create view
create view european_happiness as (
SELECT happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator`,
    CASE 
        WHEN happiness.`regional indicator` LIKE '%Europe%' THEN TRUE ELSE FALSE 
    END AS european_happiness
FROM happiness GROUP BY happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator` HAVING european_happiness = 1);

-- Happiness Index of Middle East & African Countries
SELECT happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator`,
    CASE 
        WHEN happiness.`regional indicator` LIKE '%Africa%' THEN TRUE ELSE FALSE 
    END AS african_happiness
FROM happiness GROUP BY happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator` HAVING african_happiness = 1;

-- create view
create view african_happiness as (
SELECT happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator`,
    CASE 
        WHEN happiness.`regional indicator` LIKE '%Africa%' THEN TRUE ELSE FALSE 
    END AS african_happiness
FROM happiness GROUP BY happiness.`country name`, happiness.`ladder score`, happiness.`regional indicator` HAVING african_happiness = 1);