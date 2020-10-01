/*


       movie
       
id	title	yr	director	budget	gross
10001	$	1971	3	null	null
10002	"Crocodile" Dundee	1986	19	null	328203506
10003	"Crocodile" Dundee II	1988	36	15800000	239606210
10004	'Til There Was You	1997	49	10000000	null
10005	'Til We Meet Again	1940	65	null	null
10006	Ã…dalen 31	1969	77	null	null
10007	Ã†on Flux	2005	82	62000000	52304001



           casting
           
           
movieid	actorid	ord
10001	4	1
10001	5	2
10001	6	3
10001	7	4
10001	8	5
10001	9	6



       actor
       
 id	name
30509	Tori Amos
2	
35329	Barbara Leake
12445	Don Pike
41202	Jill Remez
29400	Elsa Peterson


*/


/* 1-> List the films where the yr is 1962 [Show id, title] */
SELECT id, title
 FROM movie
where yr = 1962



/* 2 -> Give year of 'Citizen Kane'. */
SELECT yr
FROM movie
WHERE title =  'Citizen Kane'

/* 3 -> List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. */
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star%Trek%'
ORDER BY yr


/* 4 -> What id number does the actor 'Glenn Close' have? */
SELECT id
FROM actor
WHERE name = 'Glenn Close'


/* 5 -> What is the id of the film 'Casablanca' */
SELECT id
FROM movie
WHERE title = 'Casablanca'


/* 6 -> Obtain the cast list for 'Casablanca'.

what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question) */

SELECT actor.name FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON movie.id = casting.movieid
WHERE movie.title = 'Casablanca'
/*
SELECT actor.name
FROM casting
JOIN actor ON actorid = id
WHERE movieid = 11768
*/


/* 7 -> Obtain the cast list for the film 'Alien' */
SELECT actor.name FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON movie.id = casting.movieid
WHERE movie.title = 'Alien'


/* 8 -> List the films in which 'Harrison Ford' has appeared */
SELECT movie.title FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name =  'Harrison Ford'


/* 9 -> List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] */
SELECT movie.title FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name =  'Harrison Ford' AND
casting.ord != 1


/* 10 -> List the films together with the leading star for all 1962 films. */
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1962 AND
casting.ord = 1


/* 11 -> Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. */
SELECT movie.yr, COUNT(movie.id)
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Rock Hudson'
GROUP BY movie.yr
HAVING COUNT(movie.id) > 2


/* 12 -> List the film title and the leading actor for all of the films 'Julie Andrews' played in. */
SELECT movie.title, actor.name
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN(
    SELECT casting.movieid FROM casting
    JOIN actor ON actor.id = casting.actorid
    WHERE actor.name = 'Julie Andrews'
) AND casting.ord = 1


/* 13 -> Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. */
SELECT actor.name FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.ord)>=15

