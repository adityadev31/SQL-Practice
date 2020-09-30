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
SELECT actor.name
FROM casting
JOIN actor ON actorid = id
WHERE movieid = 11768



