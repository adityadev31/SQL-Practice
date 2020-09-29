/*
          database ====> GAME
          
          
                 game 
id 	     mdate 	    stadium 	              team1 	team2
1001 	8 June 2012 	National Stadium, Warsaw 	POL 	GRE
1002 	8 June 2012 	Stadion Miejski (Wroclaw) 	RUS 	CZE
1003 	12 June 2012 	Stadion Miejski (Wroclaw) 	GRE 	CZE
1004 	12 June 2012 	National Stadium, Warsaw 	POL 	RUS


                 goal 
matchid 	teamid 	player 	gtime
1001 	    POL 	Robert Lewandowski 	17
1001    	GRE 	Dimitris Salpingidis 	51
1002    	RUS 	Alan Dzagoev 	15
1002    	RUS 	Roman Pavlyuchenko 	82


                  eteam 
id  	teamname 	coach
POL 	Poland 	Franciszek Smuda
RUS 	Russia 	Dick Advocaat
CZE 	Czech Republic 	Michal Bilek
GRE 	Greece 	Fernando Santos


*/



/* 1 -> The first example shows the goal scored by a player with the last name 'Bender'. 
The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
Modify it to show the matchid and player name for all goals scored by Germany. 
To identify German players, check for: teamid = 'GER' */
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'


/* 2 -> From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.
Show id, stadium, team1, team2 for just game 1012 */













