/*
               database ( world )
               
name	       continent	  area	     population	   gdp
Afghanistan	 Asia	      652230	   25500100	     20343000000
Albania	     Europe	    28748	     2831741	     12960000000
Algeria	     Africa	    2381741	   37100000	     188681000000
Andorra	     Europe	    468	       78115	       3712000000
Angola	     Africa	    1246700  	 20609294	     100990000000


*/



/* 1 -> The example uses a WHERE clause to show the population of 'France'. 
Note that strings (pieces of text that are data) should be in 'single quotes';
Modify it to show the population of Germany*/
SELECT population FROM world 
WHERE name = 'Germany'
