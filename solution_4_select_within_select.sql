/*
               database ( world )
               
name	       continent	  area	     population	   gdp
Afghanistan	 Asia	        652230	   25500100	     20343000000
Albania	     Europe	      28748	     2831741	     12960000000
Algeria	     Africa	      2381741	   37100000	     188681000000
Andorra	     Europe	      468	       78115	       3712000000
Angola	     Africa	      1246700  	 20609294	     100990000000

*/


/* 1 -> List each country name where the population is larger than that of 'Russia'.  */
SELECT name FROM world
WHERE population > (
         SELECT max(population) FROM world 
             WHERE name='Russia' 
         )
         
         
/* 2 -> Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. */
SELECT name FROM world
WHERE continent='Europe' AND 
        gdp/population > 
      (
        SELECT gdp/population FROM world
        WHERE name='United Kingdom'
      )
ORDER BY name


/* 3 -> List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. */
SELECT name, continent FROM world
WHERE continent IN (
    SELECT continent FROM world
    WHERE name IN('Argentina','Australia')
)
ORDER BY name


/* 4 -> Which country has a population that is more than Canada but less than Poland? Show the name and the population. */
SELECT name,population FROM world
WHERE population > (SELECT population FROM world WHERE name='Canada') AND
      population < (SELECT population FROM world WHERE name='Poland')


/* 5 -> Germany (population 80 million) has the largest population of the countries in Europe. 
Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. 
Show the population as a percentage of the population of Germany.
The format should be Name, Percentage for example: */
SELECT name, concat(round((population/(SELECT population FROM world WHERE name='Germany'))*100,0),'%') 
    FROM world
WHERE continent='Europe'


/* 6 -> Which countries have a GDP greater than every country in Europe? [Give the name only.] 
(Some countries may have NULL gdp values)  */
SELECT name FROM world
WHERE gdp > (SELECT max(gdp) FROM world
               WHERE continent='Europe')  
     
     
/* 7 -> Find the largest country (by area) in each continent, 
show the continent, the name and the area:  */
SELECT continent, name, area
FROM world as x
WHERE name = (
    SELECT name FROM world as y
    WHERE x.continent = y.continent
    ORDER BY area DESC
    LIMIT 1
)


/* 8 -> List each continent and the name of the country that comes first alphabetically. */
SELECT continent, name
FROM world AS x
WHERE name =(
            SELECT name FROM world AS y
            WHERE x.continent = y.continent
            ORDER BY name
            LIMIT 1
)


/* 9 -> Find the continents where all countries have a population <= 25000000. 
Then find the names of the countries associated with these continents. 
Show name, continent and population.  */
SELECT name, continent, population
FROM world AS x
WHERE 25000000 > ALL(
          SELECT population FROM world AS y
          WHERE x.continent = y.continent        /* using ALL() */
)


/* 10 -> Some countries have populations more than three times that of any of their neighbours (in the same continent). 
Give the countries and continents. */
SELECT name,continent 
FROM world AS x
WHERE population/3 > ALL(
        SELECT population FROM world AS y
        WHERE x.continent = y.continent AND
        x.name <> y.name
)





