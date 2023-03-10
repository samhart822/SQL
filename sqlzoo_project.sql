/* This is SQL I wrote to answer practice problems and quizzes from SQLZoo.net */

/* Show the population of Germany. */
SELECT population FROM world
  WHERE name = 'Germany';
  
/* Show the name and the population for 'Sweden', 'Norway' and 'Denmark'. */
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
  
/* Show the country and the area for countries with an area between 200,000 and 250,000. */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

/* Write the SQL command to show the name, continent and population of all countries. */
SELECT name, continent, population FROM world;

/* Show the name for the countries that have a population of at least 200 million. */
SELECT name FROM world
WHERE population >= 200000000

/* Give the name and the per capita GDP for those countries with a population of at least 200 million. */
SELECT name, gdp / population
FROM world
WHERE population >= 200000000;

/* Show the name and population in millions for the countries of the continent 'South America'. */
SELECT name, population / 1000000
FROM world
WHERE continent = 'South America';

/* Show the name and population for France, Germany, Italy */
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

/* Show the countries which have a name that includes the word 'United' */
SELECT name
FROM world
WHERE name LIKE '%United%';

/* A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. Show the countries that are big by area or big by population. Show name, population and area. */
SELECT name, population, area
FROM world
WHERE area > 3000000
OR population > 250000000;

/* Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded. */
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population <= 250000000)
OR (area <= 3000000 AND population > 250000000)

/* Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
For South America show population in millions and GDP in billions both to 2 decimal places. */
SELECT name, ROUND(population / 1000000 , 2), ROUND(gdp / 1000000000 , 2)
FROM world
WHERE continent = 'South America';

/* Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000. */
SELECT name, ROUND(gdp / population , -3)
FROM world
WHERE gdp >= 1000000000000;
